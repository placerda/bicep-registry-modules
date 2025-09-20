metadata name = 'AI/ML Landing Zone'
metadata description = 'Deploys a secure AI/ML landing zone (resource groups, networking, AI services, private endpoints, and guardrails) using AVM resource modules.'
///////////////////////////////////////////////////////////////////////////////////////////////////
// main.bicep
//
// Purpose: Landing Zone for GenAI app resources + AI Foundry pattern, network-isolated by default.
//
// -----------------------------------------------------------------------------------------------
// About this template
//
// - Strong typing: All parameter shapes are defined as User-Defined Types (UDTs) in `common/types.bicep`
//   (e.g., `types.appGatewayDefinitionType`, `types.privateDnsZonesDefinitionType`, etc.).
//
// - AVM alignment: This template orchestrates multiple Azure Verified Modules (AVM). For each module,
//   parameters are intentionally aligned to the upstream AVM schema. When a setting is not provided here,
//   we pass `null` (or omit) so the AVM module’s own default is used.
//
// - Opinionated defaults: Because this is a landing-zone template, some safe defaults are overridden here
//   (e.g., WAF policy wiring, sensible VNet/subnet layout, secure TLS flags). You can override any of these
//   via the corresponding *Definition objects.
//
// - Create vs. reuse: Each service follows a uniform pattern—`resourceIds.*` (reuse) + `deployToggles.*` (create).
//   The computed flags `varDeploy*` and `varHas*` determine whether a resource is created or referenced.
//
// - Section mapping: The numbered index in section 2 mirrors the module layout, making it easy to jump
//   between the guide and the actual module blocks.
//
// - How to use: See the provided examples for end-to-end parameter files showing different deployment
//   configurations (create-new vs. reuse-existing, etc.).
// -----------------------------------------------------------------------------------------------

// How to read this file:
//   1  GLOBAL PARAMETERS and VARIABLES
//       1.1 Imports
//       1.2 General Configuration (location, tags, naming token, global flags)
//       1.3 Reuse existing services (resourceIds)
//       1.4 Deploy Toggles
//       1.5 Deployment switches & "has" state (create vs reuse)
//   2  RESOURCES
//       2.1. Networking - Virtual Network (VNet) and Subnets
//       2.2. Networking - Hub-to-Spoke VNet Peering (if desired)
//       2.3. Networking - Private DNS Zones (for Private Endpoints)
//       2.3.1. APIM
//       2.3.2. Cognitiveservices
//       2.3.3. OpenAI
//       2.3.4. AI Services
//       2.3.5. Search
//       2.3.6. Cosmos (SQL)
//       2.3.7. Blob
//       2.3.8. Key Vault
//       2.3.9. App Configuration
//       2.3.10. Container Apps
//       2.3.11. Container Registry PDNS
//       2.3.12. App Insights PDNS
//       2.4. Networking - Private Endpoints
//       2.4.1. App Configuration
//       2.4.2. APIM
//       2.4.3. Container Apps Environment
//       2.4.4. Azure Container Registry
//       2.4.5. Storage (blob)
//       2.4.6. Cosmos DB (SQL)
//       2.4.7. Azure AI Search
//       2.4.8. Key Vault (GenAI)
//       2.5. AI Foundry
//       2.6. Gateways - API Management
//       2.7. Gateways - Application Gateway
//       2.8. Gateways - Web Application Firewall (WAF) Policy
//       2.9. Gateways - Application Gateway Public IP
//       2.10. Gateways - Azure Firewall
//       2.11. Gateways - Azure Firewall Policy
//       2.12. Observability - Log Analytics Workspace
//       2.13. Observability - Application Insights
//       2.14. Container App Environment
//       2.15. App Configuration Store
//       2.16. Container Apps
//       2.17. Cosmos DB Account (GenAI app scope)
//       2.18. Key Vault (GenAI app scope)
//       2.19. Storage Account (GenAI app scope)
//       2.20. AI Search (GenAI app scope)
//       2.21. Grounding with Bing
//       2.22. VMs - Build VM configuration
//       2.23. VMs - Jumpbox VM configuration  (Windows, Bastion-accessed)
//   3  OUTPUTS

//////////////////////////////////////////////////////////////////////////
// 1. GLOBAL PARAMETERS and VARIABLES
//////////////////////////////////////////////////////////////////////////

// 1.1 Imports
import * as types from 'common/types.bicep'

// 1.2 General Configuration (location, tags, naming token, global flags)
@description('Optional.  Base name to seed resource names; defaults to a 12-char token.')
param baseName string = substring(resourceToken, 0, 12)

@description('Optional. Enable/Disable usage telemetry for module.')
param enableTelemetry bool = true

@description('Optional.  Enable platform landing zone integration.')
param flagPlatformLandingZone bool = false

@description('Optional. Azure region for AI LZ resources. Defaults to the resource group location.')
param location string = resourceGroup().location

@description('Optional.  Deterministic token for resource names; auto-generated if not provided.')
param resourceToken string = toLower(uniqueString(subscription().id, resourceGroup().name, location))

@description('Optional.  Tags applied to all deployed resources.')
param tags object = {}

// Secrets/Tokens
@secure()
@description('Conditional. Local admin password for the Windows JumpVM. Required if deployToggles.jumpVm is true.')
param jumpVmAdminPassword string?

@secure()
@description('Optional. PAT used to register the Azure DevOps agent (when runner = azdo).')
param azdoPat string?

@secure()
@description('Optional. PAT used to request a GitHub runner registration token (when runner = github).')
param githubPat string?

// 1.3 Deploy Toggles (per-service on/off; reuse still works via resourceIds)
@description('Optional.  Per-service deployment toggles; set false to skip creating a service. Reuse still works via resourceIds.')
param deployToggles types.deployTogglesType = {
  apiManagement: true
  appConfig: true
  appInsights: true
  applicationGateway: true
  applicationGatewayPublicIp: true
  bastionHost: true
  buildVm: true
  containerApps: true
  containerEnv: true
  containerRegistry: true
  cosmosDb: true
  firewall: true
  groundingWithBingSearch: true
  jumpVm: true
  keyVault: true
  logAnalytics: true
  searchService: true
  storageAccount: true
  virtualNetwork: true
  wafPolicy: true
}

// 1.4 Reuse Existing Services (resource IDs to reuse, leave empty to create)
@description('Optional.  Existing resource IDs to reuse; leave empty to create new resources.')
param resourceIds types.resourceIdsType = {
  apimServiceResourceId: ''
  appConfigResourceId: ''
  appInsightsResourceId: ''
  applicationGatewayResourceId: ''
  bastionHostResourceId: ''
  containerEnvResourceId: ''
  containerRegistryResourceId: ''
  dbAccountResourceId: ''
  firewallResourceId: ''
  groundingServiceResourceId: ''
  keyVaultResourceId: ''
  logAnalyticsWorkspaceResourceId: ''
  searchServiceResourceId: ''
  storageAccountResourceId: ''
  virtualNetworkResourceId: ''
}

// 1.5 Deployment switches & "has" state (create vs reuse)
var varDeploySa = empty(resourceIds.storageAccountResourceId!) && deployToggles.storageAccount
var varDeployCosmos = empty(resourceIds.dbAccountResourceId!) && deployToggles.cosmosDb
var varDeploySearch = empty(resourceIds.searchServiceResourceId!) && deployToggles.searchService
var varDeployKv = empty(resourceIds.keyVaultResourceId!) && deployToggles.keyVault
var varDeployContainerAppEnv = empty(resourceIds.containerEnvResourceId!) && deployToggles.containerEnv
var varDeployContainerApps = varHasContainerEnv && deployToggles.containerApps && length(containerAppsList) > 0
var varDeployAppConfig = empty(resourceIds.appConfigResourceId!) && deployToggles.appConfig
var varDeployAcr = empty(resourceIds.containerRegistryResourceId!) && deployToggles.containerRegistry
var varDeployApim = empty(resourceIds.apimServiceResourceId!) && deployToggles.apiManagement
var varDeployAppGateway = empty(resourceIds.applicationGatewayResourceId!) && deployToggles.applicationGateway
var varDeployFirewall = empty(resourceIds.firewallResourceId!) && deployToggles.firewall
var varDeployAfwPolicy = varDeployFirewall && (!contains(firewallDefinition, 'firewallPolicyId') || empty(firewallDefinition.firewallPolicyId!))
var varDeployVnet = empty(resourceIds.virtualNetworkResourceId!) && deployToggles.virtualNetwork
var varDeployAppGatewayPublicIp = contains(deployToggles, 'applicationGatewayPublicIp')
  ? bool(deployToggles.applicationGatewayPublicIp)
  : true
var varDeployLogAnalytics = empty(resourceIds.logAnalyticsWorkspaceResourceId!) && deployToggles.logAnalytics
var varDeployAppInsights = empty(resourceIds.appInsightsResourceId!) && deployToggles.appInsights && varHasLogAnalytics

var varIsPlatformLz = flagPlatformLandingZone
var varDeployPdnsAndPe = !varIsPlatformLz
var varDeployBuildVm = deployToggles.buildVm && !varIsPlatformLz
var varDeployJumpVm = deployToggles.jumpVm && !varIsPlatformLz && !empty(jumpVmAdminPassword)

var varHasApim = (!empty(resourceIds.apimServiceResourceId!)) || (varDeployApim)
var varHasStorage = (!empty(resourceIds.storageAccountResourceId!)) || (varDeploySa)
var varHasCosmos = (!empty(resourceIds.dbAccountResourceId!)) || (varDeployCosmos)
var varHasSearch = (!empty(resourceIds.searchServiceResourceId!)) || (varDeploySearch)
var varHasKv = (!empty(resourceIds.keyVaultResourceId!)) || (varDeployKv)
var varHasContainerEnv = (!empty(resourceIds.containerEnvResourceId!)) || (varDeployContainerAppEnv)
var varHasAppConfig = (!empty(resourceIds.appConfigResourceId!)) || (varDeployAppConfig)
var varHasAcr = (!empty(resourceIds.containerRegistryResourceId!)) || (varDeployAcr)
var varHasLogAnalytics = (!empty(resourceIds.logAnalyticsWorkspaceResourceId!)) || (varDeployLogAnalytics)
var varHasAppInsights = (!empty(resourceIds.appInsightsResourceId!)) || (varDeployAppInsights)

//////////////////////////////////////////////////////////////////////////
// 2. RESOURCES
//////////////////////////////////////////////////////////////////////////

#disable-next-line no-deployments-resources
resource avmTelemetry 'Microsoft.Resources/deployments@2024-03-01' = if (enableTelemetry) {
  name: '46d3xbcp.ptn.aiml-lz.${substring(uniqueString(deployment().name, location), 0, 4)}'
  properties: {
    mode: 'Incremental'
    template: {
      '$schema': 'https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#'
      contentVersion: '1.0.0.0'
      resources: []
      outputs: {
        telemetry: {
          type: 'String'
          value: 'For more information, see https://aka.ms/avm/TelemetryInfo'
        }
      }
    }
  }
}

// 2.1. Networking - Virtual Network (VNet) and Subnets

@description('Conditional. Virtual Network configuration. Required if deployToggles.virtualNetwork is true and resourceIds.virtualNetworkResourceId is empty.')
param vNetDefinition types.vNetDefinitionType = {
  // Required
  addressPrefixes: [
    '192.168.0.0/23'
  ]
  name: ''
}

@description('Conditional. Subnet names configuration. Required if you want to use names different than the defaults names for the subnets.')
param subnetsNamesDefinition types.subnetNamesDefinitionType = {
  pe: ''
  agent: ''
  applicationGateway: ''
  apiManagement: ''
  acaEnvironment: ''
  jumpbox: ''
  devopsBuildAgents: ''
}

@description('Optional. NSG definitions per subnet role; each entry deploys an NSG for that subnet when a non-empty name is provided.')
param nsgDefinitions types.nsgPerSubnetDefinitionsType?

// Deploy toggles (computed from presence of a name)
var deployNsgAgent = !empty(nsgDefinitions!.agent!.name)
var deployNsgPe = !empty(nsgDefinitions!.pe!.name)
var deployNsgAppGw = !empty(nsgDefinitions!.applicationGateway!.name)
var deployNsgApim = !empty(nsgDefinitions!.apiManagement!.name)
var deployNsgJumpbox = !empty(nsgDefinitions!.jumpbox!.name)
var deployNsgAcaEnv = !empty(nsgDefinitions!.acaEnvironment!.name)
var deployNsgDevopsBuildAgents = !empty(nsgDefinitions!.devopsBuildAgents!.name)

// Agent subnet NSG
module nsgAgent 'br/public:avm/res/network/network-security-group:0.5.1' = if (deployNsgAgent) {
  name: 'nsg-agent'
  params: {
    name: nsgDefinitions!.agent!.name
    location: nsgDefinitions!.agent!.location! ?? location
    enableTelemetry: nsgDefinitions!.agent!.enableTelemetry! ?? enableTelemetry
    flushConnection: nsgDefinitions!.agent!.flushConnection! ?? null
    diagnosticSettings: !empty(nsgDefinitions!.agent!.diagnosticSettings!)
      ? nsgDefinitions!.agent!.diagnosticSettings!
      : null
    lock: !empty(nsgDefinitions!.agent!.lock!) ? nsgDefinitions!.agent!.lock! : null
    roleAssignments: !empty(nsgDefinitions!.agent!.roleAssignments!) ? nsgDefinitions!.agent!.roleAssignments! : null
    securityRules: !empty(nsgDefinitions!.agent!.securityRules!) ? nsgDefinitions!.agent!.securityRules! : null
    tags: !empty(nsgDefinitions!.agent!.tags!) ? nsgDefinitions!.agent!.tags! : tags
  }
}

// Private Endpoints subnet NSG
module nsgPe 'br/public:avm/res/network/network-security-group:0.5.1' = if (deployNsgPe) {
  name: 'nsg-pe'
  params: {
    name: nsgDefinitions!.pe!.name
    location: nsgDefinitions!.pe!.location! ?? location
    enableTelemetry: nsgDefinitions!.pe!.enableTelemetry! ?? enableTelemetry
    flushConnection: nsgDefinitions!.pe!.flushConnection! ?? null
    diagnosticSettings: !empty(nsgDefinitions!.pe!.diagnosticSettings!) ? nsgDefinitions!.pe!.diagnosticSettings! : null
    lock: !empty(nsgDefinitions!.pe!.lock!) ? nsgDefinitions!.pe!.lock! : null
    roleAssignments: !empty(nsgDefinitions!.pe!.roleAssignments!) ? nsgDefinitions!.pe!.roleAssignments! : null
    securityRules: !empty(nsgDefinitions!.pe!.securityRules!) ? nsgDefinitions!.pe!.securityRules! : null
    tags: !empty(nsgDefinitions!.pe!.tags!) ? nsgDefinitions!.pe!.tags! : tags
  }
}

// Application Gateway subnet NSG
module nsgAppGateway 'br/public:avm/res/network/network-security-group:0.5.1' = if (deployNsgAppGw) {
  name: 'nsg-appgw'
  params: {
    name: nsgDefinitions!.applicationGateway!.name
    location: nsgDefinitions!.applicationGateway!.location! ?? location
    enableTelemetry: nsgDefinitions!.applicationGateway!.enableTelemetry! ?? enableTelemetry
    flushConnection: nsgDefinitions!.applicationGateway!.flushConnection! ?? null
    diagnosticSettings: !empty(nsgDefinitions!.applicationGateway!.diagnosticSettings!)
      ? nsgDefinitions!.applicationGateway!.diagnosticSettings!
      : null
    lock: !empty(nsgDefinitions!.applicationGateway!.lock!) ? nsgDefinitions!.applicationGateway!.lock! : null
    roleAssignments: !empty(nsgDefinitions!.applicationGateway!.roleAssignments!)
      ? nsgDefinitions!.applicationGateway!.roleAssignments!
      : null
    securityRules: !empty(nsgDefinitions!.applicationGateway!.securityRules!)
      ? nsgDefinitions!.applicationGateway!.securityRules!
      : null
    tags: !empty(nsgDefinitions!.applicationGateway!.tags!) ? nsgDefinitions!.applicationGateway!.tags! : tags
  }
}

// API Management subnet NSG
module nsgApim 'br/public:avm/res/network/network-security-group:0.5.1' = if (deployNsgApim) {
  name: 'nsg-apim'
  params: {
    name: nsgDefinitions!.apiManagement!.name
    location: nsgDefinitions!.apiManagement!.location! ?? location
    enableTelemetry: nsgDefinitions!.apiManagement!.enableTelemetry! ?? enableTelemetry
    flushConnection: nsgDefinitions!.apiManagement!.flushConnection! ?? null
    diagnosticSettings: !empty(nsgDefinitions!.apiManagement!.diagnosticSettings!)
      ? nsgDefinitions!.apiManagement!.diagnosticSettings!
      : null
    lock: !empty(nsgDefinitions!.apiManagement!.lock!) ? nsgDefinitions!.apiManagement!.lock! : null
    roleAssignments: !empty(nsgDefinitions!.apiManagement!.roleAssignments!)
      ? nsgDefinitions!.apiManagement!.roleAssignments!
      : null
    securityRules: !empty(nsgDefinitions!.apiManagement!.securityRules!)
      ? nsgDefinitions!.apiManagement!.securityRules!
      : null
    tags: !empty(nsgDefinitions!.apiManagement!.tags!) ? nsgDefinitions!.apiManagement!.tags! : tags
  }
}

module nsgAcaEnv 'br/public:avm/res/network/network-security-group:0.5.1' = if (deployNsgAcaEnv) {
  name: 'nsg-aca-env'
  params: {
    name: nsgDefinitions!.acaEnvironment!.name
    location: nsgDefinitions!.acaEnvironment!.location! ?? location
    enableTelemetry: nsgDefinitions!.acaEnvironment!.enableTelemetry! ?? enableTelemetry
    flushConnection: nsgDefinitions!.acaEnvironment!.flushConnection! ?? null
    diagnosticSettings: !empty(nsgDefinitions!.acaEnvironment!.diagnosticSettings!)
      ? nsgDefinitions!.acaEnvironment!.diagnosticSettings!
      : null
    lock: !empty(nsgDefinitions!.acaEnvironment!.lock!) ? nsgDefinitions!.acaEnvironment!.lock! : null
    roleAssignments: !empty(nsgDefinitions!.acaEnvironment!.roleAssignments!)
      ? nsgDefinitions!.acaEnvironment!.roleAssignments!
      : null
    securityRules: !empty(nsgDefinitions!.acaEnvironment!.securityRules!)
      ? nsgDefinitions!.acaEnvironment!.securityRules!
      : null
    tags: !empty(nsgDefinitions!.acaEnvironment!.tags!) ? nsgDefinitions!.acaEnvironment!.tags! : tags
  }
}

// Jumpbox subnet NSG
module nsgJumpbox 'br/public:avm/res/network/network-security-group:0.5.1' = if (deployNsgJumpbox) {
  name: 'nsg-jumpbox'
  params: {
    name: nsgDefinitions!.jumpbox!.name
    location: nsgDefinitions!.jumpbox!.location! ?? location
    enableTelemetry: nsgDefinitions!.jumpbox!.enableTelemetry! ?? enableTelemetry
    flushConnection: nsgDefinitions!.jumpbox!.flushConnection! ?? null
    diagnosticSettings: !empty(nsgDefinitions!.jumpbox!.diagnosticSettings!)
      ? nsgDefinitions!.jumpbox!.diagnosticSettings!
      : null
    lock: !empty(nsgDefinitions!.jumpbox!.lock!) ? nsgDefinitions!.jumpbox!.lock! : null
    roleAssignments: !empty(nsgDefinitions!.jumpbox!.roleAssignments!)
      ? nsgDefinitions!.jumpbox!.roleAssignments!
      : null
    securityRules: !empty(nsgDefinitions!.jumpbox!.securityRules!) ? nsgDefinitions!.jumpbox!.securityRules! : null
    tags: !empty(nsgDefinitions!.jumpbox!.tags!) ? nsgDefinitions!.jumpbox!.tags! : tags
  }
}

// DevOps build agents subnet NSG
module nsgDevopsBuildAgents 'br/public:avm/res/network/network-security-group:0.5.1' = if (deployNsgDevopsBuildAgents) {
  name: 'nsg-devops-build-agents'
  params: {
    name: nsgDefinitions!.devopsBuildAgents!.name
    location: nsgDefinitions!.devopsBuildAgents!.location! ?? location
    enableTelemetry: nsgDefinitions!.devopsBuildAgents!.enableTelemetry! ?? enableTelemetry
    flushConnection: nsgDefinitions!.devopsBuildAgents!.flushConnection! ?? null
    diagnosticSettings: !empty(nsgDefinitions!.devopsBuildAgents!.diagnosticSettings!)
      ? nsgDefinitions!.devopsBuildAgents!.diagnosticSettings!
      : null
    lock: !empty(nsgDefinitions!.devopsBuildAgents!.lock!) ? nsgDefinitions!.devopsBuildAgents!.lock! : null
    roleAssignments: !empty(nsgDefinitions!.devopsBuildAgents!.roleAssignments!)
      ? nsgDefinitions!.devopsBuildAgents!.roleAssignments!
      : null
    securityRules: !empty(nsgDefinitions!.devopsBuildAgents!.securityRules!)
      ? nsgDefinitions!.devopsBuildAgents!.securityRules!
      : null
    tags: !empty(nsgDefinitions!.devopsBuildAgents!.tags!) ? nsgDefinitions!.devopsBuildAgents!.tags! : tags
  }
}

// VNet variables

resource existingVNet 'Microsoft.Network/virtualNetworks@2024-07-01' existing = if (!empty(resourceIds.virtualNetworkResourceId!)) {
  name: varExistingVNetName
  scope: resourceGroup(varExistingVNetSubscriptionId, varExistingVNetResourceGroupName)
}
var varVnetIdSegments = empty(resourceIds.virtualNetworkResourceId!)
  ? ['']
  : split(resourceIds.virtualNetworkResourceId!, '/')
var varExistingVNetSubscriptionId = length(varVnetIdSegments) >= 3 ? varVnetIdSegments[2] : ''
var varExistingVNetResourceGroupName = length(varVnetIdSegments) >= 5 ? varVnetIdSegments[4] : ''
var varExistingVNetName = length(varVnetIdSegments) >= 1 ? last(varVnetIdSegments) : ''

var varVnetName = !empty(resourceIds.virtualNetworkResourceId!)
  ? varExistingVNetName
  : (empty(vNetDefinition.name!) ? 'vnet-${baseName}' : vNetDefinition.name!)

#disable-next-line BCP318
var varVnetResourceId = !empty(resourceIds.virtualNetworkResourceId!)
  ? existingVNet.id
  : (varDeployVnet ? vNetwork!.outputs.resourceId : '')

// Subnet variables

var varPeSubnetName = empty(subnetsNamesDefinition.pe!) ? 'pe-subnet' : subnetsNamesDefinition.pe!

var varAgentSubnetName = empty(subnetsNamesDefinition.agent!) ? 'agent-subnet' : subnetsNamesDefinition.agent!

var varAgwSubnetName = empty(subnetsNamesDefinition.applicationGateway!)
  ? 'AppGatewaySubnet'
  : subnetsNamesDefinition.applicationGateway!

var varApimSubnetName = empty(subnetsNamesDefinition.apiManagement!)
  ? 'api-management-subnet'
  : subnetsNamesDefinition.apiManagement!

var varAcaInfraSubnetName = empty(subnetsNamesDefinition.acaEnvironment!)
  ? 'aca-environment-subnet'
  : subnetsNamesDefinition.acaEnvironment!

var varJumpSubnetName = empty(subnetsNamesDefinition.jumpbox!) ? 'jumpbox-subnet' : subnetsNamesDefinition.jumpbox!

var varBuildSubnetName = empty(subnetsNamesDefinition.devopsBuildAgents!)
  ? 'devops-build-agents-subnet'
  : subnetsNamesDefinition.devopsBuildAgents!

var varPeSubnetId = empty(resourceIds.virtualNetworkResourceId!)
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', varVnetName, varPeSubnetName)
  : '${resourceIds.virtualNetworkResourceId!}/subnets/${varPeSubnetName}'

var varAgentSubnetId = empty(resourceIds.virtualNetworkResourceId!)
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', varVnetName, varAgentSubnetName)
  : '${resourceIds.virtualNetworkResourceId!}/subnets/${varAgentSubnetName}'

var varAgwSubnetId = empty(resourceIds.virtualNetworkResourceId!)
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', varVnetName, varAgwSubnetName)
  : '${resourceIds.virtualNetworkResourceId!}/subnets/${varAgwSubnetName}'

var varApimSubnetId = empty(resourceIds.virtualNetworkResourceId!)
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', varVnetName, varApimSubnetName)
  : '${resourceIds.virtualNetworkResourceId!}/subnets/${varApimSubnetName}'

var varAcaInfraSubnetId = empty(resourceIds.virtualNetworkResourceId!)
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', varVnetName, varAcaInfraSubnetName)
  : '${resourceIds.virtualNetworkResourceId!}/subnets/${varAcaInfraSubnetName}'

var varJumpSubnetId = empty(resourceIds.virtualNetworkResourceId!)
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', varVnetName, varJumpSubnetName)
  : '${resourceIds.virtualNetworkResourceId!}/subnets/${varJumpSubnetName}'

var varBuildSubnetId = empty(resourceIds.virtualNetworkResourceId!)
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', varVnetName, varBuildSubnetName)
  : '${resourceIds.virtualNetworkResourceId!}/subnets/${varBuildSubnetName}'

// Resource IDs for wiring
var nsgIdAgent = deployNsgAgent ? nsgAgent!.outputs.resourceId : ''
var nsgIdPe = deployNsgPe ? nsgPe!.outputs.resourceId : ''
var nsgIdAppGw = deployNsgAppGw ? nsgAppGateway!.outputs.resourceId : ''
var nsgIdApim = deployNsgApim ? nsgApim!.outputs.resourceId : ''
var nsgIdAcaEnv = deployNsgAcaEnv ? nsgAcaEnv!.outputs.resourceId : ''
var nsgIdJump = deployNsgJumpbox ? nsgJumpbox!.outputs.resourceId : ''
var nsgIdDevopsBuildAgents = deployNsgDevopsBuildAgents ? nsgDevopsBuildAgents!.outputs.resourceId : ''

module vNetwork 'br/public:avm/res/network/virtual-network:0.7.0' = if (varDeployVnet) {
  name: 'vNetworkDeployment'
  params: {
    // Required
    addressPrefixes: vNetDefinition.addressPrefixes
    name: varVnetName

    // Optionals
    subnets: !empty(vNetDefinition.?subnets)
      ? vNetDefinition.subnets!
      : [
          {
            enabled: true
            name: varAgentSubnetName
            addressPrefix: '192.168.0.0/25'
            delegation: 'Microsoft.App/environments'
            serviceEndpoints: ['Microsoft.CognitiveServices']
            networkSecurityGroupResourceId: !empty(nsgIdAgent) ? nsgIdAgent : null
          }
          {
            enabled: true
            name: varPeSubnetName
            addressPrefix: '192.168.1.64/28'
            serviceEndpoints: ['Microsoft.AzureCosmosDB']
            privateEndpointNetworkPolicies: 'Disabled'
            networkSecurityGroupResourceId: !empty(nsgIdPe) ? nsgIdPe : null
          }
          {
            enabled: true
            name: varAgwSubnetName
            addressPrefix: '192.168.0.128/26'
            networkSecurityGroupResourceId: !empty(nsgIdAppGw) ? nsgIdAppGw : null
          }
          {
            enabled: true
            name: 'AzureBastionSubnet'
            addressPrefix: '192.168.0.192/26'
          }
          {
            enabled: true
            name: 'AzureFirewallSubnet'
            addressPrefix: '192.168.1.0/26'
          }
          {
            enabled: true
            name: varApimSubnetName
            addressPrefix: '192.168.1.80/28'
            networkSecurityGroupResourceId: !empty(nsgIdApim) ? nsgIdApim : null
          }
          {
            enabled: true
            name: varJumpSubnetName
            addressPrefix: '192.168.1.96/28'
            networkSecurityGroupResourceId: !empty(nsgIdJump) ? nsgIdJump : null
          }
          {
            enabled: true
            name: varAcaInfraSubnetName
            addressPrefix: '192.168.1.112/28'
            delegation: 'Microsoft.App/environments'
            serviceEndpoints: ['Microsoft.AzureCosmosDB']
            networkSecurityGroupResourceId: !empty(nsgIdAcaEnv) ? nsgIdAcaEnv : null
          }
          {
            enabled: true
            name: varBuildSubnetName
            addressPrefix: '192.168.1.128/28'
            networkSecurityGroupResourceId: !empty(nsgIdDevopsBuildAgents) ? nsgIdDevopsBuildAgents : null
          }
        ]

    location: !empty(vNetDefinition.?location) ? vNetDefinition.location! : location

    ddosProtectionPlanResourceId: !empty(vNetDefinition.?ddosProtectionPlanResourceId)
      ? vNetDefinition.ddosProtectionPlanResourceId!
      : null

    diagnosticSettings: !empty(vNetDefinition.?diagnosticSettings) ? vNetDefinition.diagnosticSettings! : null

    dnsServers: !empty(vNetDefinition.?dnsServers) ? vNetDefinition.dnsServers! : null

    enableTelemetry: enableTelemetry

    enableVmProtection: contains(vNetDefinition, 'enableVmProtection') ? vNetDefinition.enableVmProtection! : null

    flowTimeoutInMinutes: contains(vNetDefinition, 'flowTimeoutInMinutes') ? vNetDefinition.flowTimeoutInMinutes! : null

    ipamPoolNumberOfIpAddresses: contains(vNetDefinition, 'ipamPoolNumberOfIpAddresses')
      ? vNetDefinition.ipamPoolNumberOfIpAddresses!
      : null

    lock: !empty(vNetDefinition.?lock) ? vNetDefinition.lock! : null

    peerings: !empty(vNetDefinition.?peerings) ? vNetDefinition.peerings! : null

    roleAssignments: !empty(vNetDefinition.?roleAssignments) ? vNetDefinition.roleAssignments! : null

    tags: !empty(vNetDefinition.?tags) ? vNetDefinition.tags! : tags

    virtualNetworkBgpCommunity: !empty(vNetDefinition.?virtualNetworkBgpCommunity)
      ? vNetDefinition.virtualNetworkBgpCommunity!
      : null

    vnetEncryption: contains(vNetDefinition, 'vnetEncryption') ? vNetDefinition.vnetEncryption! : null

    vnetEncryptionEnforcement: !empty(vNetDefinition.?vnetEncryptionEnforcement)
      ? vNetDefinition.vnetEncryptionEnforcement!
      : null
  }
}

// 2.2. Networking - Hub-to-Spoke VNet Peering (if desired)
@description('Conditional. Hub VNet peering configuration. Required if you plan to establish hub-spoke peering.')
param hubVnetPeeringDefinition types.hubVnetPeeringDefinitionType = {
  name: ''
  createReversePeering: true
  peerVnetResourceId: ''
  firewallIpAddress: ''
  allowForwardedTraffic: true
  allowGatewayTransit: false
  allowVirtualNetworkAccess: true
  reverseAllowForwardedTraffic: true
  reverseAllowGatewayTransit: false
  reverseAllowVirtualNetworkAccess: true
  reverseName: ''
  reverseUseRemoteGateways: false
  useRemoteGateways: false
}

// Naming
var varHubPeerVnetId = hubVnetPeeringDefinition.peerVnetResourceId!
var varHubPeerParts = split(varHubPeerVnetId, '/')
var varHubPeerSub = length(varHubPeerParts) >= 3 ? varHubPeerParts[2] : ''
var varHubPeerRg = length(varHubPeerParts) >= 5 ? varHubPeerParts[4] : ''
var varHubPeerVnetName = length(varHubPeerParts) >= 9 ? varHubPeerParts[8] : ''

resource peerHubVnet 'Microsoft.Network/virtualNetworks@2024-07-01' existing = if (!empty(varHubPeerVnetId)) {
  name: varHubPeerVnetName
  scope: resourceGroup(varHubPeerSub, varHubPeerRg)
}

module HubToSpokePeering 'br/public:avm/res/network/virtual-network:0.7.0' = if (!empty(varHubPeerVnetId) && hubVnetPeeringDefinition.createReversePeering) {
  name: 'hubReversePeering'
  scope: resourceGroup(varHubPeerSub, varHubPeerRg)
  params: {
    // point the module at the existing hub VNet
    name: varHubPeerVnetName

    // location: prefer existing hub VNet location if present & non-empty, else fallback to deployment location
    location: !empty(peerHubVnet!.location) ? peerHubVnet!.location : location

    // preserve existing address prefixes if the chain exists and is non-empty; otherwise fallback to empty array
    addressPrefixes: !empty(peerHubVnet!.properties.addressSpace.addressPrefixes)
      ? peerHubVnet!.properties.addressSpace.addressPrefixes
      : []

    // DNS servers: use existing if non-empty, else []
    dnsServers: !empty(peerHubVnet!.properties.dhcpOptions.dnsServers)
      ? peerHubVnet!.properties.dhcpOptions.dnsServers
      : []

    // tags: fallback to template-level tags if empty
    tags: !empty(peerHubVnet!.tags) ? peerHubVnet!.tags : tags

    enableTelemetry: enableTelemetry

    peerings: [
      {
        name: empty(hubVnetPeeringDefinition.reverseName!) ? 'to-spoke' : hubVnetPeeringDefinition.reverseName!
        remoteVirtualNetworkResourceId: varVnetResourceId
        allowVirtualNetworkAccess: hubVnetPeeringDefinition.reverseAllowVirtualNetworkAccess!
        allowForwardedTraffic: hubVnetPeeringDefinition.reverseAllowForwardedTraffic!
        allowGatewayTransit: hubVnetPeeringDefinition.reverseAllowGatewayTransit!
        useRemoteGateways: hubVnetPeeringDefinition.reverseUseRemoteGateways!
      }
    ]
  }
  dependsOn: [
    #disable-next-line BCP321
    (empty(resourceIds.virtualNetworkResourceId!)) ? vNetwork : null
  ]
}

// 2.3. Networking - Private DNS Zones (for Private Endpoints)

@description('Conditional. Existing Private DNS Zone resource IDs per service. Required if you plan to reuse existing zones for any service.')
param privateDnsZonesDefinition types.privateDnsZonesDefinitionType = {
  allowInternetResolutionFallback: false
  createNetworkLinks: true
  cognitiveservicesZoneId: ''
  apimZoneId: ''
  openaiZoneId: ''
  aiServicesZoneId: ''
  searchZoneId: ''
  cosmosSqlZoneId: ''
  blobZoneId: ''
  keyVaultZoneId: ''
  appConfigZoneId: ''
  containerAppsZoneId: ''
  acrZoneId: ''
  appInsightsZoneId: ''
  tags: {}
}

var varUseExistingPdz = {
  cognitiveservices: !empty(privateDnsZonesDefinition.cognitiveservicesZoneId!)
  apim: !empty(privateDnsZonesDefinition.apimZoneId!)
  openai: !empty(privateDnsZonesDefinition.openaiZoneId!)
  aiServices: !empty(privateDnsZonesDefinition.aiServicesZoneId!)
  search: !empty(privateDnsZonesDefinition.searchZoneId!)
  cosmosSql: !empty(privateDnsZonesDefinition.cosmosSqlZoneId!)
  blob: !empty(privateDnsZonesDefinition.blobZoneId!)
  keyVault: !empty(privateDnsZonesDefinition.keyVaultZoneId!)
  appConfig: !empty(privateDnsZonesDefinition.appConfigZoneId!)
  containerApps: !empty(privateDnsZonesDefinition.containerAppsZoneId!)
  acr: !empty(privateDnsZonesDefinition.acrZoneId!)
  appInsights: !empty(privateDnsZonesDefinition.appInsightsZoneId!)
}

// 2.3.1. APIM
module privateDnsZoneApim 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.apim) {
  name: 'dep-apim-private-dns-zone'
  params: {
    name: 'privatelink.azure-api.net'
    location: 'global'
    tags: !empty(privateDnsZonesDefinition.?tags) ? privateDnsZonesDefinition.tags! : tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: (contains(privateDnsZonesDefinition, 'createNetworkLinks') && privateDnsZonesDefinition.createNetworkLinks!)
      ? [
          {
            name: '${varVnetName}-apim-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
      : []
  }
}

// 2.3.2. Cognitiveservices
module privateDnsZoneCogSvcs 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.cognitiveservices) {
  name: 'dep-cogsvcs-private-dns-zone'
  params: {
    name: 'privatelink.cognitiveservices.azure.com'
    location: 'global'
    tags: !empty(privateDnsZonesDefinition.?tags) ? privateDnsZonesDefinition.tags! : tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: (contains(privateDnsZonesDefinition, 'createNetworkLinks') && privateDnsZonesDefinition.createNetworkLinks!)
      ? [
          {
            name: '${varVnetName}-cogsvcs-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
      : []
  }
}

// 2.3.3. OpenAI
module privateDnsZoneOpenAi 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.openai) {
  name: 'dep-openai-private-dns-zone'
  params: {
    name: 'privatelink.openai.azure.com'
    location: 'global'
    tags: !empty(privateDnsZonesDefinition.?tags) ? privateDnsZonesDefinition.tags! : tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: (contains(privateDnsZonesDefinition, 'createNetworkLinks') && privateDnsZonesDefinition.createNetworkLinks!)
      ? [
          {
            name: '${varVnetName}-openai-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
      : []
  }
}

// 2.3.4. AI Services
module privateDnsZoneAiService 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.aiServices) {
  name: 'dep-aiservices-private-dns-zone'
  params: {
    name: 'privatelink.services.ai.azure.com'
    location: 'global'
    tags: !empty(privateDnsZonesDefinition.?tags) ? privateDnsZonesDefinition.tags! : tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: (contains(privateDnsZonesDefinition, 'createNetworkLinks') && privateDnsZonesDefinition.createNetworkLinks!)
      ? [
          {
            name: '${varVnetName}-aiservices-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
      : []
  }
}

// 2.3.5. Search
module privateDnsZoneSearch 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.search) {
  name: 'dep-search-std-private-dns-zone'
  params: {
    name: 'privatelink.search.windows.net'
    location: 'global'
    tags: !empty(privateDnsZonesDefinition.?tags) ? privateDnsZonesDefinition.tags! : tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: (contains(privateDnsZonesDefinition, 'createNetworkLinks') && privateDnsZonesDefinition.createNetworkLinks!)
      ? [
          {
            name: '${varVnetName}-search-std-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
      : []
  }
}

// 2.3.6. Cosmos (SQL)
module privateDnsZoneCosmos 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.cosmosSql) {
  name: 'dep-cosmos-std-private-dns-zone'
  params: {
    name: 'privatelink.documents.azure.com'
    location: 'global'
    tags: !empty(privateDnsZonesDefinition.?tags) ? privateDnsZonesDefinition.tags! : tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: (contains(privateDnsZonesDefinition, 'createNetworkLinks') && privateDnsZonesDefinition.createNetworkLinks!)
      ? [
          {
            name: '${varVnetName}-cosmos-std-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
      : []
  }
}

// 2.3.7. Blob
module privateDnsZoneBlob 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.blob) {
  name: 'dep-blob-std-private-dns-zone'
  params: {
    name: 'privatelink.blob.${environment().suffixes.storage}'
    location: 'global'
    tags: !empty(privateDnsZonesDefinition.?tags) ? privateDnsZonesDefinition.tags! : tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: (contains(privateDnsZonesDefinition, 'createNetworkLinks') && privateDnsZonesDefinition.createNetworkLinks!)
      ? [
          {
            name: '${varVnetName}-blob-std-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
      : []
  }
}

// 2.3.8. Key Vault
module privateDnsZoneKeyVault 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.keyVault) {
  name: 'kv-private-dns-zone'
  params: {
    name: 'privatelink.vaultcore.azure.net'
    location: 'global'
    tags: !empty(privateDnsZonesDefinition.?tags) ? privateDnsZonesDefinition.tags! : tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: (contains(privateDnsZonesDefinition, 'createNetworkLinks') && privateDnsZonesDefinition.createNetworkLinks!)
      ? [
          {
            name: '${varVnetName}-kv-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
      : []
  }
}

// 2.3.9. App Configuration
module privateDnsZoneAppConfig 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.appConfig && varHasAppConfig) {
  name: 'appconfig-private-dns-zone'
  params: {
    name: 'privatelink.azconfig.io'
    location: 'global'
    tags: !empty(privateDnsZonesDefinition.?tags) ? privateDnsZonesDefinition.tags! : tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: (contains(privateDnsZonesDefinition, 'createNetworkLinks') && privateDnsZonesDefinition.createNetworkLinks!)
      ? [
          {
            name: '${varVnetName}-appcfg-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
      : []
  }
}

// 2.3.10. Container Apps
module privateDnsZoneContainerApps 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.containerApps && varHasContainerEnv) {
  name: 'dep-containerapps-env-private-dns-zone'
  params: {
    name: 'privatelink.${location}.azurecontainerapps.io'
    location: 'global'
    tags: !empty(privateDnsZonesDefinition.?tags) ? privateDnsZonesDefinition.tags! : tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: (contains(privateDnsZonesDefinition, 'createNetworkLinks') && privateDnsZonesDefinition.createNetworkLinks!)
      ? [
          {
            name: '${varVnetName}-containerapps-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
      : []
  }
}

// 2.3.11. Container Registry PDNS
module privateDnsZoneAcr 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.acr && varHasAcr) {
  name: 'acr-private-dns-zone'
  params: {
    name: 'privatelink.azurecr.io'
    location: 'global'
    tags: !empty(privateDnsZonesDefinition.?tags) ? privateDnsZonesDefinition.tags! : tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: (contains(privateDnsZonesDefinition, 'createNetworkLinks') && privateDnsZonesDefinition.createNetworkLinks!)
      ? [
          {
            name: '${varVnetName}-acr-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
      : []
  }
}

// 2.3.12. App Insights PDNS
module privateDnsZoneInsights 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.appInsights && varHasAppInsights) {
  name: 'ai-private-dns-zone'
  params: {
    name: 'privatelink.applicationinsights.azure.com'
    location: 'global'
    tags: !empty(privateDnsZonesDefinition.?tags) ? privateDnsZonesDefinition.tags! : tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: (contains(privateDnsZonesDefinition, 'createNetworkLinks') && privateDnsZonesDefinition.createNetworkLinks!)
      ? [
          {
            name: '${varVnetName}-ai-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
      : []
  }
}

// 2.4. Networking - Private Endpoints

// 2.4.1. App Configuration
module privateEndpointAppConfig 'br/public:avm/res/network/private-endpoint:0.11.0' = if (varDeployPdnsAndPe && varHasAppConfig) {
  name: 'appconfig-private-endpoint'
  params: {
    name: 'pe-appcs-${baseName}'
    location: location
    tags: tags
    subnetResourceId: varPeSubnetId
    enableTelemetry: enableTelemetry
    privateLinkServiceConnections: [
      {
        name: 'appConfigConnection'
        properties: {
          privateLinkServiceId: empty(resourceIds.appConfigResourceId!)
            ? configurationStore!.outputs.resourceId
            : existingAppConfig.id
          groupIds: ['configurationStores']
        }
      }
    ]
    privateDnsZoneGroup: {
      name: 'appConfigDnsZoneGroup'
      privateDnsZoneGroupConfigs: [
        {
          name: 'appConfigARecord'
          privateDnsZoneResourceId: !varUseExistingPdz.appConfig
            ? privateDnsZoneAppConfig!.outputs.resourceId
            : privateDnsZonesDefinition.appConfigZoneId!
        }
      ]
    }
  }
}

// 2.4.2. APIM
module privateEndpointApim 'br/public:avm/res/network/private-endpoint:0.11.0' = if (varDeployPdnsAndPe && varHasApim) {
  name: 'apim-private-endpoint'
  params: {
    name: 'pe-apim-${baseName}'
    location: location
    tags: tags
    subnetResourceId: varPeSubnetId
    enableTelemetry: enableTelemetry
    privateLinkServiceConnections: [
      {
        name: 'apimGatewayConnection'
        properties: {
          privateLinkServiceId: empty(resourceIds.apimServiceResourceId!)
            ? apiManagement!.outputs.resourceId
            : existingApim.id
          groupIds: [
            'gateway'
            //'management'
            //'portal'
            //'scm'
          ]
        }
      }
    ]
    privateDnsZoneGroup: {
      name: 'apimDnsZoneGroup'
      privateDnsZoneGroupConfigs: [
        {
          name: 'apimARecord'
          privateDnsZoneResourceId: !varUseExistingPdz.apim
            ? privateDnsZoneApim!.outputs.resourceId
            : privateDnsZonesDefinition.apimZoneId!
        }
      ]
    }
  }
}

// 2.4.3. Container Apps Environment
module privateEndpointContainerAppsEnv 'br/public:avm/res/network/private-endpoint:0.11.0' = if (varDeployPdnsAndPe && varHasContainerEnv) {
  name: 'containerapps-env-private-endpoint'
  params: {
    name: 'pe-cae-${baseName}'
    location: location
    tags: tags
    subnetResourceId: varPeSubnetId
    enableTelemetry: enableTelemetry
    privateLinkServiceConnections: [
      {
        name: 'ccaConnection'
        properties: {
          privateLinkServiceId: empty(resourceIds.containerEnvResourceId!)
            ? containerEnv!.outputs.resourceId
            : existingContainerEnv.id
          groupIds: ['managedEnvironments']
        }
      }
    ]
    privateDnsZoneGroup: {
      name: 'ccaDnsZoneGroup'
      privateDnsZoneGroupConfigs: [
        {
          name: 'ccaARecord'
          privateDnsZoneResourceId: !varUseExistingPdz.containerApps
            ? privateDnsZoneContainerApps!.outputs.resourceId
            : privateDnsZonesDefinition.containerAppsZoneId!
        }
      ]
    }
  }
}

// 2.4.4. Azure Container Registry
module privateEndpointAcr 'br/public:avm/res/network/private-endpoint:0.11.0' = if (varDeployPdnsAndPe && varHasAcr) {
  name: 'acr-private-endpoint'
  params: {
    name: 'pe-acr-${baseName}'
    location: location
    tags: tags
    subnetResourceId: varPeSubnetId
    enableTelemetry: enableTelemetry
    privateLinkServiceConnections: [
      {
        name: 'acrConnection'
        properties: {
          privateLinkServiceId: varAcrResourceId
          groupIds: ['registry']
        }
      }
    ]
    privateDnsZoneGroup: {
      name: 'acrDnsZoneGroup'
      privateDnsZoneGroupConfigs: [
        {
          name: 'acrARecord'
          #disable-next-line BCP318
          privateDnsZoneResourceId: !varUseExistingPdz.acr
            ? privateDnsZoneAcr!.outputs.resourceId
            : privateDnsZonesDefinition.acrZoneId!
        }
      ]
    }
  }
  dependsOn: [
    #disable-next-line BCP321
    (varDeployAcr) ? containerRegistry : null
  ]
}

// 2.4.5. Storage (blob)
module privateEndpointStorageBlob 'br/public:avm/res/network/private-endpoint:0.11.0' = if (varDeployPdnsAndPe && varHasStorage) {
  name: 'blob-private-endpoint'
  params: {
    name: 'pe-st-${baseName}'
    location: location
    tags: tags
    subnetResourceId: varPeSubnetId
    enableTelemetry: enableTelemetry
    privateLinkServiceConnections: [
      {
        name: 'blobConnection'
        properties: {
          privateLinkServiceId: empty(resourceIds.storageAccountResourceId!)
            #disable-next-line BCP318
            ? storageAccount.outputs.resourceId
            : existingStorage.id
          groupIds: ['blob']
        }
      }
    ]
    privateDnsZoneGroup: {
      name: 'blobDnsZoneGroup'
      privateDnsZoneGroupConfigs: [
        {
          name: 'blobARecord'
          privateDnsZoneResourceId: !varUseExistingPdz.blob
            #disable-next-line BCP318
            ? privateDnsZoneBlob.outputs.resourceId
            : privateDnsZonesDefinition.blobZoneId!
        }
      ]
    }
  }
}

// 2.4.6. Cosmos DB (SQL)
module privateEndpointCosmos 'br/public:avm/res/network/private-endpoint:0.11.0' = if (varDeployPdnsAndPe && varHasCosmos) {
  name: 'cosmos-private-endpoint'
  params: {
    name: 'pe-cos-${baseName}'
    location: location
    tags: tags
    subnetResourceId: varPeSubnetId
    enableTelemetry: enableTelemetry
    privateLinkServiceConnections: [
      {
        name: 'cosmosConnection'
        properties: {
          privateLinkServiceId: empty(resourceIds.dbAccountResourceId!)
            #disable-next-line BCP318
            ? cosmosDbAccount.outputs.resourceId
            : existingCosmos.id
          groupIds: ['Sql']
        }
      }
    ]
    privateDnsZoneGroup: {
      name: 'cosmosDnsZoneGroup'
      privateDnsZoneGroupConfigs: [
        {
          name: 'cosmosARecord'
          privateDnsZoneResourceId: !varUseExistingPdz.cosmosSql
            #disable-next-line BCP318
            ? privateDnsZoneCosmos.outputs.resourceId
            : privateDnsZonesDefinition.cosmosSqlZoneId!
        }
      ]
    }
  }
}

// 2.4.7. Azure AI Search
module privateEndpointSearch 'br/public:avm/res/network/private-endpoint:0.11.0' = if (varDeployPdnsAndPe && varHasSearch) {
  name: 'search-private-endpoint'
  params: {
    name: 'pe-srch-${baseName}'
    location: location
    tags: tags
    subnetResourceId: varPeSubnetId
    enableTelemetry: enableTelemetry
    privateLinkServiceConnections: [
      {
        name: 'searchConnection'
        properties: {
          privateLinkServiceId: empty(resourceIds.searchServiceResourceId!)
            #disable-next-line BCP318
            ? searchService.outputs.resourceId
            : existingSearch.id
          groupIds: ['searchService']
        }
      }
    ]
    privateDnsZoneGroup: {
      name: 'searchDnsZoneGroup'
      privateDnsZoneGroupConfigs: [
        {
          name: 'searchARecord'
          privateDnsZoneResourceId: !varUseExistingPdz.search
            #disable-next-line BCP318
            ? privateDnsZoneSearch.outputs.resourceId
            : privateDnsZonesDefinition.searchZoneId!
        }
      ]
    }
  }

  dependsOn: [
    #disable-next-line BCP321
    (empty(resourceIds.searchServiceResourceId!)) ? searchService : null
    #disable-next-line BCP321
    (empty(resourceIds.virtualNetworkResourceId!)) ? vNetwork : null
    #disable-next-line BCP321
    (varDeployPdnsAndPe && !varUseExistingPdz.search) ? privateDnsZoneSearch : null
  ]
}

// 2.4.8. Key Vault (GenAI)
module privateEndpointKeyVault 'br/public:avm/res/network/private-endpoint:0.11.0' = if (varDeployPdnsAndPe && varHasKv) {
  name: 'kv-private-endpoint'
  params: {
    name: 'pe-kv-${baseName}'
    location: location
    tags: tags
    subnetResourceId: varPeSubnetId
    enableTelemetry: enableTelemetry
    privateLinkServiceConnections: [
      {
        name: 'kvConnection'
        properties: {
          #disable-next-line BCP318
          privateLinkServiceId: empty(resourceIds.keyVaultResourceId!) ? vault.outputs.resourceId : existingVault.id
          groupIds: ['vault']
        }
      }
    ]
    privateDnsZoneGroup: {
      name: 'kvDnsZoneGroup'
      privateDnsZoneGroupConfigs: [
        {
          name: 'kvARecord'
          privateDnsZoneResourceId: !varUseExistingPdz.keyVault
            #disable-next-line BCP318
            ? privateDnsZoneKeyVault.outputs.resourceId
            : privateDnsZonesDefinition.keyVaultZoneId!
        }
      ]
    }
  }
}

// 2.5. AI Foundry

@description('Optional. AI Foundry project configuration (account/project, networking, associated resources, and deployments).')
param aiFoundryDefinition types.aiFoundryDefinitionType = {
  // Required
  baseName: baseName
}

// Holds the aiFoundryConfiguration object if defined in aiFoundryDefinition;
// otherwise defaults to an empty object to avoid null reference errors.
var varAfConfigObj = !empty(aiFoundryDefinition.?aiFoundryConfiguration)
  ? aiFoundryDefinition.aiFoundryConfiguration!
  : {}

// Boolean flag indicating whether capability hosts should be created.
// Safely checks for the property in varAfConfigObj, defaults to false if missing.
var varAfAgentSvcEnabled = contains(varAfConfigObj, 'createCapabilityHosts')
  ? bool(varAfConfigObj.createCapabilityHosts!)
  : false

// Determines if dependent resources should be deployed for Ai Foundry.
// This is true only if agent service is enabled AND includeAssociatedResources
// is either true or not explicitly set (defaults to true).
var varAfWantsDeps = varAfAgentSvcEnabled && (contains(aiFoundryDefinition, 'includeAssociatedResources')
  ? aiFoundryDefinition.includeAssociatedResources!
  : true)

// Boolean flag indicating whether project management is allowed in the AI Foundry account.
// Project management enabled? Respect explicit false; default to true only if absent.
var varAfProjectEnabled = contains(varAfConfigObj, 'allowProjectManagement')
  ? varAfConfigObj.allowProjectManagement!
  : true

// search
var varAfSearchCfg = contains(aiFoundryDefinition, 'aiSearchConfiguration')
  ? aiFoundryDefinition.aiSearchConfiguration!
  : {}

// Override Search PDZ binding if applicable
var varAfAiSearchCfgComplete = union(
  varAfSearchCfg,
  (!empty((!varUseExistingPdz.search
      ? privateDnsZoneSearch!.outputs.resourceId
      : privateDnsZonesDefinition.searchZoneId!)))
    ? {
        privateDnsZoneResourceId: (!varUseExistingPdz.search
          ? privateDnsZoneSearch!.outputs.resourceId
          : privateDnsZonesDefinition.searchZoneId!)
      }
    : {}
)

// cosmos
var varAfCosmosCfg = contains(aiFoundryDefinition, 'cosmosDbConfiguration')
  ? aiFoundryDefinition.cosmosDbConfiguration!
  : {}
// Override Cosmos PDZ binding if applicable
var varAfCosmosCfgComplete = union(
  varAfCosmosCfg,
  (!empty((!varUseExistingPdz.cosmosSql
      ? privateDnsZoneCosmos!.outputs.resourceId
      : privateDnsZonesDefinition.cosmosSqlZoneId!)))
    ? {
        privateDnsZoneResourceId: (!varUseExistingPdz.cosmosSql
          ? privateDnsZoneCosmos!.outputs.resourceId
          : privateDnsZonesDefinition.cosmosSqlZoneId!)
      }
    : {}
)

// keyvault
var varAfKvCfg = contains(aiFoundryDefinition, 'keyVaultConfiguration')
  ? aiFoundryDefinition.keyVaultConfiguration!
  : {}
// Override Key Vault PDZ binding if applicable
var varAfKVCfgComplete = union(
  varAfKvCfg,
  (!empty((!varUseExistingPdz.keyVault
      ? privateDnsZoneKeyVault!.outputs.resourceId
      : privateDnsZonesDefinition.keyVaultZoneId!)))
    ? {
        privateDnsZoneResourceId: (!varUseExistingPdz.keyVault
          ? privateDnsZoneKeyVault!.outputs.resourceId
          : privateDnsZonesDefinition.keyVaultZoneId!)
      }
    : {}
)

// storage
var varAfStorageCfg = contains(aiFoundryDefinition, 'storageAccountConfiguration')
  ? aiFoundryDefinition.storageAccountConfiguration!
  : {}

// Override Storage (blob) PDZ binding if applicable
var varAfStorageCfgComplete = union(
  varAfStorageCfg,
  (!empty((!varUseExistingPdz.blob ? privateDnsZoneBlob!.outputs.resourceId : privateDnsZonesDefinition.blobZoneId!)))
    ? {
        blobPrivateDnsZoneResourceId: (!varUseExistingPdz.blob
          ? privateDnsZoneBlob!.outputs.resourceId
          : privateDnsZonesDefinition.blobZoneId!)
      }
    : {}
)

// ai services
var varAfAiServicesPdzId = !varUseExistingPdz.aiServices
  ? privateDnsZoneAiService!.outputs.resourceId
  : privateDnsZonesDefinition.aiServicesZoneId!

// open ai
var varAfOpenAIPdzId = !varUseExistingPdz.openai
  ? privateDnsZoneOpenAi!.outputs.resourceId
  : privateDnsZonesDefinition.openaiZoneId!

// cognitive services
var varAfCognitiveServicesPdzId = !varUseExistingPdz.cognitiveservices
  ? privateDnsZoneCogSvcs!.outputs.resourceId
  : privateDnsZonesDefinition.cognitiveservicesZoneId!

// networking
var varAfNetworkingOverride = union(
  (varAfAgentSvcEnabled ? { agentServiceSubnetResourceId: varAgentSubnetId } : {}),
  { aiServicesPrivateDnsZoneResourceId: varAfAiServicesPdzId },
  { openAiPrivateDnsZoneResourceId: varAfOpenAIPdzId },
  { cognitiveServicesPrivateDnsZoneResourceId: varAfCognitiveServicesPdzId }
)

// Module
module aiFoundry 'br/public:avm/ptn/ai-ml/ai-foundry:0.3.0' = {
  name: 'aiFoundryDeployment'
  params: {
    // Required
    baseName: !empty(aiFoundryDefinition.?baseName) ? aiFoundryDefinition.baseName! : baseName

    // Optionals (guarded)
    baseUniqueName: !empty(aiFoundryDefinition.?baseUniqueName) ? aiFoundryDefinition.baseUniqueName! : null
    enableTelemetry: enableTelemetry
    includeAssociatedResources: contains(aiFoundryDefinition, 'includeAssociatedResources')
      ? aiFoundryDefinition.includeAssociatedResources!
      : varAfWantsDeps
    location: !empty(aiFoundryDefinition.?location) ? aiFoundryDefinition.location! : location
    lock: !empty(aiFoundryDefinition.?lock) ? aiFoundryDefinition.lock! : null
    tags: !empty(aiFoundryDefinition.?tags) ? aiFoundryDefinition.tags! : tags

    privateEndpointSubnetResourceId: varPeSubnetId

    aiFoundryConfiguration: {
      accountName: !empty(varAfConfigObj.?accountName) ? varAfConfigObj.accountName! : 'ai${baseName}'
      allowProjectManagement: varAfProjectEnabled
      createCapabilityHosts: contains(varAfConfigObj, 'createCapabilityHosts')
        ? varAfConfigObj.createCapabilityHosts!
        : varAfAgentSvcEnabled
      location: !empty(varAfConfigObj.?location) ? varAfConfigObj.location! : location

      networking: !empty(varAfConfigObj.?networking)
        ? varAfConfigObj.networking!
        : (varDeployPdnsAndPe ? varAfNetworkingOverride : {})

      project: !empty(varAfConfigObj.?project)
        ? varAfConfigObj.project!
        : (varAfProjectEnabled
            ? {
                name: 'aifoundry-default-project'
                displayName: 'Default AI Foundry Project.'
                description: 'This is the default project for AI Foundry.'
              }
            : null)

      roleAssignments: !empty(varAfConfigObj.?roleAssignments) ? varAfConfigObj.roleAssignments! : null

      sku: !empty(varAfConfigObj.?sku) ? varAfConfigObj.sku! : 'S0'
    }

    aiModelDeployments: !empty(aiFoundryDefinition.?aiModelDeployments)
      ? aiFoundryDefinition.aiModelDeployments!
      : [
          {
            model: {
              format: 'OpenAI'
              name: 'gpt-4o'
              version: '2024-11-20'
            }
            name: 'gpt-4o'
            sku: {
              name: 'Standard'
              capacity: 1
            }
          }
          {
            model: {
              format: 'OpenAI'
              name: 'text-embedding-3-large'
              version: '1'
            }
            name: 'text-embedding-3-large'
            sku: {
              name: 'Standard'
              capacity: 1
            }
          }
        ]

    aiSearchConfiguration: varAfAiSearchCfgComplete
    cosmosDbConfiguration: varAfCosmosCfgComplete
    keyVaultConfiguration: varAfKVCfgComplete
    storageAccountConfiguration: varAfStorageCfgComplete
  }
  dependsOn: [
    #disable-next-line BCP321
    (empty(resourceIds.searchServiceResourceId!)) ? searchService : null
    #disable-next-line BCP321
    (empty(resourceIds.virtualNetworkResourceId!)) ? vNetwork : null
    #disable-next-line BCP321
    (varDeployPdnsAndPe && !varUseExistingPdz.search) ? privateDnsZoneSearch : null
    #disable-next-line BCP321
    (varDeployPdnsAndPe && !varUseExistingPdz.cognitiveservices) ? privateDnsZoneCogSvcs : null
    #disable-next-line BCP321
    (varDeployPdnsAndPe && !varUseExistingPdz.openai) ? privateDnsZoneOpenAi : null
    #disable-next-line BCP321
    (varDeployPdnsAndPe && !varUseExistingPdz.aiServices) ? privateDnsZoneAiService : null
  ]
}

// 2.6. Gateways - API Management
@description('Conditional. API Management configuration. Required if deployToggles.apiManagement is true and resourceIds.apimServiceResourceId is empty.')
param apimDefinition types.apimDefinitionType = {
  // Basic metadata
  name: ''
  publisherEmail: 'admin@example.com'
  publisherName: 'Contoso'
}

// Naming
var varApimIdSegments = empty(resourceIds.apimServiceResourceId!)
  ? ['']
  : split(resourceIds.apimServiceResourceId!, '/')
var varApimSub = length(varApimIdSegments) >= 3 ? varApimIdSegments[2] : ''
var varApimRg = length(varApimIdSegments) >= 5 ? varApimIdSegments[4] : ''
var varApimNameExisting = length(varApimIdSegments) >= 1 ? last(varApimIdSegments) : ''
var varApimName = !empty(resourceIds.apimServiceResourceId!)
  ? varApimNameExisting
  : (empty(apimDefinition.name!) ? 'apim-${baseName}' : apimDefinition.name!)

resource existingApim 'Microsoft.ApiManagement/service@2024-06-01-preview' existing = if (!empty(resourceIds.apimServiceResourceId!)) {
  name: varApimNameExisting
  scope: resourceGroup(varApimSub, varApimRg)
}
var varApimServiceResourceId = !empty(resourceIds.apimServiceResourceId!)
  ? existingApim.id
  : (varDeployApim ? apiManagement!.outputs.resourceId : '')

#disable-next-line BCP081
module apiManagement 'br/public:avm/res/api-management/service:0.11.0' = if (varDeployApim) {
  name: 'apimDeployment'
  params: {
    // Required
    name: varApimName
    publisherEmail: apimDefinition.publisherEmail!
    publisherName: apimDefinition.publisherName!

    // Conditional (guarded)
    skuCapacity: contains(apimDefinition, 'skuCapacity') ? apimDefinition.skuCapacity! : null
    sku: !empty(apimDefinition.?sku) ? apimDefinition.sku! : null

    // Optional (guarded with fallbacks preserved)
    additionalLocations: !empty(apimDefinition.?additionalLocations)
      ? apimDefinition.additionalLocations!
      : [
          {
            availabilityZones: [1, 2, 3]
            disableGateway: false
            location: 'westus2'
            sku: {
              name: 'Premium'
              capacity: 3
            }
          }
        ]
    apiDiagnostics: !empty(apimDefinition.?apiDiagnostics) ? apimDefinition.apiDiagnostics! : []
    apis: !empty(apimDefinition.?apis) ? apimDefinition.apis! : []
    apiVersionSets: !empty(apimDefinition.?apiVersionSets) ? apimDefinition.apiVersionSets! : []
    authorizationServers: !empty(apimDefinition.?authorizationServers) ? apimDefinition.authorizationServers! : []
    availabilityZones: !empty(apimDefinition.?availabilityZones) ? apimDefinition.availabilityZones! : [1, 2, 3]
    backends: !empty(apimDefinition.?backends) ? apimDefinition.backends! : []
    caches: !empty(apimDefinition.?caches) ? apimDefinition.caches! : []
    certificates: !empty(apimDefinition.?certificates) ? apimDefinition.certificates! : []
    customProperties: !empty(apimDefinition.?customProperties)
      ? apimDefinition.customProperties!
      : {
          'Microsoft.WindowsAzure.ApiManagement.Gateway.Protocols.Server.Http2': 'True'
          'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Ssl30': 'False'
          'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Tls10': 'False'
          'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Tls11': 'False'
          'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA': 'False'
          'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA': 'False'
          'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_RSA_WITH_AES_128_CBC_SHA': 'False'
          'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_RSA_WITH_AES_128_CBC_SHA256': 'False'
          'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_RSA_WITH_AES_128_GCM_SHA256': 'False'
          'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_RSA_WITH_AES_256_CBC_SHA': 'False'
          'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TLS_RSA_WITH_AES_256_CBC_SHA256': 'False'
          'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TripleDes168': 'False'
          'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Ssl30': 'False'
          'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Tls10': 'False'
          'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Tls11': 'False'
        }
    diagnosticSettings: !empty(apimDefinition.?diagnosticSettings) ? apimDefinition.diagnosticSettings! : null
    disableGateway: contains(apimDefinition, 'disableGateway') ? apimDefinition.disableGateway! : null
    enableClientCertificate: contains(apimDefinition, 'enableClientCertificate')
      ? apimDefinition.enableClientCertificate!
      : null
    enableDeveloperPortal: contains(apimDefinition, 'enableDeveloperPortal')
      ? apimDefinition.enableDeveloperPortal!
      : null
    enableTelemetry: enableTelemetry
    hostnameConfigurations: !empty(apimDefinition.?hostnameConfigurations) ? apimDefinition.hostnameConfigurations! : []
    identityProviders: !empty(apimDefinition.?identityProviders) ? apimDefinition.identityProviders! : []

    #disable-next-line BCP225
    portalsettings: !empty(apimDefinition.?portalsettings) ? apimDefinition.portalsettings! : []
    location: !empty(apimDefinition.?location) ? apimDefinition.location! : location
    lock: !empty(apimDefinition.?lock) ? apimDefinition.lock! : null
    loggers: !empty(apimDefinition.?loggers) ? apimDefinition.loggers! : []
    managedIdentities: !empty(apimDefinition.?managedIdentities) ? apimDefinition.managedIdentities! : null
    minApiVersion: !empty(apimDefinition.?minApiVersion) ? apimDefinition.minApiVersion! : '2022-08-01'
    namedValues: !empty(apimDefinition.?namedValues) ? apimDefinition.namedValues! : []
    newGuidValue: !empty(apimDefinition.?newGuidValue) ? apimDefinition.newGuidValue! : null
    notificationSenderEmail: !empty(apimDefinition.?notificationSenderEmail)
      ? apimDefinition.notificationSenderEmail!
      : null
    policies: !empty(apimDefinition.?policies) ? apimDefinition.policies! : []
    products: !empty(apimDefinition.?products) ? apimDefinition.products! : []
    publicIpAddressResourceId: !empty(apimDefinition.?publicIpAddressResourceId)
      ? apimDefinition.publicIpAddressResourceId!
      : null
    restore: contains(apimDefinition, 'restore') ? apimDefinition.restore! : null
    roleAssignments: !empty(apimDefinition.?roleAssignments) ? apimDefinition.roleAssignments! : []
    subnetResourceId: !empty(apimDefinition.?subnetResourceId) ? apimDefinition.subnetResourceId! : varApimSubnetId
    subscriptions: !empty(apimDefinition.?subscriptions) ? apimDefinition.subscriptions! : []
    tags: !empty(apimDefinition.?tags) ? apimDefinition.tags! : tags
    virtualNetworkType: !empty(apimDefinition.?virtualNetworkType) ? apimDefinition.virtualNetworkType! : null
  }
}

// 2.7. Gateways - Application Gateway

@description('Conditional. Application Gateway configuration. Required if deployToggles.applicationGateway is true and resourceIds.applicationGatewayResourceId is empty.')
param appGatewayDefinition types.appGatewayDefinitionType = {
  // Required
  name: ''
}

resource existingAppGateway 'Microsoft.Network/applicationGateways@2024-07-01' existing = if (!empty(resourceIds.applicationGatewayResourceId!)) {
  name: varAgwNameExisting
  scope: resourceGroup(varAgwSub, varAgwRg)
}
var varAppGatewayResourceId = !empty(resourceIds.applicationGatewayResourceId!)
  ? existingAppGateway.id
  : (varDeployAppGateway ? applicationGateway!.outputs.resourceId : '')

// Naming
var varAgwIdSegments = empty(resourceIds.applicationGatewayResourceId!)
  ? ['']
  : split(resourceIds.applicationGatewayResourceId!, '/')
var varAgwSub = length(varAgwIdSegments) >= 3 ? varAgwIdSegments[2] : ''
var varAgwRg = length(varAgwIdSegments) >= 5 ? varAgwIdSegments[4] : ''
var varAgwNameExisting = length(varAgwIdSegments) >= 1 ? last(varAgwIdSegments) : ''
var varAgwName = !empty(resourceIds.applicationGatewayResourceId!)
  ? varAgwNameExisting
  : (empty(appGatewayDefinition.name!) ? 'agw-${baseName}' : appGatewayDefinition.name!)

// Determine if we need to create a WAF policy
var varAppGatewaySKU = contains(appGatewayDefinition, 'sku') ? appGatewayDefinition.sku! : 'WAF_v2'
var varAppGatewayNeedFirewallPolicy = (varAppGatewaySKU == 'WAF_v2')
var varAppGatewayFirewallPolicyId = (varAppGatewayNeedFirewallPolicy ? varWafPolicyResourceId : '')

module applicationGateway 'br/public:avm/res/network/application-gateway:0.7.1' = if (varDeployAppGateway) {
  name: 'applicationGatewayDeployment'
  params: {
    // Required
    name: varAgwName

    // Conditional
    firewallPolicyResourceId: !empty(appGatewayDefinition.?firewallPolicyResourceId)
      ? appGatewayDefinition.firewallPolicyResourceId!
      : varAppGatewayFirewallPolicyId

    // Optionals (guarded)
    location: !empty(appGatewayDefinition.?location) ? appGatewayDefinition.location! : location
    authenticationCertificates: !empty(appGatewayDefinition.?authenticationCertificates)
      ? appGatewayDefinition.authenticationCertificates!
      : []
    autoscaleMaxCapacity: contains(appGatewayDefinition, 'autoscaleMaxCapacity')
      ? appGatewayDefinition.autoscaleMaxCapacity!
      : null
    autoscaleMinCapacity: contains(appGatewayDefinition, 'autoscaleMinCapacity')
      ? appGatewayDefinition.autoscaleMinCapacity!
      : null
    availabilityZones: !empty(appGatewayDefinition.?availabilityZones)
      ? appGatewayDefinition.availabilityZones!
      : [1, 2, 3]
    backendAddressPools: !empty(appGatewayDefinition.?backendAddressPools)
      ? appGatewayDefinition.backendAddressPools!
      : []
    backendHttpSettingsCollection: !empty(appGatewayDefinition.?backendHttpSettingsCollection)
      ? appGatewayDefinition.backendHttpSettingsCollection!
      : []
    backendSettingsCollection: !empty(appGatewayDefinition.?backendSettingsCollection)
      ? appGatewayDefinition.backendSettingsCollection!
      : []
    capacity: contains(appGatewayDefinition, 'capacity') ? appGatewayDefinition.capacity! : null
    customErrorConfigurations: !empty(appGatewayDefinition.?customErrorConfigurations)
      ? appGatewayDefinition.customErrorConfigurations!
      : []
    diagnosticSettings: !empty(appGatewayDefinition.?diagnosticSettings)
      ? appGatewayDefinition.diagnosticSettings!
      : null
    enableFips: contains(appGatewayDefinition, 'enableFips') ? appGatewayDefinition.enableFips! : null
    enableHttp2: contains(appGatewayDefinition, 'enableHttp2') ? appGatewayDefinition.enableHttp2! : null
    enableRequestBuffering: contains(appGatewayDefinition, 'enableRequestBuffering')
      ? appGatewayDefinition.enableRequestBuffering!
      : null
    enableResponseBuffering: contains(appGatewayDefinition, 'enableResponseBuffering')
      ? appGatewayDefinition.enableResponseBuffering!
      : null
    enableTelemetry: enableTelemetry
    frontendIPConfigurations: !empty(appGatewayDefinition.?frontendIPConfigurations)
      ? appGatewayDefinition.frontendIPConfigurations!
      : concat(
          varDeployAppGatewayPublicIp
            ? [
                {
                  name: 'publicFrontend'
                  properties: { publicIPAddress: { id: appGatewayPip!.outputs.resourceId } }
                }
              ]
            : [],
          [
            {
              name: 'privateFrontend'
              properties: {
                privateIPAllocationMethod: 'Static'
                privateIPAddress: '192.168.0.130'
                subnet: { id: varAgwSubnetId }
              }
            }
          ]
        )
    frontendPorts: !empty(appGatewayDefinition.?frontendPorts) ? appGatewayDefinition.frontendPorts! : []
    gatewayIPConfigurations: !empty(appGatewayDefinition.?gatewayIPConfigurations)
      ? appGatewayDefinition.gatewayIPConfigurations!
      : []
    httpListeners: !empty(appGatewayDefinition.?httpListeners) ? appGatewayDefinition.httpListeners! : []
    listeners: !empty(appGatewayDefinition.?listeners) ? appGatewayDefinition.listeners! : []
    loadDistributionPolicies: !empty(appGatewayDefinition.?loadDistributionPolicies)
      ? appGatewayDefinition.loadDistributionPolicies!
      : []
    lock: !empty(appGatewayDefinition.?lock) ? appGatewayDefinition.lock! : null
    managedIdentities: !empty(appGatewayDefinition.?managedIdentities) ? appGatewayDefinition.managedIdentities! : null
    privateEndpoints: !empty(appGatewayDefinition.?privateEndpoints) ? appGatewayDefinition.privateEndpoints! : []
    privateLinkConfigurations: !empty(appGatewayDefinition.?privateLinkConfigurations)
      ? appGatewayDefinition.privateLinkConfigurations!
      : []
    probes: !empty(appGatewayDefinition.?probes) ? appGatewayDefinition.probes! : []
    redirectConfigurations: !empty(appGatewayDefinition.?redirectConfigurations)
      ? appGatewayDefinition.redirectConfigurations!
      : []
    requestRoutingRules: !empty(appGatewayDefinition.?requestRoutingRules)
      ? appGatewayDefinition.requestRoutingRules!
      : []
    rewriteRuleSets: !empty(appGatewayDefinition.?rewriteRuleSets) ? appGatewayDefinition.rewriteRuleSets! : []
    roleAssignments: !empty(appGatewayDefinition.?roleAssignments) ? appGatewayDefinition.roleAssignments! : []
    routingRules: !empty(appGatewayDefinition.?routingRules) ? appGatewayDefinition.routingRules! : []
    sku: varAppGatewaySKU
    sslCertificates: !empty(appGatewayDefinition.?sslCertificates) ? appGatewayDefinition.sslCertificates! : []
    sslPolicyCipherSuites: !empty(appGatewayDefinition.?sslPolicyCipherSuites)
      ? appGatewayDefinition.sslPolicyCipherSuites!
      : []
    sslPolicyMinProtocolVersion: !empty(appGatewayDefinition.?sslPolicyMinProtocolVersion)
      ? appGatewayDefinition.sslPolicyMinProtocolVersion!
      : null
    sslPolicyName: !empty(appGatewayDefinition.?sslPolicyName) ? appGatewayDefinition.sslPolicyName! : null
    sslPolicyType: !empty(appGatewayDefinition.?sslPolicyType) ? appGatewayDefinition.sslPolicyType! : null
    sslProfiles: !empty(appGatewayDefinition.?sslProfiles) ? appGatewayDefinition.sslProfiles! : []
    tags: !empty(appGatewayDefinition.?tags) ? appGatewayDefinition.tags! : tags
    trustedClientCertificates: !empty(appGatewayDefinition.?trustedClientCertificates)
      ? appGatewayDefinition.trustedClientCertificates!
      : []
    trustedRootCertificates: !empty(appGatewayDefinition.?trustedRootCertificates)
      ? appGatewayDefinition.trustedRootCertificates!
      : []
    urlPathMaps: !empty(appGatewayDefinition.?urlPathMaps) ? appGatewayDefinition.urlPathMaps! : []
  }
  dependsOn: [
    #disable-next-line BCP321
    (varDeployWafPolicy) ? wafPolicy : null
    #disable-next-line BCP321
    (varDeployAppGatewayPublicIp) ? appGatewayPip : null
    #disable-next-line BCP321
    (empty(resourceIds.virtualNetworkResourceId!)) ? vNetwork : null
  ]
}

// 2.8. Gateways - Web Application Firewall (WAF) Policy

@description('Conditional. Web Application Firewall (WAF) policy configuration. Required if deployToggles.wafPolicy is true and you are deploying Application Gateway via this template.')
param wafPolicyDefinition types.wafPolicyDefinitionsType = {
  // Required
  name: ''
  managedRules: {
    exclusions: []
    managedRuleSets: [
      {
        type: 'OWASP'
        version: '3.2'
        ruleGroupOverride: []
      }
    ]
  }
}

var varDeployWafPolicy = deployToggles.wafPolicy
var varWafPolicyResourceId = varDeployWafPolicy ? wafPolicy!.outputs.resourceId : '' // cache resourceId for AGW wiring

module wafPolicy 'br/public:avm/res/network/application-gateway-web-application-firewall-policy:0.2.0' = if (varDeployWafPolicy) {
  name: 'wafPolicyDeployment'
  params: {
    // Required
    name: empty(wafPolicyDefinition.name!) ? 'afwp-${baseName}' : wafPolicyDefinition.name!
    managedRules: wafPolicyDefinition.managedRules

    // Optionals (guarded)
    policySettings: !empty(wafPolicyDefinition.?policySettings) ? wafPolicyDefinition.policySettings! : null
    customRules: !empty(wafPolicyDefinition.?customRules) ? wafPolicyDefinition.customRules! : []
    enableTelemetry: enableTelemetry
    location: !empty(wafPolicyDefinition.?location) ? wafPolicyDefinition.location! : location
    tags: !empty(wafPolicyDefinition.?tags) ? wafPolicyDefinition.tags! : tags
  }
}

// 2.9. Gateways - Application Gateway Public IP

@description('Conditional. Public IP configuration for the Application Gateway. Required if deployToggles.applicationGateway is true and resourceIds.applicationGatewayResourceId is empty and a public frontend is being created.')
param appGatewayPublicIpDefinition types.publicIpDefinitionType?

module appGatewayPip 'br/public:avm/res/network/public-ip-address:0.9.0' = if (varDeployAppGatewayPublicIp) {
  name: 'appGatewayPipDeployment'
  params: {
    // Required
    name: empty(appGatewayPublicIpDefinition!.name!) ? 'pip-agw-${baseName}' : appGatewayPublicIpDefinition!.name!

    // Optionals (guarded)
    availabilityZones: !empty(appGatewayPublicIpDefinition.?availabilityZones)
      ? appGatewayPublicIpDefinition!.availabilityZones!
      : [1, 2, 3]
    ddosSettings: !empty(appGatewayPublicIpDefinition.?ddosSettings)
      ? appGatewayPublicIpDefinition!.ddosSettings!
      : null
    diagnosticSettings: !empty(appGatewayPublicIpDefinition.?diagnosticSettings)
      ? appGatewayPublicIpDefinition!.diagnosticSettings!
      : null
    dnsSettings: !empty(appGatewayPublicIpDefinition.?dnsSettings) ? appGatewayPublicIpDefinition!.dnsSettings! : null
    enableTelemetry: enableTelemetry
    idleTimeoutInMinutes: contains(appGatewayPublicIpDefinition!, 'idleTimeoutInMinutes')
      ? appGatewayPublicIpDefinition!.idleTimeoutInMinutes!
      : null
    ipTags: !empty(appGatewayPublicIpDefinition.?ipTags) ? appGatewayPublicIpDefinition!.ipTags! : []
    location: !empty(appGatewayPublicIpDefinition.?location) ? appGatewayPublicIpDefinition!.location! : location
    lock: !empty(appGatewayPublicIpDefinition.?lock) ? appGatewayPublicIpDefinition!.lock! : null
    publicIPAddressVersion: !empty(appGatewayPublicIpDefinition.?publicIPAddressVersion)
      ? appGatewayPublicIpDefinition!.publicIPAddressVersion!
      : null
    publicIPAllocationMethod: !empty(appGatewayPublicIpDefinition.?publicIPAllocationMethod)
      ? appGatewayPublicIpDefinition!.publicIPAllocationMethod!
      : null
    publicIpPrefixResourceId: !empty(appGatewayPublicIpDefinition.?publicIpPrefixResourceId)
      ? appGatewayPublicIpDefinition!.publicIpPrefixResourceId!
      : null
    roleAssignments: !empty(appGatewayPublicIpDefinition.?roleAssignments)
      ? appGatewayPublicIpDefinition!.roleAssignments!
      : []
    skuName: !empty(appGatewayPublicIpDefinition.?skuName) ? appGatewayPublicIpDefinition!.skuName! : null
    skuTier: !empty(appGatewayPublicIpDefinition.?skuTier) ? appGatewayPublicIpDefinition!.skuTier! : null
    tags: !empty(appGatewayPublicIpDefinition.?tags) ? appGatewayPublicIpDefinition!.tags! : tags
  }
}

// 2.10. Gateways - Azure Firewall

@description('Conditional. Azure Firewall configuration. Required if deployToggles.firewall is true and resourceIds.firewallResourceId is empty.')
param firewallDefinition types.firewallDefinitionType = {
  // Required
  name: ''
}

resource existingFirewall 'Microsoft.Network/azureFirewalls@2024-07-01' existing = if (!empty(resourceIds.firewallResourceId!)) {
  name: varAfwNameExisting
  scope: resourceGroup(varAfwSub, varAfwRg)
}
var varFirewallResourceId = !empty(resourceIds.firewallResourceId!)
  ? existingFirewall.id
  : (varDeployFirewall ? azureFirewall!.outputs.resourceId : '')

// Naming
var varAfwIdSegments = empty(resourceIds.firewallResourceId!) ? [''] : split(resourceIds.firewallResourceId!, '/')
var varAfwSub = length(varAfwIdSegments) >= 3 ? varAfwIdSegments[2] : ''
var varAfwRg = length(varAfwIdSegments) >= 5 ? varAfwIdSegments[4] : ''
var varAfwNameExisting = length(varAfwIdSegments) >= 1 ? last(varAfwIdSegments) : ''
var varAfwName = !empty(resourceIds.firewallResourceId!)
  ? varAfwNameExisting
  : (empty(firewallDefinition.name!) ? 'afw-${baseName}' : firewallDefinition.name!)

module azureFirewall 'br/public:avm/res/network/azure-firewall:0.8.0' = if (varDeployFirewall && varDeployAfwPolicy) {
  name: 'azureFirewallDeployment'
  params: {
    // Required
    name: varAfwName

    // Conditionals (guarded)
    hubIPAddresses: !empty(firewallDefinition.?hubIPAddresses) ? firewallDefinition.hubIPAddresses! : null
    virtualHubResourceId: !empty(firewallDefinition.?virtualHubResourceId)
      ? firewallDefinition.virtualHubResourceId!
      : null
    virtualNetworkResourceId: !empty(firewallDefinition.?virtualNetworkResourceId)
      ? firewallDefinition.virtualNetworkResourceId!
      : null

    // Optionals (guarded)
    additionalPublicIpConfigurations: !empty(firewallDefinition.?additionalPublicIpConfigurations)
      ? firewallDefinition.additionalPublicIpConfigurations!
      : []
    applicationRuleCollections: !empty(firewallDefinition.?applicationRuleCollections)
      ? firewallDefinition.applicationRuleCollections!
      : []
    autoscaleMaxCapacity: contains(firewallDefinition, 'autoscaleMaxCapacity')
      ? firewallDefinition.autoscaleMaxCapacity!
      : null
    autoscaleMinCapacity: contains(firewallDefinition, 'autoscaleMinCapacity')
      ? firewallDefinition.autoscaleMinCapacity!
      : null
    availabilityZones: !empty(firewallDefinition.?availabilityZones) ? firewallDefinition.availabilityZones! : [1, 2, 3]
    azureSkuTier: !empty(firewallDefinition.?azureSkuTier) ? firewallDefinition.azureSkuTier! : null
    diagnosticSettings: !empty(firewallDefinition.?diagnosticSettings) ? firewallDefinition.diagnosticSettings! : null
    enableForcedTunneling: contains(firewallDefinition, 'enableForcedTunneling')
      ? firewallDefinition.enableForcedTunneling!
      : null
    enableTelemetry: enableTelemetry
    firewallPolicyId: !empty(firewallDefinition.?firewallPolicyId)
      ? firewallDefinition.firewallPolicyId!
      : fwPolicy!.outputs.resourceId
    location: !empty(firewallDefinition.?location) ? firewallDefinition.location! : location
    lock: !empty(firewallDefinition.?lock) ? firewallDefinition.lock! : null
    managementIPAddressObject: !empty(firewallDefinition.?managementIPAddressObject)
      ? firewallDefinition.managementIPAddressObject!
      : null
    managementIPResourceID: !empty(firewallDefinition.?managementIPResourceID)
      ? firewallDefinition.managementIPResourceID!
      : null
    natRuleCollections: !empty(firewallDefinition.?natRuleCollections) ? firewallDefinition.natRuleCollections! : []
    networkRuleCollections: !empty(firewallDefinition.?networkRuleCollections)
      ? firewallDefinition.networkRuleCollections!
      : []
    publicIPAddressObject: !empty(firewallDefinition.?publicIPAddressObject)
      ? firewallDefinition.publicIPAddressObject!
      : null
    publicIPResourceID: !empty(firewallDefinition.?publicIPResourceID) ? firewallDefinition.publicIPResourceID! : null
    roleAssignments: !empty(firewallDefinition.?roleAssignments) ? firewallDefinition.roleAssignments! : []
    tags: !empty(firewallDefinition.?tags) ? firewallDefinition.tags! : tags
    threatIntelMode: !empty(firewallDefinition.?threatIntelMode) ? firewallDefinition.threatIntelMode! : null
  }
  dependsOn: [
    fwPolicy!
  ]
}

// 2.11. Gateways - Azure Firewall Policy

@description('Conditional. Azure Firewall Policy configuration. Required if deployToggles.firewall is true and resourceIds.firewallPolicyResourceId is empty.')
param firewallPolicyDefinition types.firewallPolicyDefinitionType = {
  // Required
  name: ''
}

module fwPolicy 'br/public:avm/res/network/firewall-policy:0.3.1' = if (varDeployAfwPolicy) {
  name: 'firewallPolicyDeployment'
  params: {
    // Required
    name: empty(firewallPolicyDefinition.name!) ? 'afwp-${baseName}' : firewallPolicyDefinition.name!

    // Optionals (guarded)
    allowSqlRedirect: contains(firewallPolicyDefinition, 'allowSqlRedirect')
      ? firewallPolicyDefinition.allowSqlRedirect!
      : null
    basePolicyResourceId: !empty(firewallPolicyDefinition.?basePolicyResourceId)
      ? firewallPolicyDefinition.basePolicyResourceId!
      : null
    certificateName: !empty(firewallPolicyDefinition.?certificateName)
      ? firewallPolicyDefinition.certificateName!
      : null
    defaultWorkspaceResourceId: !empty(firewallPolicyDefinition.?defaultWorkspaceResourceId)
      ? firewallPolicyDefinition.defaultWorkspaceResourceId!
      : null
    enableProxy: contains(firewallPolicyDefinition, 'enableProxy') ? firewallPolicyDefinition.enableProxy! : null
    enableTelemetry: enableTelemetry
    fqdns: !empty(firewallPolicyDefinition.?fqdns) ? firewallPolicyDefinition.fqdns! : []
    insightsIsEnabled: contains(firewallPolicyDefinition, 'insightsIsEnabled')
      ? firewallPolicyDefinition.insightsIsEnabled!
      : null
    intrusionDetection: !empty(firewallPolicyDefinition.?intrusionDetection)
      ? firewallPolicyDefinition.intrusionDetection!
      : null
    ipAddresses: !empty(firewallPolicyDefinition.?ipAddresses) ? firewallPolicyDefinition.ipAddresses! : null
    keyVaultSecretId: !empty(firewallPolicyDefinition.?keyVaultSecretId)
      ? firewallPolicyDefinition.keyVaultSecretId!
      : null
    location: !empty(firewallPolicyDefinition.?location) ? firewallPolicyDefinition.location! : location
    lock: !empty(firewallPolicyDefinition.?lock) ? firewallPolicyDefinition.lock! : null
    managedIdentities: !empty(firewallPolicyDefinition.?managedIdentities)
      ? firewallPolicyDefinition.managedIdentities!
      : null
    retentionDays: contains(firewallPolicyDefinition, 'retentionDays') ? firewallPolicyDefinition.retentionDays! : null
    roleAssignments: !empty(firewallPolicyDefinition.?roleAssignments) ? firewallPolicyDefinition.roleAssignments! : []
    ruleCollectionGroups: !empty(firewallPolicyDefinition.?ruleCollectionGroups)
      ? firewallPolicyDefinition.ruleCollectionGroups!
      : []
    servers: !empty(firewallPolicyDefinition.?servers) ? firewallPolicyDefinition.servers! : []
    snat: !empty(firewallPolicyDefinition.?snat) ? firewallPolicyDefinition.snat! : null
    tags: !empty(firewallPolicyDefinition.?tags) ? firewallPolicyDefinition.tags! : tags
    threatIntelMode: !empty(firewallPolicyDefinition.?threatIntelMode)
      ? firewallPolicyDefinition.threatIntelMode!
      : null
    tier: !empty(firewallPolicyDefinition.?tier) ? firewallPolicyDefinition.tier! : null
    workspaces: !empty(firewallPolicyDefinition.?workspaces) ? firewallPolicyDefinition.workspaces! : []
  }
}

// 2.12. Observability - Log Analytics Workspace

@description('Conditional. Log Analytics Workspace configuration. Required if deployToggles.logAnalytics is true and resourceIds.logAnalyticsWorkspaceResourceId is empty.')
param logAnalyticsDefinition types.logAnalyticsDefinitionType = {
  // Required
  name: ''
}

resource existingLogAnalytics 'Microsoft.OperationalInsights/workspaces@2025-02-01' existing = if (!empty(resourceIds.logAnalyticsWorkspaceResourceId!)) {
  name: varExistingLawName
  scope: resourceGroup(varExistingLawSubscriptionId, varExistingLawResourceGroupName)
}
var varLogAnalyticsWorkspaceResourceId = varDeployLogAnalytics
  ? logAnalytics!.outputs.resourceId
  : !empty(resourceIds.logAnalyticsWorkspaceResourceId!) ? existingLogAnalytics.id : ''

// Naming
var varLawIdSegments = empty(resourceIds.logAnalyticsWorkspaceResourceId!)
  ? ['']
  : split(resourceIds.logAnalyticsWorkspaceResourceId!, '/')
var varExistingLawSubscriptionId = length(varLawIdSegments) >= 3 ? varLawIdSegments[2] : ''
var varExistingLawResourceGroupName = length(varLawIdSegments) >= 5 ? varLawIdSegments[4] : ''
var varExistingLawName = length(varLawIdSegments) >= 1 ? last(varLawIdSegments) : ''
var varLawName = !empty(resourceIds.logAnalyticsWorkspaceResourceId!)
  ? varExistingLawName
  : (empty(logAnalyticsDefinition.name!) ? 'log-${baseName}' : logAnalyticsDefinition.name!)

module logAnalytics 'br/public:avm/res/operational-insights/workspace:0.12.0' = if (varDeployLogAnalytics) {
  name: 'deployLogAnalytics'
  params: {
    // Required
    name: varLawName

    // Optionals (guarded)
    linkedStorageAccounts: !empty(logAnalyticsDefinition.?linkedStorageAccounts)
      ? logAnalyticsDefinition.linkedStorageAccounts!
      : []
    dailyQuotaGb: contains(logAnalyticsDefinition, 'dailyQuotaGb') ? logAnalyticsDefinition.dailyQuotaGb! : null
    dataExports: !empty(logAnalyticsDefinition.?dataExports) ? logAnalyticsDefinition.dataExports! : []
    dataRetention: contains(logAnalyticsDefinition, 'dataRetention') ? logAnalyticsDefinition.dataRetention! : 7
    dataSources: !empty(logAnalyticsDefinition.?dataSources) ? logAnalyticsDefinition.dataSources! : []
    diagnosticSettings: !empty(logAnalyticsDefinition.?diagnosticSettings)
      ? logAnalyticsDefinition.diagnosticSettings!
      : null
    enableTelemetry: enableTelemetry
    features: !empty(logAnalyticsDefinition.?features) ? logAnalyticsDefinition.features! : null
    forceCmkForQuery: contains(logAnalyticsDefinition, 'forceCmkForQuery')
      ? logAnalyticsDefinition.forceCmkForQuery!
      : null
    gallerySolutions: !empty(logAnalyticsDefinition.?gallerySolutions) ? logAnalyticsDefinition.gallerySolutions! : []
    linkedServices: !empty(logAnalyticsDefinition.?linkedServices) ? logAnalyticsDefinition.linkedServices! : []
    location: !empty(logAnalyticsDefinition.?location) ? logAnalyticsDefinition.location! : location
    lock: !empty(logAnalyticsDefinition.?lock) ? logAnalyticsDefinition.lock! : null
    managedIdentities: !empty(logAnalyticsDefinition.?managedIdentities)
      ? logAnalyticsDefinition.managedIdentities!
      : null
    onboardWorkspaceToSentinel: contains(logAnalyticsDefinition, 'onboardWorkspaceToSentinel')
      ? logAnalyticsDefinition.onboardWorkspaceToSentinel!
      : null
    publicNetworkAccessForIngestion: !empty(logAnalyticsDefinition.?publicNetworkAccessForIngestion)
      ? logAnalyticsDefinition.publicNetworkAccessForIngestion!
      : null
    publicNetworkAccessForQuery: !empty(logAnalyticsDefinition.?publicNetworkAccessForQuery)
      ? logAnalyticsDefinition.publicNetworkAccessForQuery!
      : null
    replication: !empty(logAnalyticsDefinition.?replication)
      ? logAnalyticsDefinition.replication!
      : { enabled: true, location: 'westus2' }
    roleAssignments: !empty(logAnalyticsDefinition.?roleAssignments) ? logAnalyticsDefinition.roleAssignments! : []
    savedSearches: !empty(logAnalyticsDefinition.?savedSearches) ? logAnalyticsDefinition.savedSearches! : []
    skuCapacityReservationLevel: contains(logAnalyticsDefinition, 'skuCapacityReservationLevel')
      ? logAnalyticsDefinition.skuCapacityReservationLevel!
      : null
    skuName: !empty(logAnalyticsDefinition.?skuName) ? logAnalyticsDefinition.skuName! : null
    storageInsightsConfigs: !empty(logAnalyticsDefinition.?storageInsightsConfigs)
      ? logAnalyticsDefinition.storageInsightsConfigs!
      : []
    tables: !empty(logAnalyticsDefinition.?tables) ? logAnalyticsDefinition.tables! : []
    tags: !empty(logAnalyticsDefinition.?tags) ? logAnalyticsDefinition.tags! : tags
  }
}

// 2.13. Observability - Application Insights
@description('Conditional. Application Insights configuration. Required if deployToggles.appInsights is true and resourceIds.appInsightsResourceId is empty; a Log Analytics workspace must exist or be deployed.')
param appInsightsDefinition types.appInsightsDefinitionType = {
  // Required
  name: ''
  workspaceResourceId: ''
}

resource existingAppInsights 'Microsoft.Insights/components@2020-02-02' existing = if (!empty(resourceIds.appInsightsResourceId!)) {
  name: varExistingAIName
  scope: resourceGroup(varExistingAISubscriptionId, varExistingAIResourceGroupName)
}

var varAppiResourceId = !empty(resourceIds.appInsightsResourceId!)
  ? existingAppInsights.id
  : (varDeployAppInsights ? appInsights!.outputs.resourceId : '')

// Naming
var varAiIdSegments = empty(resourceIds.appInsightsResourceId!) ? [''] : split(resourceIds.appInsightsResourceId!, '/')
var varExistingAISubscriptionId = length(varAiIdSegments) >= 3 ? varAiIdSegments[2] : ''
var varExistingAIResourceGroupName = length(varAiIdSegments) >= 5 ? varAiIdSegments[4] : ''
var varExistingAIName = length(varAiIdSegments) >= 1 ? last(varAiIdSegments) : ''
var varAppiName = !empty(resourceIds.appInsightsResourceId!)
  ? varExistingAIName
  : (empty(appInsightsDefinition.name!) ? 'appi-${baseName}' : appInsightsDefinition.name!)

module appInsights 'br/public:avm/res/insights/component:0.6.0' = if (varDeployAppInsights) {
  name: 'deployAppInsights'
  params: {
    // Required
    name: varAppiName
    // Use unified variable so this works for both existing and newly deployed workspace
    workspaceResourceId: varLogAnalyticsWorkspaceResourceId

    // Optionals (guarded)
    applicationType: !empty(appInsightsDefinition.?applicationType) ? appInsightsDefinition.applicationType! : null
    diagnosticSettings: !empty(appInsightsDefinition.?diagnosticSettings)
      ? appInsightsDefinition.diagnosticSettings!
      : null
    disableIpMasking: contains(appInsightsDefinition, 'disableIpMasking')
      ? appInsightsDefinition.disableIpMasking!
      : true
    disableLocalAuth: contains(appInsightsDefinition, 'disableLocalAuth')
      ? appInsightsDefinition.disableLocalAuth!
      : null
    enableTelemetry: enableTelemetry
    flowType: !empty(appInsightsDefinition.?flowType) ? appInsightsDefinition.flowType! : null
    forceCustomerStorageForProfiler: contains(appInsightsDefinition, 'forceCustomerStorageForProfiler')
      ? appInsightsDefinition.forceCustomerStorageForProfiler!
      : null
    kind: !empty(appInsightsDefinition.?kind) ? appInsightsDefinition.kind! : null
    linkedStorageAccountResourceId: !empty(appInsightsDefinition.?linkedStorageAccountResourceId)
      ? appInsightsDefinition.linkedStorageAccountResourceId!
      : null
    location: !empty(appInsightsDefinition.?location) ? appInsightsDefinition.location! : location
    lock: !empty(appInsightsDefinition.?lock) ? appInsightsDefinition.lock! : null
    publicNetworkAccessForIngestion: !empty(appInsightsDefinition.?publicNetworkAccessForIngestion)
      ? appInsightsDefinition.publicNetworkAccessForIngestion!
      : null
    publicNetworkAccessForQuery: !empty(appInsightsDefinition.?publicNetworkAccessForQuery)
      ? appInsightsDefinition.publicNetworkAccessForQuery!
      : null
    requestSource: !empty(appInsightsDefinition.?requestSource) ? appInsightsDefinition.requestSource! : null
    retentionInDays: contains(appInsightsDefinition, 'retentionInDays') ? appInsightsDefinition.retentionInDays! : null
    roleAssignments: !empty(appInsightsDefinition.?roleAssignments) ? appInsightsDefinition.roleAssignments! : null
    samplingPercentage: contains(appInsightsDefinition, 'samplingPercentage')
      ? appInsightsDefinition.samplingPercentage!
      : null
    tags: !empty(appInsightsDefinition.?tags) ? appInsightsDefinition.tags! : tags
  }
  dependsOn: [
    #disable-next-line BCP321
    (empty(resourceIds.logAnalyticsWorkspaceResourceId!)) ? logAnalytics : null
  ]
}

// 2.14. Container App Environment

@description('Conditional. Container Apps Environment configuration. Required if deployGenAiAppBackingServices is true, deployToggles.containerEnv is true, and resourceIds.containerEnvResourceId is empty.')
param containerAppEnvDefinition types.containerAppEnvDefinitionType = {
  // Required
  name: ''
}

resource existingContainerEnv 'Microsoft.App/managedEnvironments@2025-02-02-preview' existing = if (!empty(resourceIds.containerEnvResourceId!)) {
  name: varExistingEnvName
  scope: resourceGroup(varExistingEnvSubscriptionId, varExistingEnvResourceGroup)
}
var varContainerEnvResourceId = !empty(resourceIds.containerEnvResourceId!)
  ? existingContainerEnv.id
  : (varDeployContainerAppEnv ? containerEnv!.outputs.resourceId : '')

// Naming
var varEnvIdSegments = empty(resourceIds.containerEnvResourceId!)
  ? ['']
  : split(resourceIds.containerEnvResourceId!, '/')
var varExistingEnvSubscriptionId = length(varEnvIdSegments) >= 3 ? varEnvIdSegments[2] : ''
var varExistingEnvResourceGroup = length(varEnvIdSegments) >= 5 ? varEnvIdSegments[4] : ''
var varExistingEnvName = length(varEnvIdSegments) >= 1 ? last(varEnvIdSegments) : ''
var varContainerEnvName = !empty(resourceIds.containerEnvResourceId!)
  ? varExistingEnvName
  : (empty(containerAppEnvDefinition.name!) ? 'cae-${baseName}' : containerAppEnvDefinition.name!)

module containerEnv 'br/public:avm/res/app/managed-environment:0.11.3' = if (varDeployContainerAppEnv) {
  name: 'deployContainerEnv'
  params: {
    // Required
    name: varContainerEnvName

    // Optionals (guarded)
    dockerBridgeCidr: !empty(containerAppEnvDefinition.?dockerBridgeCidr)
      ? containerAppEnvDefinition.dockerBridgeCidr!
      : ''
    // infrastructureResourceGroupName line intentionally removed to allow module default
    infrastructureSubnetResourceId: !empty(containerAppEnvDefinition.?infrastructureSubnetResourceId)
      ? containerAppEnvDefinition.infrastructureSubnetResourceId!
      : (!empty(varAcaInfraSubnetId) ? varAcaInfraSubnetId : '')
    internal: contains(containerAppEnvDefinition, 'internal') ? containerAppEnvDefinition.internal! : false
    platformReservedCidr: !empty(containerAppEnvDefinition.?platformReservedCidr)
      ? containerAppEnvDefinition.platformReservedCidr!
      : ''
    platformReservedDnsIP: !empty(containerAppEnvDefinition.?platformReservedDnsIP)
      ? containerAppEnvDefinition.platformReservedDnsIP!
      : ''
    workloadProfiles: !empty(containerAppEnvDefinition.?workloadProfiles)
      ? containerAppEnvDefinition.workloadProfiles!
      : [
          {
            name: 'Consumption'
            workloadProfileType: 'Consumption'
          }
          {
            workloadProfileType: 'D4'
            name: 'default'
            minimumCount: 1
            maximumCount: 3
          }
        ]
    appInsightsConnectionString: !empty(containerAppEnvDefinition.?appInsightsConnectionString)
      ? containerAppEnvDefinition.appInsightsConnectionString!
      : (varDeployAppInsights ? appInsights!.outputs.connectionString : '')
    appLogsConfiguration: !empty(containerAppEnvDefinition.?appLogsConfiguration)
      ? containerAppEnvDefinition.appLogsConfiguration!
      : null
    certificate: !empty(containerAppEnvDefinition.?certificate) ? containerAppEnvDefinition.certificate! : null
    certificatePassword: !empty(containerAppEnvDefinition.?certificatePassword)
      ? containerAppEnvDefinition.certificatePassword!
      : ''
    certificateValue: !empty(containerAppEnvDefinition.?certificateValue)
      ? containerAppEnvDefinition.certificateValue!
      : ''
    daprAIConnectionString: !empty(containerAppEnvDefinition.?daprAIConnectionString)
      ? containerAppEnvDefinition.daprAIConnectionString!
      : ''
    daprAIInstrumentationKey: !empty(containerAppEnvDefinition.?daprAIInstrumentationKey)
      ? containerAppEnvDefinition.daprAIInstrumentationKey!
      : ''
    dnsSuffix: !empty(containerAppEnvDefinition.?dnsSuffix) ? containerAppEnvDefinition.dnsSuffix! : ''
    enableTelemetry: enableTelemetry
    location: !empty(containerAppEnvDefinition.?location) ? containerAppEnvDefinition.location! : location
    lock: !empty(containerAppEnvDefinition.?lock) ? containerAppEnvDefinition.lock! : null
    managedIdentities: !empty(containerAppEnvDefinition.?managedIdentities)
      ? containerAppEnvDefinition.managedIdentities!
      : null
    openTelemetryConfiguration: !empty(containerAppEnvDefinition.?openTelemetryConfiguration)
      ? containerAppEnvDefinition.openTelemetryConfiguration!
      : {}
    peerTrafficEncryption: contains(containerAppEnvDefinition, 'peerTrafficEncryption')
      ? containerAppEnvDefinition.peerTrafficEncryption!
      : true
    publicNetworkAccess: !empty(containerAppEnvDefinition.?publicNetworkAccess)
      ? containerAppEnvDefinition.publicNetworkAccess!
      : 'Disabled'
    roleAssignments: !empty(containerAppEnvDefinition.?roleAssignments)
      ? containerAppEnvDefinition.roleAssignments!
      : []
    storages: !empty(containerAppEnvDefinition.?storages) ? containerAppEnvDefinition.storages! : []
    tags: !empty(containerAppEnvDefinition.?tags) ? containerAppEnvDefinition.tags! : tags
    zoneRedundant: contains(containerAppEnvDefinition, 'zoneRedundant')
      ? containerAppEnvDefinition.zoneRedundant!
      : true
  }
  dependsOn: [
    #disable-next-line BCP321
    (empty(resourceIds.virtualNetworkResourceId!)) ? vNetwork : null
    #disable-next-line BCP321
    (empty(resourceIds.logAnalyticsWorkspaceResourceId!)) ? logAnalytics : null
  ]
}

// 2.15. App Configuration Store

@description('Conditional. App Configuration store settings. Required if deployGenAiAppBackingServices is true, deployToggles.appConfig is true, and resourceIds.appConfigResourceId is empty.')
param appConfigurationDefinition types.appConfigurationDefinitionType = {
  // Required parameters
  name: ''
}

resource existingAppConfig 'Microsoft.AppConfiguration/configurationStores@2024-06-01' existing = if (!empty(resourceIds.appConfigResourceId!)) {
  name: varExistingAppcsName
  scope: resourceGroup(varExistingAppcsSub, varExistingAppcsRg)
}

// Naming
var varAppcsIdSegments = empty(resourceIds.appConfigResourceId!) ? [''] : split(resourceIds.appConfigResourceId!, '/')
var varExistingAppcsSub = length(varAppcsIdSegments) >= 3 ? varAppcsIdSegments[2] : ''
var varExistingAppcsRg = length(varAppcsIdSegments) >= 5 ? varAppcsIdSegments[4] : ''
var varExistingAppcsName = length(varAppcsIdSegments) >= 1 ? last(varAppcsIdSegments) : ''
var varAppConfigName = !empty(resourceIds.appConfigResourceId!)
  ? varExistingAppcsName
  : (empty(appConfigurationDefinition.name!) ? 'appcs-${baseName}' : appConfigurationDefinition.name!)

var varAppConfigResourceId = !empty(resourceIds.appConfigResourceId!)
  ? resourceIds.appConfigResourceId!
  : (varDeployAppConfig ? resourceId('Microsoft.AppConfiguration/configurationStores', varAppConfigName) : '')

module configurationStore 'br/public:avm/res/app-configuration/configuration-store:0.9.2' = if (varDeployAppConfig) {
  name: 'configurationStoreDeployment'
  params: {
    // Required / provided name logic stays
    name: empty(appConfigurationDefinition.name) ? varAppConfigName : appConfigurationDefinition.name

    // Guarded optionals
    location: !empty(appConfigurationDefinition.?location) ? appConfigurationDefinition.location! : location
    createMode: !empty(appConfigurationDefinition.?createMode) ? appConfigurationDefinition.createMode! : null
    customerManagedKey: !empty(appConfigurationDefinition.?customerManagedKey)
      ? appConfigurationDefinition.customerManagedKey!
      : null
    dataPlaneProxy: !empty(appConfigurationDefinition.?dataPlaneProxy)
      ? appConfigurationDefinition.dataPlaneProxy!
      : null
    diagnosticSettings: !empty(appConfigurationDefinition.?diagnosticSettings)
      ? appConfigurationDefinition.diagnosticSettings!
      : null
    disableLocalAuth: contains(appConfigurationDefinition, 'disableLocalAuth')
      ? appConfigurationDefinition.disableLocalAuth!
      : null
    enablePurgeProtection: contains(appConfigurationDefinition, 'enablePurgeProtection')
      ? appConfigurationDefinition.enablePurgeProtection!
      : null
    enableTelemetry: enableTelemetry
    keyValues: !empty(appConfigurationDefinition.?keyValues) ? appConfigurationDefinition.keyValues! : null
    lock: !empty(appConfigurationDefinition.?lock) ? appConfigurationDefinition.lock! : null
    managedIdentities: !empty(appConfigurationDefinition.?managedIdentities)
      ? appConfigurationDefinition.managedIdentities!
      : null
    privateEndpoints: !empty(appConfigurationDefinition.?privateEndpoints)
      ? appConfigurationDefinition.privateEndpoints!
      : null
    publicNetworkAccess: !empty(appConfigurationDefinition.?publicNetworkAccess)
      ? appConfigurationDefinition.publicNetworkAccess!
      : null
    replicaLocations: !empty(appConfigurationDefinition.?replicaLocations)
      ? appConfigurationDefinition.replicaLocations!
      : [
          {
            replicaLocation: 'eastus'
            name: 'eastus'
          }
          {
            replicaLocation: 'centralus'
            name: 'centralus'
          }
        ]
    roleAssignments: !empty(appConfigurationDefinition.?roleAssignments)
      ? appConfigurationDefinition.roleAssignments!
      : null
    sku: !empty(appConfigurationDefinition.?sku) ? appConfigurationDefinition.sku! : null
    softDeleteRetentionInDays: contains(appConfigurationDefinition, 'softDeleteRetentionInDays')
      ? appConfigurationDefinition.softDeleteRetentionInDays!
      : null
    tags: !empty(appConfigurationDefinition.?tags) ? appConfigurationDefinition.tags! : tags
  }
}

// 2.16. Container Apps
@description('Optional. List of Container Apps to create.')
param containerAppsList types.containerAppDefinitionType[] = [
  {
    // Required
    name: 'hello-world'
    environmentResourceId: ''
    workloadProfileName: 'default'
    containers: []
  }
]

var varContainerDummyImageName = 'mcr.microsoft.com/azuredocs/containerapps-helloworld:latest'

@batchSize(4)
module containerApps 'br/public:avm/res/app/container-app:0.18.1' = [
  for (app, index) in containerAppsList: if (varDeployContainerApps) {
    name: empty(app.name!) ? 'ca-${baseName}-${app.name}' : app.name!
    params: {
      // Required
      name: empty(app.name!) ? 'ca-${baseName}-${index}' : app.name!
      environmentResourceId: empty(resourceIds.containerEnvResourceId!)
        ? containerEnv!.outputs.resourceId
        : existingContainerEnv.id
      containers: [
        {
          name: empty(app.name!) ? 'ca-${baseName}-${index}' : app.name!
          image: varContainerDummyImageName
          resources: {
            cpu: '0.5'
            memory: '1.0Gi'
          }
          env: [
            {
              name: 'APP_CONFIG_ENDPOINT'
              value: empty(varAppConfigResourceId) ? '' : 'https://${varAppConfigName}.azconfig.io'
            }
          ]
        }
      ]

      // Optional (only nullable params passed; guard -> null when absent)
      activeRevisionsMode: !empty(app.?activeRevisionsMode) ? app.activeRevisionsMode! : null
      additionalPortMappings: !empty(app.?additionalPortMappings) ? app.additionalPortMappings! : null
      authConfig: !empty(app.?authConfig) ? app.authConfig! : null
      clientCertificateMode: !empty(app.?clientCertificateMode) ? app.clientCertificateMode! : null
      corsPolicy: !empty(app.?corsPolicy) ? app.corsPolicy! : null
      customDomains: !empty(app.?customDomains) ? app.customDomains! : null
      dapr: !empty(app.?dapr) ? app.dapr! : null
      diagnosticSettings: !empty(app.?diagnosticSettings) ? app.diagnosticSettings! : null
      identitySettings: !empty(app.?identitySettings) ? app.identitySettings! : null
      initContainersTemplate: !empty(app.?initContainersTemplate) ? app.initContainersTemplate! : null
      ipSecurityRestrictions: !empty(app.?ipSecurityRestrictions) ? app.ipSecurityRestrictions! : null
      lock: !empty(app.?lock) ? app.lock! : null
      location: !empty(app.?location) ? app.location! : null
      managedIdentities: !empty(app.?managedIdentities) ? app.managedIdentities! : null
      registries: !empty(app.?registries) ? app.registries! : null
      revisionSuffix: !empty(app.?revisionSuffix) ? app.revisionSuffix! : null
      roleAssignments: !empty(app.?roleAssignments) ? app.roleAssignments! : null
      runtime: !empty(app.?runtime) ? app.runtime! : null
      scaleSettings: !empty(app.?scaleSettings) ? app.scaleSettings! : null
      secrets: !empty(app.?secrets) ? app.secrets! : null
      service: !empty(app.?service) ? app.service! : null
      serviceBinds: !empty(app.?serviceBinds) ? app.serviceBinds! : null
      stickySessionsAffinity: !empty(app.?stickySessionsAffinity) ? app.stickySessionsAffinity! : null
      tags: !empty(app.?tags) ? app.tags! : null
      trafficLabel: !empty(app.?trafficLabel) ? app.trafficLabel! : null
      trafficLatestRevision: contains(app, 'trafficLatestRevision') ? app.trafficLatestRevision! : null
      trafficRevisionName: !empty(app.?trafficRevisionName) ? app.trafficRevisionName! : null
      trafficWeight: contains(app, 'trafficWeight') ? app.trafficWeight! : null
      volumes: !empty(app.?volumes) ? app.volumes! : null
      workloadProfileName: !empty(app.?workloadProfileName) ? app.workloadProfileName! : null

      // Global telemetry passthrough (keep so a global disable propagates)
      enableTelemetry: enableTelemetry
    }
    dependsOn: [
      #disable-next-line BCP321
      (empty(resourceIds.containerEnvResourceId!)) ? containerEnv : null
      #disable-next-line BCP321
      (varDeployPdnsAndPe && !varUseExistingPdz.containerApps && varHasContainerEnv)
        ? privateDnsZoneContainerApps
        : null
      #disable-next-line BCP321
      (varDeployPdnsAndPe && varHasContainerEnv) ? privateEndpointContainerAppsEnv : null
    ]
  }
]

@description('Conditional. Container Registry configuration. Required if deployGenAiAppBackingServices is true, deployToggles.containerRegistry is true, and resourceIds.containerRegistryResourceId is empty.')
param containerRegistryDefinition types.containerRegistryDefinitionType = {
  // Required parameters
  name: ''
}

var varAcrIdSegments = empty(resourceIds.containerRegistryResourceId!)
  ? ['']
  : split(resourceIds.containerRegistryResourceId!, '/')
var varExistingAcrSub = length(varAcrIdSegments) >= 3 ? varAcrIdSegments[2] : ''
var varExistingAcrRg = length(varAcrIdSegments) >= 5 ? varAcrIdSegments[4] : ''
var varExistingAcrName = length(varAcrIdSegments) >= 1 ? last(varAcrIdSegments) : ''
var varAcrNameEffective = !empty(resourceIds.containerRegistryResourceId!)
  ? varExistingAcrName
  : (empty(containerRegistryDefinition.name) ? 'cr${baseName}' : containerRegistryDefinition.name)
var varAcrResourceId = !empty(resourceIds.containerRegistryResourceId!)
  ? existingAcr.id
  : (varDeployAcr ? containerRegistry!.outputs.resourceId : '')

// existing logic
resource existingAcr 'Microsoft.ContainerRegistry/registries@2025-05-01-preview' existing = if (!empty(resourceIds.containerRegistryResourceId!)) {
  name: varExistingAcrName
  scope: resourceGroup(varExistingAcrSub, varExistingAcrRg)
}

module containerRegistry 'br/public:avm/res/container-registry/registry:0.9.3' = if (varDeployAcr) {
  name: 'containerRegistryDeployment'
  params: {
    // Required
    name: varAcrNameEffective

    // Nullable / genuinely optional pass-throughs (guarded -> null when absent)
    roleAssignments: !empty(containerRegistryDefinition.?roleAssignments)
      ? containerRegistryDefinition.roleAssignments!
      : null
    cacheRules: !empty(containerRegistryDefinition.?cacheRules) ? containerRegistryDefinition.cacheRules! : null
    credentialSets: !empty(containerRegistryDefinition.?credentialSets)
      ? containerRegistryDefinition.credentialSets!
      : null
    customerManagedKey: !empty(containerRegistryDefinition.?customerManagedKey)
      ? containerRegistryDefinition.customerManagedKey!
      : null
    diagnosticSettings: !empty(containerRegistryDefinition.?diagnosticSettings)
      ? containerRegistryDefinition.diagnosticSettings!
      : null
    lock: !empty(containerRegistryDefinition.?lock) ? containerRegistryDefinition.lock! : null
    managedIdentities: !empty(containerRegistryDefinition.?managedIdentities)
      ? containerRegistryDefinition.managedIdentities!
      : null
    networkRuleSetIpRules: !empty(containerRegistryDefinition.?networkRuleSetIpRules)
      ? containerRegistryDefinition.networkRuleSetIpRules!
      : null
    privateEndpoints: !empty(containerRegistryDefinition.?privateEndpoints)
      ? containerRegistryDefinition.privateEndpoints!
      : null
    publicNetworkAccess: !empty(containerRegistryDefinition.?publicNetworkAccess)
      ? containerRegistryDefinition.publicNetworkAccess!
      : 'Disabled'
    replications: !empty(containerRegistryDefinition.?replications) ? containerRegistryDefinition.replications! : null
    scopeMaps: !empty(containerRegistryDefinition.?scopeMaps) ? containerRegistryDefinition.scopeMaps! : null
    tags: !empty(containerRegistryDefinition.?tags) ? containerRegistryDefinition.tags! : null
    webhooks: !empty(containerRegistryDefinition.?webhooks) ? containerRegistryDefinition.webhooks! : null

    // Telemetry passthrough
    enableTelemetry: enableTelemetry
  }
}

// 2.17. Cosmos DB Account (GenAI app scope)

@description('Conditional. Cosmos DB account configuration for the GenAI app. Required if deployGenAiAppBackingServices is true, deployToggles.cosmosDb is true, and resourceIds.dbAccountResourceId is empty.')
param cosmosDbDefinition types.genAIAppCosmosDbDefinitionType?

resource existingCosmos 'Microsoft.DocumentDB/databaseAccounts@2025-04-15' existing = if (!empty(resourceIds.dbAccountResourceId!)) {
  name: varExistingCosmosDbName
  scope: resourceGroup(varExistingCosmosDbSubscriptionId, varExistingCosmosDbResourceGroupName)
}
var varDbAccountResourceId = !empty(resourceIds.dbAccountResourceId!)
  ? existingCosmos.id
  : (varDeployCosmos ? cosmosDbAccount!.outputs.resourceId : '')

// Naming
var varCosmosDbSegments = empty(resourceIds.dbAccountResourceId!) ? [''] : split(resourceIds.dbAccountResourceId!, '/')
var varExistingCosmosDbSubscriptionId = length(varCosmosDbSegments) >= 3 ? varCosmosDbSegments[2] : ''
var varExistingCosmosDbResourceGroupName = length(varCosmosDbSegments) >= 5 ? varCosmosDbSegments[4] : ''
var varExistingCosmosDbName = length(varCosmosDbSegments) >= 1 ? last(varCosmosDbSegments) : ''
var varCosmosDbName = !empty(resourceIds.dbAccountResourceId!)
  ? varExistingCosmosDbName
  : (empty(cosmosDbDefinition!.name!) ? 'cos-${baseName}' : cosmosDbDefinition!.name!)

module cosmosDbAccount 'br/public:avm/res/document-db/database-account:0.16.0' = if (varDeployCosmos) {
  name: 'databaseAccountDeployment'
  params: {
    // Required
    name: varCosmosDbName

    // Nullable / optional guarded pass-throughs
    capabilitiesToAdd: !empty(cosmosDbDefinition.?capabilitiesToAdd) ? cosmosDbDefinition!.capabilitiesToAdd! : null
    dataPlaneRoleAssignments: !empty(cosmosDbDefinition.?dataPlaneRoleAssignments)
      ? cosmosDbDefinition!.dataPlaneRoleAssignments!
      : null
    dataPlaneRoleDefinitions: !empty(cosmosDbDefinition.?dataPlaneRoleDefinitions)
      ? cosmosDbDefinition!.dataPlaneRoleDefinitions!
      : null
    diagnosticSettings: !empty(cosmosDbDefinition.?diagnosticSettings) ? cosmosDbDefinition!.diagnosticSettings! : null
    failoverLocations: !empty(cosmosDbDefinition.?failoverLocations) ? cosmosDbDefinition!.failoverLocations! : null
    gremlinDatabases: !empty(cosmosDbDefinition.?gremlinDatabases) ? cosmosDbDefinition!.gremlinDatabases! : null
    lock: !empty(cosmosDbDefinition.?lock) ? cosmosDbDefinition!.lock! : null
    managedIdentities: !empty(cosmosDbDefinition.?managedIdentities) ? cosmosDbDefinition!.managedIdentities! : null
    mongodbDatabases: !empty(cosmosDbDefinition.?mongodbDatabases) ? cosmosDbDefinition!.mongodbDatabases! : null
    privateEndpoints: !empty(cosmosDbDefinition.?privateEndpoints) ? cosmosDbDefinition!.privateEndpoints! : null
    roleAssignments: !empty(cosmosDbDefinition.?roleAssignments) ? cosmosDbDefinition!.roleAssignments! : null
    sqlDatabases: !empty(cosmosDbDefinition.?sqlDatabases) ? cosmosDbDefinition!.sqlDatabases! : null
    tables: !empty(cosmosDbDefinition.?tables) ? cosmosDbDefinition!.tables! : null
    tags: !empty(cosmosDbDefinition.?tags) ? cosmosDbDefinition!.tags! : null

    // Telemetry passthrough so a global toggle still works
    enableTelemetry: enableTelemetry
  }
}

// 2.18. Key Vault (GenAI app scope)

@description('Conditional. Key Vault configuration for the GenAI app. Required if deployGenAiAppBackingServices is true, deployToggles.keyVault is true, and resourceIds.keyVaultResourceId is empty.')
param keyVaultDefinition types.keyVaultDefinitionType?

resource existingVault 'Microsoft.KeyVault/vaults@2024-12-01-preview' existing = if (!empty(resourceIds.keyVaultResourceId!)) {
  name: varExistingKvName
  scope: resourceGroup(varExistingKvSub, varExistingKvRg)
}
var varKvResourceId = !empty(resourceIds.keyVaultResourceId!)
  ? existingVault.id
  : (varDeployKv ? vault!.outputs.resourceId : '')

// Naming
var varKvIdSegments = empty(resourceIds.keyVaultResourceId!) ? [''] : split(resourceIds.keyVaultResourceId!, '/')
var varExistingKvSub = length(varKvIdSegments) >= 3 ? varKvIdSegments[2] : ''
var varExistingKvRg = length(varKvIdSegments) >= 5 ? varKvIdSegments[4] : ''
var varExistingKvName = length(varKvIdSegments) >= 1 ? last(varKvIdSegments) : ''
var varKvName = !empty(resourceIds.keyVaultResourceId!)
  ? varExistingKvName
  : (empty(keyVaultDefinition!.name!) ? 'kv-${baseName}' : keyVaultDefinition!.name!)

module vault 'br/public:avm/res/key-vault/vault:0.13.3' = if (varDeployKv) {
  name: 'vaultDeployment'
  params: {
    // Required
    name: varKvName

    // Optional guarded pass-throughs (omit non-nullables with upstream defaults)
    accessPolicies: !empty(keyVaultDefinition.?accessPolicies) ? keyVaultDefinition!.accessPolicies! : null
    secrets: !empty(keyVaultDefinition.?secrets) ? keyVaultDefinition!.secrets! : null
    keys: !empty(keyVaultDefinition.?keys) ? keyVaultDefinition!.keys! : null
    networkAcls: !empty(keyVaultDefinition.?networkAcls) ? keyVaultDefinition!.networkAcls! : null
    lock: !empty(keyVaultDefinition.?lock) ? keyVaultDefinition!.lock! : null
    roleAssignments: !empty(keyVaultDefinition.?roleAssignments) ? keyVaultDefinition!.roleAssignments! : null
    privateEndpoints: !empty(keyVaultDefinition.?privateEndpoints) ? keyVaultDefinition!.privateEndpoints! : null
    diagnosticSettings: !empty(keyVaultDefinition.?diagnosticSettings) ? keyVaultDefinition!.diagnosticSettings! : null
    tags: !empty(keyVaultDefinition.?tags) ? keyVaultDefinition!.tags! : null

    // Telemetry (keep if you purposely surface the toggle; remove if you want to rely on module default)
    enableTelemetry: enableTelemetry
  }
}

// 2.19. Storage Account (GenAI app scope)

@description('Conditional. Storage Account configuration for the GenAI app. Required if deployGenAiAppBackingServices is true, deployToggles.storageAccount is true, and resourceIds.storageAccountResourceId is empty.')
param storageAccountDefinition types.storageAccountDefinitionType?

resource existingStorage 'Microsoft.Storage/storageAccounts@2025-01-01' existing = if (!empty(resourceIds.storageAccountResourceId!)) {
  name: varExistingSaName
  scope: resourceGroup(varExistingSaSub, varExistingSaRg)
}
var varSaResourceId = !empty(resourceIds.storageAccountResourceId!)
  ? existingStorage.id
  : (varDeploySa ? storageAccount!.outputs.resourceId : '')

// Naming
var varSaIdSegments = empty(resourceIds.storageAccountResourceId!)
  ? ['']
  : split(resourceIds.storageAccountResourceId!, '/')
var varExistingSaSub = length(varSaIdSegments) >= 3 ? varSaIdSegments[2] : ''
var varExistingSaRg = length(varSaIdSegments) >= 5 ? varSaIdSegments[4] : ''
var varExistingSaName = length(varSaIdSegments) >= 1 ? last(varSaIdSegments) : ''
var varSaName = !empty(resourceIds.storageAccountResourceId!)
  ? varExistingSaName
  : (empty(storageAccountDefinition!.name!) ? 'st${baseName}' : storageAccountDefinition!.name!)

module storageAccount 'br/public:avm/res/storage/storage-account:0.26.2' = if (varDeploySa) {
  name: 'storageAccountDeployment'
  params: {
    // Required
    name: varSaName

    // Guarded optionals (only pass when present & non-empty; otherwise null so upstream defaults apply)
    roleAssignments: !empty(storageAccountDefinition.?roleAssignments)
      ? storageAccountDefinition!.roleAssignments!
      : null
    managedIdentities: !empty(storageAccountDefinition.?managedIdentities)
      ? storageAccountDefinition!.managedIdentities!
      : null
    azureFilesIdentityBasedAuthentication: !empty(storageAccountDefinition.?azureFilesIdentityBasedAuthentication)
      ? storageAccountDefinition!.azureFilesIdentityBasedAuthentication!
      : null
    networkAcls: !empty(storageAccountDefinition.?networkAcls) ? storageAccountDefinition!.networkAcls! : null
    privateEndpoints: !empty(storageAccountDefinition.?privateEndpoints)
      ? storageAccountDefinition!.privateEndpoints!
      : null
    managementPolicyRules: !empty(storageAccountDefinition.?managementPolicyRules)
      ? storageAccountDefinition!.managementPolicyRules!
      : null
    dnsEndpointType: !empty(storageAccountDefinition.?dnsEndpointType)
      ? storageAccountDefinition!.dnsEndpointType!
      : null
    enableHierarchicalNamespace: contains(storageAccountDefinition!, 'enableHierarchicalNamespace')
      ? storageAccountDefinition!.enableHierarchicalNamespace!
      : null
    customerManagedKey: !empty(storageAccountDefinition.?customerManagedKey)
      ? storageAccountDefinition!.customerManagedKey!
      : null
    lock: !empty(storageAccountDefinition.?lock) ? storageAccountDefinition!.lock! : null
    localUsers: !empty(storageAccountDefinition.?localUsers) ? storageAccountDefinition!.localUsers! : null
    allowedCopyScope: !empty(storageAccountDefinition.?allowedCopyScope)
      ? storageAccountDefinition!.allowedCopyScope!
      : null
    publicNetworkAccess: !empty(storageAccountDefinition.?publicNetworkAccess)
      ? storageAccountDefinition!.publicNetworkAccess!
      : null
    secretsExportConfiguration: !empty(storageAccountDefinition.?secretsExportConfiguration)
      ? storageAccountDefinition!.secretsExportConfiguration!
      : null
    keyType: !empty(storageAccountDefinition.?keyType) ? storageAccountDefinition!.keyType! : null
    diagnosticSettings: !empty(storageAccountDefinition.?diagnosticSettings)
      ? storageAccountDefinition!.diagnosticSettings!
      : null
    tags: !empty(storageAccountDefinition.?tags) ? storageAccountDefinition!.tags! : null

    // Telemetry passthrough (keep for global toggle)
    enableTelemetry: enableTelemetry
  }
}

//2.20. AI Search (GenAI app scope)
@description('Conditional. Azure AI Search configuration for the GenAI app. Required if deployGenAiAppBackingServices is true, deployToggles.searchService is true, and resourceIds.searchServiceResourceId is empty.')
param searchDefinition types.kSAISearchDefinitionType?

#disable-next-line BCP081
resource existingSearch 'Microsoft.Search/searchServices@2024-03-01' existing = if (!empty(resourceIds.searchServiceResourceId!)) {
  name: varExistingSearchName
  scope: resourceGroup(varExistingSearchSub, varExistingSearchRg)
}
var varSearchServiceResourceId = !empty(resourceIds.searchServiceResourceId!)
  ? existingSearch.id
  : (varDeploySearch ? searchService!.outputs.resourceId : '')

// Naming
var varSearchIdSegments = empty(resourceIds.searchServiceResourceId!)
  ? ['']
  : split(resourceIds.searchServiceResourceId!, '/')
var varExistingSearchSub = length(varSearchIdSegments) >= 3 ? varSearchIdSegments[2] : ''
var varExistingSearchRg = length(varSearchIdSegments) >= 5 ? varSearchIdSegments[4] : ''
var varExistingSearchName = length(varSearchIdSegments) >= 1 ? last(varSearchIdSegments) : ''
var varSearchName = !empty(resourceIds.searchServiceResourceId!)
  ? varExistingSearchName
  : (empty(searchDefinition!.name!) ? 'srch-${baseName}' : searchDefinition!.name!)

module searchService 'br/public:avm/res/search/search-service:0.11.1' = if (varDeploySearch) {
  name: 'searchServiceDeployment'
  params: {
    // Required
    name: varSearchName

    // Guarded nullable / optional pass-throughs (null => let module defaults apply)
    secretsExportConfiguration: !empty(searchDefinition.?secretsExportConfiguration)
      ? searchDefinition!.secretsExportConfiguration!
      : null
    authOptions: !empty(searchDefinition.?authOptions) ? searchDefinition!.authOptions! : null
    diagnosticSettings: !empty(searchDefinition.?diagnosticSettings) ? searchDefinition!.diagnosticSettings! : null
    lock: !empty(searchDefinition.?lock) ? searchDefinition!.lock! : null
    managedIdentities: !empty(searchDefinition.?managedIdentities) ? searchDefinition!.managedIdentities! : null
    networkRuleSet: !empty(searchDefinition.?networkRuleSet) ? searchDefinition!.networkRuleSet! : null
    privateEndpoints: !empty(searchDefinition.?privateEndpoints) ? searchDefinition!.privateEndpoints! : null
    roleAssignments: !empty(searchDefinition.?roleAssignments) ? searchDefinition!.roleAssignments! : null
    semanticSearch: !empty(searchDefinition.?semanticSearch) ? searchDefinition!.semanticSearch! : null
    tags: !empty(searchDefinition.?tags) ? searchDefinition!.tags! : null

    // Telemetry passthrough
    enableTelemetry: enableTelemetry
  }
}

// 2.21. Grounding with Bing
@description('Conditional. Grounding with Bing configuration. Required if deployToggles.groundingWithBingSearch is true and resourceIds.groundingServiceResourceId is empty.')
param groundingWithBingDefinition types.kSGroundingWithBingDefinitionType?

// Decide if Bing module runs (create or reuse+connect)
var varInvokeBingModule = (!empty(resourceIds.groundingServiceResourceId!)) || (deployToggles.groundingWithBingSearch && empty(resourceIds.groundingServiceResourceId!))

var varBingNameEffective = empty(groundingWithBingDefinition!.name!)
  ? 'bing-${baseName}'
  : groundingWithBingDefinition!.name!

// Run this module when:
//  - creating a new Bing account (toggle true, no existing), OR
//  - reusing an existing account (existing ID provided) but we still need to create the CS connection.
module bingSearch 'components/bing-search/main.bicep' = if (varInvokeBingModule) {
  name: 'bingsearchDeployment'
  params: {
    // AF context from the AVM/Foundry module outputs
    accountName: aiFoundry.outputs.aiServicesName
    projectName: aiFoundry.outputs.aiProjectName

    // Deterministic default for the Bing account (only used on create path)
    bingSearchName: varBingNameEffective

    // Reuse path: when provided, the child module will NOT create the Bing account,
    // it will use this existing one and still create the connection.
    existingResourceId: resourceIds.groundingServiceResourceId!
  }
  dependsOn: [
    aiFoundry!
  ]
}

// 2.22. VMs - Build VM configuration
@description('Conditional. Build VM configuration to support CI/CD workers (Linux). Required if deployToggles.buildVm is true and you intend to deploy the Build VM.')
param buildVmDefinition types.buildVmDefinitionType?

@description('Conditional. Jump (bastion) VM Maintenance Definition (Windows). Required if deployToggles.jumpVm is true.')
param buildVmMaintenanceDefinition types.vmMaintenanceDefinitionType = {
  name: ''
}

module buildVmMaintenanceConfiguration 'br/public:avm/res/maintenance/maintenance-configuration:0.3.1' = {
  name: 'buildVmMaintenanceConfigurationDeployment'
  params: {
    name: empty(buildVmMaintenanceDefinition.name!) ? 'mc-${baseName}-build' : buildVmMaintenanceDefinition.name!
    enableTelemetry: enableTelemetry
  }
}

var varBuildVmOsType = !empty(buildVmDefinition.?osType) ? buildVmDefinition!.osType! : 'Linux'
var varDefaultBuildUbuntu = {
  publisher: 'Canonical'
  offer: '0001-com-ubuntu-server-jammy'
  sku: '22_04-lts'
  version: 'latest'
}
var varBuildVmImageRef = !empty(string(buildVmDefinition.?imageReference))
  ? buildVmDefinition!.imageReference!
  : varDefaultBuildUbuntu

// Normalize entire build VM object so nested props always exist
var varBuildVmNormalized = union(
  {
    azdo: { orgUrl: '', pool: '', agentName: '', workFolder: '' }
    github: { owner: '', repo: '', labels: '', agentName: '', workFolder: '' }
  },
  buildVmDefinition!
)

// Render cloud-init from template with placeholders
var varBuildVMCloudInitRaw = replace(loadTextContent('./common/build-cloudinit.yaml'), '\r\n', '\n')
var varBuildVMCloudInitT0 = varBuildVMCloudInitRaw
var varBuildVMCloudInitT1 = replace(varBuildVMCloudInitT0, '{0}', string(varBuildVmNormalized.runner))
var varBuildVMCloudInitT2 = replace(varBuildVMCloudInitT1, '{1}', string(varBuildVmNormalized.azdo.orgUrl))
var varBuildVMCloudInitT3 = replace(varBuildVMCloudInitT2, '{2}', string(varBuildVmNormalized.azdo.pool))
var varBuildVMCloudInitT4 = replace(varBuildVMCloudInitT3, '{3}', string(varBuildVmNormalized.azdo.agentName))
var varBuildVMCloudInitT5 = replace(varBuildVMCloudInitT4, '{4}', string(varBuildVmNormalized.azdo.workFolder))
var varBuildVMCloudInitT6 = replace(varBuildVMCloudInitT5, '{5}', string(varBuildVmNormalized.github.owner))
var varBuildVMCloudInitT7 = replace(varBuildVMCloudInitT6, '{6}', string(varBuildVmNormalized.github.repo))
var varBuildVMCloudInitT8 = replace(varBuildVMCloudInitT7, '{7}', string(varBuildVmNormalized.github.labels))
var varBuildVMCloudInitT9 = replace(varBuildVMCloudInitT8, '{8}', string(varBuildVmNormalized.github.agentName))
var varBuildVMCloudInitT10 = replace(varBuildVMCloudInitT9, '{9}', string(varBuildVmNormalized.github.workFolder))
var varBuildVMCloudInitT11 = replace(varBuildVMCloudInitT10, '{10}', string(azdoPat))
var varBuildVMCloudInitT12 = replace(varBuildVMCloudInitT11, '{11}', string(githubPat))
var varBuildVMCloudInitT13 = replace(varBuildVMCloudInitT12, '{12}', string(varBuildVmNormalized.adminUsername))
var varBuildVMCloudInitT14 = replace(varBuildVMCloudInitT13, '{13}', string(varBuildVmNormalized.sshPublicKey))
var varBuildVMCloudInitT15 = replace(varBuildVMCloudInitT14, '{14}', string(baseName))
var varBuildVMCloudInit = varBuildVMCloudInitT15

module buildVm 'br/public:avm/res/compute/virtual-machine:0.20.0' = if (varDeployBuildVm) {
  name: 'buildVmDeployment'
  params: {
    // Required identity & sizing
    name: empty(buildVmDefinition!.name!) ? 'vm-${baseName}-build' : buildVmDefinition!.name!
    adminUsername: buildVmDefinition!.adminUsername
    vmSize: buildVmDefinition!.sku
    maintenanceConfigurationResourceId: buildVmMaintenanceConfiguration.outputs.resourceId
    // Required by the AVM VM module (zone sentinel pattern retained)
    availabilityZone: -1

    // OS selection (omit only if you're 100% certain module defaults to Linux)
    osType: varBuildVmOsType
    imageReference: varBuildVmImageRef

    // SSH hardening: only disable password auth when an SSH key is actually supplied
    disablePasswordAuthentication: !empty(buildVmDefinition!.sshPublicKey) ? true : null
    publicKeys: !empty(buildVmDefinition!.sshPublicKey)
      ? [
          {
            path: '/home/${buildVmDefinition!.adminUsername}/.ssh/authorized_keys'
            keyData: buildVmDefinition!.sshPublicKey
          }
        ]
      : null

    // OS disk: retained verbatim because the upstream module treats the osDisk object as required
    // (We avoid guessing which inner properties are mandatory in the AVM type.)
    osDisk: {
      caching: 'ReadWrite'
      diskSizeGB: 64
      managedDisk: { storageAccountType: 'Premium_LRS' }
    }

    // NICs: minimal — removed privateIPAllocationMethod (Dynamic is the implicit platform default)
    nicConfigurations: [
      {
        name: 'nic-build-1'
        ipConfigurations: [
          {
            name: 'ipconfig1'
            subnetResourceId: varBuildSubnetId
          }
        ]
      }
    ]

    // Cloud-init only when non-empty (defensive; varBuildVMCloudInit is always populated now)
    customData: !empty(varBuildVMCloudInit) ? base64(varBuildVMCloudInit) : null

    // Pass global tags only when user didn’t provide an override object
    tags: !empty(buildVmDefinition.?tags) ? buildVmDefinition!.tags! : tags

    // Telemetry passthrough for global toggle
    enableTelemetry: enableTelemetry
  }
  dependsOn: [
    #disable-next-line BCP321
    (empty(resourceIds.virtualNetworkResourceId!)) ? vNetwork : null
  ]
}

// 2.23. VMs - Jumpbox VM configuration  (Windows, Bastion-accessed)
@description('Conditional. Jump (bastion) VM configuration (Windows). Required if deployToggles.jumpVm is true.')
param jumpVmDefinition types.jumpVmDefinitionType?

@description('Conditional. Jump (bastion) VM Maintenance Definition (Windows). Required if deployToggles.jumpVm is true.')
param jumpVmMaintenanceDefinition types.vmMaintenanceDefinitionType = {
  name: ''
}

var varJumpVmOsType = !empty(jumpVmDefinition.?osType) ? jumpVmDefinition!.osType! : 'Windows'
var varDefaultJumpWindows = {
  publisher: 'MicrosoftWindowsServer'
  offer: 'WindowsServer'
  sku: '2022-datacenter-azure-edition'
  version: 'latest'
}
var varJumpVmImageRef = !empty(string(jumpVmDefinition.?imageReference))
  ? jumpVmDefinition!.imageReference!
  : varDefaultJumpWindows

var varRawJumpName = empty(jumpVmDefinition!.name!)
  ? 'vm-${baseName}jmp'
  : replace(replace(replace(jumpVmDefinition!.name!, ' ', ''), '_', ''), '.', '')
var varMaxComputerNameLength = 15
var varJumpNameLen = min(varMaxComputerNameLength, length(varRawJumpName))
var varJumpComputerName = toLower(substring(varRawJumpName, 0, varJumpNameLen))

module jumpVmMantenanceConfiguration 'br/public:avm/res/maintenance/maintenance-configuration:0.3.1' = {
  name: 'maintenanceConfigurationDeployment'
  params: {
    name: empty(jumpVmMaintenanceDefinition.name!) ? 'mc-${baseName}-jump' : jumpVmMaintenanceDefinition.name!
    enableTelemetry: enableTelemetry
  }
}

module jumpVm 'br/public:avm/res/compute/virtual-machine:0.20.0' = if (varDeployJumpVm) {
  name: 'jumpVmDeployment'
  params: {
    name: empty(jumpVmDefinition!.name!) ? 'mc-${baseName}-jump' : jumpVmDefinition!.name!
    location: location
    tags: jumpVmDefinition!.tags! ?? tags
    enableTelemetry: enableTelemetry
    osType: varJumpVmOsType
    availabilityZone: -1
    adminUsername: jumpVmDefinition!.adminUsername
    adminPassword: jumpVmAdminPassword
    computerName: varJumpComputerName
    imageReference: varJumpVmImageRef
    vmSize: jumpVmDefinition!.sku
    maintenanceConfigurationResourceId: jumpVmMantenanceConfiguration.outputs.resourceId
    osDisk: {
      caching: 'ReadWrite'
      diskSizeGB: 127
      managedDisk: { storageAccountType: 'Premium_LRS' }
    }

    nicConfigurations: [
      {
        name: 'nic-jump-1'
        ipConfigurations: [
          {
            name: 'ipconfig1'
            subnetResourceId: varJumpSubnetId
            privateIPAllocationMethod: 'Dynamic'
          }
        ]
      }
    ]
  }
  dependsOn: [
    #disable-next-line BCP321
    (empty(resourceIds.virtualNetworkResourceId!)) ? vNetwork : null
  ]
}

//////////////////////////////////////////////////////////////////////////
// 4. OUTPUTS
//////////////////////////////////////////////////////////////////////////

// General
@description('Tenant ID.')
output tenantId string = tenant().tenantId

@description('Subscription ID.')
output subscriptionId string = subscription().subscriptionId

@description('Resource group name.')
output resourceGroupName string = resourceGroup().name

@description('Deployment location.')
output location string = location

// VNet
@description('Virtual network resource ID.')
output virtualNetworkResourceId string = varVnetResourceId

// Log Analytics
@description('Log Analytics workspace resource ID.')
output logAnalyticsWorkspaceResourceId string = varLogAnalyticsWorkspaceResourceId

// App Insights
@description('Application Insights resource ID.')
output applicationInsightsResourceId string = varAppiResourceId

// Container Apps Environment
@description('Container Apps Environment resource ID.')
output containerEnvResourceId string = varContainerEnvResourceId

// ACR
@description('Container registry resource ID.')
output containerRegistryResourceId string = varAcrResourceId

// Storage
@description('Storage account resource ID.')
#disable-next-line BCP318
output storageAccountResourceId string = varSaResourceId

// Key Vault
@description('Key Vault resource ID.')
#disable-next-line BCP318
output keyVaultResourceId string = varKvResourceId

// Cosmos
@description('Cosmos DB account resource ID.')
#disable-next-line BCP318
output dbAccountResourceId string = varDbAccountResourceId

// Search
@description('Azure AI Search service resource ID.')
#disable-next-line BCP318
output searchServiceResourceId string = varSearchServiceResourceId

// App Configuration
@description('App Configuration store resource ID.')
output appConfigResourceId string = varAppConfigResourceId

// APIM
@description('API Management service resource ID.')
output apimServiceResourceId string = varApimServiceResourceId

// Application Gateway
@description('Application Gateway resource ID.')
output applicationGatewayResourceId string = varAppGatewayResourceId

// Azure Firewall
@description('Azure Firewall resource ID.')
output firewallResourceId string = varFirewallResourceId
// Grounding with Bing
@description('Grounding (Bing Search) resource ID.')
#disable-next-line BCP318
output groundingServiceResourceId string = varInvokeBingModule ? bingSearch!.outputs.resourceId : ''

// WAF Policy
@description('Web Application Firewall (WAF) policy resource ID.')
output wafPolicyResourceId string = varWafPolicyResourceId
