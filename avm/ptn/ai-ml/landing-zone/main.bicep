metadata name = 'AI/ML Landing Zone'
metadata description = 'Deploys a secure AI/ML landing zone (resource groups, networking, AI services, private endpoints, and guardrails) using AVM resource modules.'
///////////////////////////////////////////////////////////////////////////////////////////////////
// main.bicep
//
// Purpose: Landing Zone for GenAI app resources + AI Foundry pattern, network-isolated by default.
//
// How to read this file:
//   1  PARAMETERS
//       1.1 Imports
//       1.2 General configuration (location, tags, token)
//       1.3 Reuse existing services (resourceIds)
//       1.4 Deploy Toggles
//       1.5 Service definitions (VNet, Observability, Containers, Data/Security, App Config, PDNS IDs,
//           AI Foundry, Gateways, APIM, Firewall, Hub Peering)
//   2  VARIABLES (globals)
//   3  RESOURCES (grouped by domain)
//       3.1 Networking (VNet)
//       3.2 Deploy/has flags + subnet helpers
//       3.3 Private DNS Zones
//       3.4 Private Endpoints (helpers + per-service)
//       3.5 Existing resources (APIM, AGW, Firewall)
//       3.6 Observability (LAW, App Insights)
//       3.7 Container Apps Environment
//       3.8 Container Apps
//       3.9  App Services Backing Services (ACR, Cosmos, KV, KV for AF, Storage, Search, App Config)
//       3.10 AI Foundry (AVM pattern)
//       3.11 Gateways (WAF policy, App Gateway, Azure Firewall, APIM)
//       3.12 Hub/Spoke Peering
//       3.13 Grounding with Bing Search
//   4  OUTPUTS
//
///////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////
// 1. PARAMETERS
//////////////////////////////////////////////////////////////////////////

// 1.1 Imports
import * as types from 'common/types.bicep'

// 1.2 General Configuration (location, tags, naming token, global flags)
@description('Optional. Azure region for AI LZ resources. Defaults to the resource group location.')
param location string = resourceGroup().location

@description('Optional.  Tags applied to all deployed resources.')
param tags object = {}

@description('Optional.  Deterministic token for resource names; auto-generated if not provided.')
param resourceToken string = toLower(uniqueString(subscription().id, resourceGroup().name, location))

@description('Optional.  Base name to seed resource names; defaults to a 12-char token.')
param baseName string = substring(resourceToken, 0, 12)

@description('Optional. Enable/Disable usage telemetry for module.')
param enableTelemetry bool = true

@description('Optional. Enable network isolation posture (Private Endpoints + Private DNS).')
param networkIsolation bool = true

@description('Optional.  Enable platform landing zone integration.')
param flagPlatformLandingZone bool = false

@description('Optional.  Deploy GenAI app services; defaults to true.')
param deployGenAiAppBackingServices bool = true

@description('Conditional. Availability zones to use for Public IPs (Application Gateway and Firewall). Specify only zones that exist in the selected region. Leave empty for regions that do not support availability zones. Required if Deploy App Gateway and Create App Gateway Public Frontend is true or Deploy Firewall is true')
param publicIpAvailabilityZones int[] = []

// 1.3 Reuse Existing Services (resource IDs to reuse, leave empty to create)
@description('Optional.  Existing resource IDs to reuse; leave empty to create new resources.')
param resourceIds types.resourceIdsType = {
  virtualNetworkResourceId: ''
  logAnalyticsWorkspaceResourceId: ''
  appInsightsResourceId: ''
  containerEnvResourceId: ''
  containerRegistryResourceId: ''
  dbAccountResourceId: ''
  keyVaultResourceId: ''
  storageAccountResourceId: ''
  searchServiceResourceId: ''
  appConfigResourceId: ''
  apimServiceResourceId: ''
  applicationGatewayResourceId: ''
  bastionHostResourceId: ''
  firewallResourceId: ''
  groundingServiceResourceId: ''
}

// 1.4 Deploy Toggles (per-service on/off; reuse still works via resourceIds)
@description('Optional.  Per-service deployment toggles; set false to skip creating a service. Reuse still works via resourceIds.')
param deployToggles types.deployTogglesType = {
  logAnalytics: true
  appInsights: true

  containerEnv: true
  containerRegistry: true
  containerApps: true

  cosmosDb: true
  keyVault: true
  storageAccount: true
  searchService: true
  groundingWithBingSearch: true
  appConfig: true

  apiManagement: true
  applicationGateway: true
  firewall: true

  buildVm: true
  jumpVm: true
  virtualNetwork: true
  wafPolicy: true
}

// 1.5 Service Definitions
// 1.5.1 Virtual Network
@description('Conditional. Virtual Network configuration. Required if deployToggles.virtualNetwork is true and resourceIds.virtualNetworkResourceId is empty.')
param vnetDefinition types.vNetDefinitionType = {
  name: ''
  addressSpace: '192.168.0.0/16'
  dnsServers: []
  subnets: [
    {
      enabled: true
      name: 'agent-subnet'
      addressPrefix: '192.168.0.0/24'
      delegation: 'Microsoft.app/environments'
      serviceEndpoints: ['Microsoft.CognitiveServices']
    }
    {
      enabled: true
      name: 'pe-subnet'
      addressPrefix: '192.168.1.0/24'
      serviceEndpoints: ['Microsoft.AzureCosmosDB']
      privateEndpointNetworkPolicies: 'Disabled'
    }
    {
      enabled: true
      name: 'gateway-subnet'
      addressPrefix: '192.168.2.0/26'
    }
    {
      enabled: true
      name: 'AzureBastionSubnet'
      addressPrefix: '192.168.2.64/26'
    }
    {
      enabled: true
      name: 'AzureFirewallSubnet'
      addressPrefix: '192.168.2.128/26'
    }
    {
      enabled: true
      name: 'AppGatewaySubnet'
      addressPrefix: '192.168.3.0/24'
    }
    {
      enabled: true
      name: 'jumpbox-subnet'
      addressPrefix: '192.168.4.0/27'
    }
    {
      enabled: true
      name: 'aca-environment-subnet'
      addressPrefix: '192.168.4.64/27'
      delegation: 'Microsoft.app/environments'
      serviceEndpoints: ['Microsoft.AzureCosmosDB']
    }
    {
      enabled: true
      name: 'devops-build-agents-subnet'
      addressPrefix: '192.168.4.96/27'
    }
  ]

  // vnetPeeringConfiguration: {
  //   peerVnetResourceId: ''
  //   firewallIpAddress: ''
  //   name: ''
  //   allowForwardedTraffic: true
  //   allowGatewayTransit: false
  //   allowVirtualNetworkAccess: true
  //   createReversePeering: true
  //   reverseAllowForwardedTraffic: true
  //   reverseAllowGatewayTransit: false
  //   reverseAllowVirtualNetworkAccess: true
  //   reverseName: ''
  //   reverseUseRemoteGateways: false
  //   useRemoteGateways: false
  // }

  // vwanHubPeeringConfiguration: {
  //   peerVwanHubResourceId: ''
  // }

  tags: {}
}

// 1.5.2 Log Analytics Workspace
@description('Conditional. Log Analytics Workspace configuration. Required if deployToggles.logAnalytics is true and resourceIds.logAnalyticsWorkspaceResourceId is empty.')
param logAnalyticsDefinition types.logAnalyticsWorkspaceDefinitionType = {
  name: ''
  retention: 30
  sku: 'PerGB2018'
  replication: {
    enabled: true
    location: 'westus2'
  }
  tags: {}
}

// 1.5.3 Application Insights
@description('Conditional. Application Insights configuration. Required if deployToggles.appInsights is true and resourceIds.appInsightsResourceId is empty; a Log Analytics workspace must exist or be deployed.')
param appInsightsDefinition types.appInsightsDefinitionType = {
  name: ''
  applicationType: 'web'
  kind: 'web'
  disableIpMasking: false
  tags: {}
}

// 1.5.4 Container App Environment
@description('Conditional. Container Apps Environment configuration. Required if deployGenAiAppBackingServices is true, deployToggles.containerEnv is true, and resourceIds.containerEnvResourceId is empty.')
param containerAppEnvDefinition types.containerAppEnvDefinitionType = {
  name: ''
  tags: {}
  subnetName: 'aca-environment-subnet'
  internalLoadBalancerEnabled: true
  zoneRedundancyEnabled: true
  userAssignedManagedIdentityIds: []
  workloadProfiles: [
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
  enableDiagnosticSettings: true
  logAnalyticsWorkspaceResourceId: ''
  roleAssignments: []
}

// 1.5.5 Container Apps
@description('Optional. List of Container Apps to create.')
param containerAppsList types.containerAppDefinitionType[] = [
  {
    name: ''
    appId: 'hello-world'
    profileName: 'default'
    minReplicas: 1
    maxReplicas: 1
    external: true
  }
]

// 1.5.6 Container Registry
@description('Conditional. Container Registry configuration. Required if deployGenAiAppBackingServices is true, deployToggles.containerRegistry is true, and resourceIds.containerRegistryResourceId is empty.')
param containerRegistryDefinition types.containerRegistryDefinitionType = {
  name: ''
  sku: 'Premium'
  tags: {}
}

// 1.5.7 Cosmos DB Account (GenAI app scope)
@description('Conditional. Cosmos DB account configuration for the GenAI app. Required if deployGenAiAppBackingServices is true, deployToggles.cosmosDb is true, and resourceIds.dbAccountResourceId is empty.')
param cosmosDbDefinition types.genAIAppCosmosDbDefinitionType = {
  name: ''
  publicNetworkAccessEnabled: false
  automaticFailoverEnabled: true
}

// 1.5.8 Key Vault (GenAI app scope)
@description('Conditional. Key Vault configuration for the GenAI app. Required if deployGenAiAppBackingServices is true, deployToggles.keyVault is true, and resourceIds.keyVaultResourceId is empty.')
param keyVaultDefinition types.keyVaultDefinitionType = {
  name: ''
  sku: 'standard'
  tenantId: subscription().tenantId
  roleAssignments: []
  tags: {}
}

// 1.5.9 Storage Account (GenAI app scope)
@description('Conditional. Storage Account configuration for the GenAI app. Required if deployGenAiAppBackingServices is true, deployToggles.storageAccount is true, and resourceIds.storageAccountResourceId is empty.')
param storageAccountDefinition types.storageAccountDefinitionType = {
  name: ''
  accountKind: 'StorageV2'
  accountTier: 'Standard'
  accountReplicationType: 'GRS'
  tags: {}
}

// 1.5.10 AI Search (GenAI app scope)
@description('Conditional. Azure AI Search configuration for the GenAI app. Required if deployGenAiAppBackingServices is true, deployToggles.searchService is true, and resourceIds.searchServiceResourceId is empty.')
param searchDefinition types.kSAISearchDefinitionType = {
  name: ''
  sku: 'standard'
  publicNetworkAccessEnabled: false
  replicaCount: 2
  partitionCount: 1
  localAuthenticationEnabled: true
  semanticSearchSku: 'standard'
  roleAssignments: []
  tags: {}
}

// 1.5.11 App Configuration
@description('Conditional. App Configuration store settings. Required if deployGenAiAppBackingServices is true, deployToggles.appConfig is true, and resourceIds.appConfigResourceId is empty.')
param appConfigurationDefinition types.appConfigurationDefinitionType = {
  name: ''
  sku: 'standard'
  localAuthEnabled: false
  purgeProtectionEnabled: true
  softDeleteRetentionInDays: 7
  tags: {}
  roleAssignments: []
  replicaLocations: [
    { replicaLocation: 'westus2' }
  ]
}

// 1.5.12 Private DNS
// 1.5.12a Private DNS Zone IDs (optional reuse)
@description('Conditional. Existing Private DNS Zone resource IDs per service. Required if networkIsolation is true and you plan to reuse existing zones for any service.')
param privateDnsZoneIds object = {
  cognitiveservices: ''
  openai: ''
  aiServices: ''
  search: ''
  cosmosSql: ''
  blob: ''
  keyVault: ''
  appConfig: ''
  containerApps: ''
  acr: ''
  appInsights: ''
}

// 1.5.12b Private DNS Zones (creation + VNet links)
@description('Conditional. Private DNS Zones and VNet links configuration. Required if networkIsolation is true, flagPlatformLandingZone is false, and you want this template to create zones for services not supplied in privateDnsZoneIds.')
param privateDnsZones types.privateDnsZoneDefinitionsType = {
  existingZonesResourceGroupResourceId: ''
  allowInternetResolutionFallback: false
  networkLinks: [
    // Example (remove if not needed):
    // {
    //   vnetLinkName: 'link-to-spoke'
    //   vnetId: '/subscriptions/<subId>/resourceGroups/<rg>/providers/Microsoft.Network/virtualNetworks/<vnet>'
    //   resolutionPolicy: 'Default'
    // }
  ]
}

// 1.5.13 AI Foundry
@description('Optional.  AI Foundry project configuration (account/project, networking, associated resources, and deployments).')
param aiFoundryDefinition types.aiFoundryDefinitionType?

// 1.5.14 Grounding with Bing
@description('Conditional. Grounding with Bing configuration. Required if deployToggles.groundingWithBingSearch is true and resourceIds.groundingServiceResourceId is empty.')
param groundingWithBingDefinition types.kSGroundingWithBingDefinitionType = {
  name: ''
  sku: 'G1'
  tags: {}
}

// 1.5.15 WAF Policy
@description('Conditional. Web Application Firewall (WAF) policy configuration. Required if deployToggles.wafPolicy is true and you are deploying Application Gateway via this template.')
param wafPolicyDefinition types.wafPolicyDefinitionsType = {
  name: ''
  policySettings: {
    enabledState: 'Enabled'
    mode: 'Prevention'
    requestBodyCheck: true
    maxRequestBodySizeInKb: 128
    fileUploadLimitInMb: 100
  }
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
  tags: {}
}

// 1.5.16 Application Gateway
@description('Conditional. Application Gateway configuration. Required if deployToggles.applicationGateway is true and resourceIds.applicationGatewayResourceId is empty.')
param appGatewayDefinition types.appGatewayDefinitionType = {
  name: ''
  http2Enable: true
  authenticationCertificate: {}
  sku: { name: 'WAF_v2', tier: 'WAF_v2', capacity: 0 } // capacity 0 when autoscale is used
  autoscaleConfiguration: { minCapacity: 2, maxCapacity: 10 }
  backendAddressPools: {
    defaultPool: { name: 'defaultPool', fqdns: [], ipAddresses: [] }
  }
  backendHttpSettings: {
    defaultSetting: {
      cookieBasedAffinity: 'Disabled'
      name: 'defaultSetting'
      port: 80
      protocol: 'Http'
      affinityCookieName: ''
      hostName: ''
      path: ''
      pickHostNameFromBackendAddress: false
      probeName: ''
      requestTimeout: 30
      trustedRootCertificateNames: []
      authenticationCertificate: []
      connectionDraining: { enabled: false, drainTimeoutSec: 0 }
    }
  }
  frontendPorts: { port80: { name: 'port80', port: 80 } }
  httpListeners: {
    defaultListener: {
      name: 'defaultListener'
      frontendPortName: 'port80'
      frontendIpConfigurationName: 'privateFrontend'
      firewallPolicyId: ''
      requireSni: false
      hostName: ''
      hostNames: []
      sslCertificateName: ''
      sslProfileName: ''
      customErrorConfiguration: []
    }
  }
  probeConfigurations: {}
  redirectConfiguration: {
    defaultRedirect: {
      includePath: true
      includeQueryString: true
      name: 'defaultRedirect'
      redirectType: 'Permanent'
      targetListenerName: ''
      targetUrl: 'https://example.com'
    }
  }
  requestRoutingRules: {
    defaultRule: {
      name: 'defaultRule'
      ruleType: 'Basic'
      httpListenerName: 'defaultListener'
      backendAddressPoolName: ''
      priority: 100
      urlPathMapName: ''
      backendHttpSettingsName: ''
      redirectConfigurationName: 'defaultRedirect'
      rewriteRuleSetName: ''
    }
  }
  rewriteRuleSet: {}
  sslCertificates: {}
  sslPolicy: {
    cipherSuites: []
    disabledProtocols: []
    minProtocolVersion: 'TLSv1_2'
    policyName: ''
    policyType: 'Custom'
  }
  sslProfile: {}
  trustedClientCertificate: {}
  trustedRootCertificate: {}
  urlPathMapConfigurations: {}
  tags: {}
  roleAssignments: []
  createPublicFrontend: true
}

// 1.5.17 API Management
@description('Conditional. API Management configuration. Required if deployToggles.apiManagement is true and resourceIds.apimServiceResourceId is empty.')
param apimDefinition types.apimDefinitionType = {
  name: ''
  publisherEmail: 'admin@example.com'
  publisherName: 'Contoso'
  additionalLocations: {}
  certificate: {}
  clientCertificateEnabled: false
  hostnameConfiguration: { management: {}, portal: {}, developerPortal: {}, proxy: {}, scm: {} }
  minApiVersion: '2019-12-01'
  notificationSenderEmail: 'apimgmt-noreply@azure.com'
  skuRoot: 'Premium' // zone-capable
  skuCapacity: 2 // at least 2 scale units
  protocols: { enableHttp2: true }
  roleAssignments: []
  signIn: { enabled: true }
  signUp: { enabled: false, termsOfService: { consentRequired: false, enabled: false, text: '' } }
  tags: {}
  tenantAccess: { enabled: true }
}

// 1.5.18 Azure Firewall
@description('Conditional. Azure Firewall configuration. Required if deployToggles.firewall is true and resourceIds.firewallResourceId is empty.')
param firewallDefinition types.firewallDefinitionType = {
  name: ''
  sku: 'AZFW_VNet'
  tier: 'Standard'
  zones: [1, 2]
  tags: {}
}

// 1.5.19 Azure Firewall Policy
@description('Optional.  Azure Firewall Policy configuration (only used if your deployment wires a policy).')
param firewallPolicyDefinition types.firewallPolicyDefinitionType = {
  networkPolicyRuleCollectionGroupName: null
  networkPolicyRuleCollectionGroupPriority: 100
  networkRules: []
}

// 1.5.20 Hub VNet Peering
@description('Conditional. Hub VNet peering configuration. Required if you plan to establish hub–spoke peering.')
param hubVnetPeeringDefinition types.huVnetPeeringDefinitionType = {
  name: ''
  peerVnetResourceId: ''
  firewallIpAddress: ''
  allowForwardedTraffic: true
  allowGatewayTransit: false
  allowVirtualNetworkAccess: true
  createReversePeering: true
  reverseAllowForwardedTraffic: true
  reverseAllowGatewayTransit: false
  reverseAllowVirtualNetworkAccess: true
  reverseName: ''
  reverseUseRemoteGateways: false
  useRemoteGateways: false
}

// 1.5.21 Build VM configuration
@description('Conditional. Build VM configuration to support CI/CD workers (Linux). Required if deployToggles.buildVm is true and you intend to deploy the Build VM (sshPublicKey must be provided).')
param buildVmDefinition types.buildVmDefinitionType = {
  name: ''
  sku: 'Standard_D2s_v5'
  adminUsername: 'azureuser'
  sshPublicKey: ''
  runner: 'azdo'
  azdo: {
    orgUrl: 'https://dev.azure.com/<org>'
    pool: 'Default'
  }
  tags: {}
}

// 1.5.22 Jump VM configuration (Windows, Bastion-accessed)
@description('Conditional. Jump (bastion) VM configuration (Windows). Required if deployToggles.jumpVm is true.')
param jumpVmDefinition types.jumpVmDefinitionType = {
  name: ''
  sku: 'Standard_D2s_v5'
  adminUsername: 'azureuser'
  vmKeyVaultSecName: 'jump-admin-password'
  tags: {}
}

// 1.5.23 Dedicated Key Vault for JumpVM password (public network access for convenience with Bastion operators)
@description('Conditional. Jump (bastion) VM configuration (Windows). Required if deployToggles.jumpVm is true.')
param bastionKeyVaultDefinition types.keyVaultDefinitionType = {
  name: ''
  sku: 'standard'
  tenantId: subscription().tenantId
  roleAssignments: []
  tags: {}
}

// 1.6 Secrets/Tokens
@secure()
@description('Conditional. Local admin password for the Windows JumpVM. Required if deployToggles.jumpVm is true.')
param jumpVmAdminPassword string = ''

@secure()
@description('Optional. PAT used to register the Azure DevOps agent (when runner = azdo).')
param azdoPat string = ''

@secure()
@description('Optional. PAT used to request a GitHub runner registration token (when runner = github).')
param githubPat string = ''

//////////////////////////////////////////////////////////////////////////
// 2. VARIABLES
//////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////
// 2. VARIABLES
//////////////////////////////////////////////////////////////////////////

// ── 2.1 Tags & naming helpers
// Merge top-level tags once; used across modules
var varTags = union(tags, vnetDefinition.tags! ?? {})

// CAF-style abbreviations (drives consistent resource naming)
var varAbbrs = loadJsonContent('./common/abbreviations.json')

// Name prefixes derived from abbreviations (some cannot contain hyphen)
var varAcr = varAbbrs.containers.containerRegistry // no hyphen allowed in ACR
var varBing = '${varAbbrs.ai.bing}-'
var varCa = '${varAbbrs.containers.containerApp}-'
var varCae = '${varAbbrs.containers.containerAppsEnvironment}-'
var varAfw = '${varAbbrs.networking.firewall}-'
var varAfwp = '${varAbbrs.networking.firewallPolicy}-'
var varAgw = '${varAbbrs.networking.applicationGateway}-'
var varPe = '${varAbbrs.networking.privateEndpoint}-'
var varPip = '${varAbbrs.networking.publicIPAddress}-'
var varVNet = '${varAbbrs.networking.virtualNetwork}-'
var varAi = '${varAbbrs.managementGovernance.applicationInsights}-'
var varApim = '${varAbbrs.integration.apiManagement}-'
var varAppcs = '${varAbbrs.configuration.appConfiguration}-'
var varLaw = '${varAbbrs.managementGovernance.logAnalyticsWorkspace}-'
var varCos = '${varAbbrs.databases.cosmosDbAccount}-'
var varKv = '${varAbbrs.security.keyVault}-'
var varSrch = '${varAbbrs.ai.aiSearch}-'
var varSt = varAbbrs.storage.storageAccount // no hyphen allowed in Storage
var varVm = '${varAbbrs.compute.virtualMachine}-'
var varWaf = '${varAbbrs.networking.webApplicationFirewallPolicy}-'

// ── 2.2 Common names & defaults (env, images, flags)
var varContainerDummyImageName = 'mcr.microsoft.com/azuredocs/containerapps-helloworld:latest'
var varContainerEnvName = empty(containerAppEnvDefinition.name!)
  ? '${varCae}${baseName}'
  : containerAppEnvDefinition.name!
var varAgwCreatePublicFrontend = bool(appGatewayDefinition.createPublicFrontend! ?? true)

// ── 2.3 Virtual network & subnets (reuse/new) + peering helpers
// Parse existing VNet Id (if provided)
var varVnetIdSegments = empty(resourceIds.virtualNetworkResourceId!)
  ? ['']
  : split(resourceIds.virtualNetworkResourceId!, '/')
var varExistingVNetSubscriptionId = length(varVnetIdSegments) >= 3 ? varVnetIdSegments[2] : ''
var varExistingVNetResourceGroupName = length(varVnetIdSegments) >= 5 ? varVnetIdSegments[4] : ''
var varExistingVNetName = length(varVnetIdSegments) >= 1 ? last(varVnetIdSegments) : ''

// Effective VNet name (create path)
var varVnetName = empty(vnetDefinition.name!) ? '${varVNet}${baseName}' : vnetDefinition.name!

// Optional peering configuration (read safely without try/?.)
var varHasPeerCfg = contains(vnetDefinition, 'vnetPeeringConfiguration') && !empty(vnetDefinition.vnetPeeringConfiguration!)

// Read values with defaults
#disable-next-line BCP318
var varPeerCfgName = varHasPeerCfg && contains(vnetDefinition.vnetPeeringConfiguration!, 'name') && !empty(vnetDefinition.vnetPeeringConfiguration!.name!)
  #disable-next-line BCP318
  ? vnetDefinition.vnetPeeringConfiguration!.name!
  : ''
#disable-next-line BCP318
var varPeerCfgVnetId = varHasPeerCfg && contains(vnetDefinition.vnetPeeringConfiguration!, 'peerVnetResourceId') && !empty(vnetDefinition.vnetPeeringConfiguration!.peerVnetResourceId)
  #disable-next-line BCP318
  ? vnetDefinition.vnetPeeringConfiguration!.peerVnetResourceId!
  : ''
var varPeerAllowVna = varHasPeerCfg && contains(vnetDefinition.vnetPeeringConfiguration!, 'allowVirtualNetworkAccess')
  #disable-next-line BCP318
  ? vnetDefinition.vnetPeeringConfiguration!.allowVirtualNetworkAccess
  : true
var varPeerAllowFwd = varHasPeerCfg && contains(vnetDefinition.vnetPeeringConfiguration!, 'allowForwardedTraffic')
  #disable-next-line BCP318
  ? vnetDefinition.vnetPeeringConfiguration!.allowForwardedTraffic
  : true
var varPeerAllowGw = varHasPeerCfg && contains(vnetDefinition.vnetPeeringConfiguration!, 'allowGatewayTransit')
  #disable-next-line BCP318
  ? vnetDefinition.vnetPeeringConfiguration!.allowGatewayTransit
  : false
var varPeerUseRgw = varHasPeerCfg && contains(vnetDefinition.vnetPeeringConfiguration!, 'useRemoteGateways')
  #disable-next-line BCP318
  ? vnetDefinition.vnetPeeringConfiguration!.useRemoteGateways
  : false

// Final peering helpers
var varHasPeer = !empty(varPeerCfgVnetId)
var varPeerName = empty(varPeerCfgName) ? '${varVnetName}-to-peer' : varPeerCfgName

// Whether we will deploy the VNet (vs reuse)
var varDeployVnet = empty(resourceIds.virtualNetworkResourceId!) && deployToggles.virtualNetwork

// VNet resourceId that works for both reuse/new
#disable-next-line BCP318
var varVnetResourceId = !empty(resourceIds.virtualNetworkResourceId!)
  ? existingVNet.id
  : (varDeployVnet ? virtualNetwork!.outputs.resourceId : '')

// Subnets used across modules (computed once)
var varPeSubnetName = 'pe-subnet'
var varPeSubnetId = empty(resourceIds.virtualNetworkResourceId!)
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', varVnetName, varPeSubnetName)
  : '${existingVNet.id}/subnets/${varPeSubnetName}'

var varAgentSubnetName = 'agent-subnet'
var varAgentSubnetId = empty(resourceIds.virtualNetworkResourceId!)
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', varVnetName, varAgentSubnetName)
  : '${existingVNet.id}/subnets/${varAgentSubnetName}'

var varAgwSubnetName = 'AppGatewaySubnet'
var varAgwSubnetId = empty(resourceIds.virtualNetworkResourceId!)
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', varVnetName, varAgwSubnetName)
  : '${existingVNet.id}/subnets/${varAgwSubnetName}'

var varAcaInfraSubnetId = empty(resourceIds.virtualNetworkResourceId!)
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', varVnetName, containerAppEnvDefinition.subnetName!)
  : '${existingVNet.id}/subnets/${containerAppEnvDefinition.subnetName!}'

// Compute subnets (Jump/Build)
var varJumpSubnetName = 'jumpbox-subnet'
var varBuildSubnetName = 'devops-build-agents-subnet'
var varJumpSubnetId = empty(resourceIds.virtualNetworkResourceId!)
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', varVnetName, varJumpSubnetName)
  : '${existingVNet.id}/subnets/${varJumpSubnetName}'
var varBuildSubnetId = empty(resourceIds.virtualNetworkResourceId!)
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', varVnetName, varBuildSubnetName)
  : '${existingVNet.id}/subnets/${varBuildSubnetName}'

// ── 2.4 Existing resource parsing (IDs → subscription/rg/name)
var varApimIdSegments = empty(resourceIds.apimServiceResourceId!)
  ? ['']
  : split(resourceIds.apimServiceResourceId!, '/')
var varApimSub = length(varApimIdSegments) >= 3 ? varApimIdSegments[2] : ''
var varApimRg = length(varApimIdSegments) >= 5 ? varApimIdSegments[4] : ''
var varApimNameExisting = length(varApimIdSegments) >= 1 ? last(varApimIdSegments) : ''

var varAgwIdSegments = empty(resourceIds.applicationGatewayResourceId!)
  ? ['']
  : split(resourceIds.applicationGatewayResourceId!, '/')
var varAgwSub = length(varAgwIdSegments) >= 3 ? varAgwIdSegments[2] : ''
var varAgwRg = length(varAgwIdSegments) >= 5 ? varAgwIdSegments[4] : ''
var varAgwNameExisting = length(varAgwIdSegments) >= 1 ? last(varAgwIdSegments) : ''

var varAfwIdSegments = empty(resourceIds.firewallResourceId!) ? [''] : split(resourceIds.firewallResourceId!, '/')
var varAfwSub = length(varAfwIdSegments) >= 3 ? varAfwIdSegments[2] : ''
var varAfwRg = length(varAfwIdSegments) >= 5 ? varAfwIdSegments[4] : ''
var varAfwNameExisting = length(varAfwIdSegments) >= 1 ? last(varAfwIdSegments) : ''

var varLawIdSegments = empty(resourceIds.logAnalyticsWorkspaceResourceId!)
  ? ['']
  : split(resourceIds.logAnalyticsWorkspaceResourceId!, '/')
var varExistingLawSubscriptionId = length(varLawIdSegments) >= 3 ? varLawIdSegments[2] : ''
var varExistingLawResourceGroupName = length(varLawIdSegments) >= 5 ? varLawIdSegments[4] : ''
var varExistingLawName = length(varLawIdSegments) >= 1 ? last(varLawIdSegments) : ''

var varAiIdSegments = empty(resourceIds.appInsightsResourceId!) ? [''] : split(resourceIds.appInsightsResourceId!, '/')
var varExistingAISubscriptionId = length(varAiIdSegments) >= 3 ? varAiIdSegments[2] : ''
var varExistingAIResourceGroupName = length(varAiIdSegments) >= 5 ? varAiIdSegments[4] : ''
var varExistingAIName = length(varAiIdSegments) >= 1 ? last(varAiIdSegments) : ''

var varEnvIdSegments = empty(resourceIds.containerEnvResourceId!)
  ? ['']
  : split(resourceIds.containerEnvResourceId!, '/')
var varExistingEnvSubscriptionId = length(varEnvIdSegments) >= 3 ? varEnvIdSegments[2] : ''
var varExistingEnvResourceGroup = length(varEnvIdSegments) >= 5 ? varEnvIdSegments[4] : ''
var varExistingEnvName = length(varEnvIdSegments) >= 1 ? last(varEnvIdSegments) : ''

var varAcrIdSegments = empty(resourceIds.containerRegistryResourceId!)
  ? ['']
  : split(resourceIds.containerRegistryResourceId!, '/')
var varExistingAcrSub = length(varAcrIdSegments) >= 3 ? varAcrIdSegments[2] : ''
var varExistingAcrRg = length(varAcrIdSegments) >= 5 ? varAcrIdSegments[4] : ''
var varExistingAcrName = length(varAcrIdSegments) >= 1 ? last(varAcrIdSegments) : ''

var varCosmosIdSegments = empty(resourceIds.dbAccountResourceId!) ? [''] : split(resourceIds.dbAccountResourceId!, '/')
var varExistingCosmosSub = length(varCosmosIdSegments) >= 3 ? varCosmosIdSegments[2] : ''
var varExistingCosmosRg = length(varCosmosIdSegments) >= 5 ? varCosmosIdSegments[4] : ''
var varExistingCosmosName = length(varCosmosIdSegments) >= 1 ? last(varCosmosIdSegments) : ''

var varKvIdSegments = empty(resourceIds.keyVaultResourceId!) ? [''] : split(resourceIds.keyVaultResourceId!, '/')
var varExistingKvSub = length(varKvIdSegments) >= 3 ? varKvIdSegments[2] : ''
var varExistingKvRg = length(varKvIdSegments) >= 5 ? varKvIdSegments[4] : ''
var varExistingKvName = length(varKvIdSegments) >= 1 ? last(varKvIdSegments) : ''

var varSaIdSegments = empty(resourceIds.storageAccountResourceId!)
  ? ['']
  : split(resourceIds.storageAccountResourceId!, '/')
var varExistingSaSub = length(varSaIdSegments) >= 3 ? varSaIdSegments[2] : ''
var varExistingSaRg = length(varSaIdSegments) >= 5 ? varSaIdSegments[4] : ''
var varExistingSaName = length(varSaIdSegments) >= 1 ? last(varSaIdSegments) : ''

var varSearchIdSegments = empty(resourceIds.searchServiceResourceId!)
  ? ['']
  : split(resourceIds.searchServiceResourceId!, '/')
var varExistingSearchSub = length(varSearchIdSegments) >= 3 ? varSearchIdSegments[2] : ''
var varExistingSearchRg = length(varSearchIdSegments) >= 5 ? varSearchIdSegments[4] : ''
var varExistingSearchName = length(varSearchIdSegments) >= 1 ? last(varSearchIdSegments) : ''

var varAppcsIdSegments = empty(resourceIds.appConfigResourceId!) ? [''] : split(resourceIds.appConfigResourceId!, '/')
var varExistingAppcsSub = length(varAppcsIdSegments) >= 3 ? varAppcsIdSegments[2] : ''
var varExistingAppcsRg = length(varAppcsIdSegments) >= 5 ? varAppcsIdSegments[4] : ''
var varExistingAppcsName = length(varAppcsIdSegments) >= 1 ? last(varAppcsIdSegments) : ''

// ── 2.5 Service defaults for create path (compact objects)
var varCosmosDef = cosmosDbDefinition ?? { name: '' }
var varStorageAccountDef = storageAccountDefinition ?? { name: '', publicNetworkAccessEnabled: false, tags: {} }
var varSearchDef = searchDefinition ?? { name: '', tags: {} }

// ── 2.6 Effective names/SKUs (create path) + friendly names
var varAcrEffectiveSku = !empty(containerRegistryDefinition.sku!) ? containerRegistryDefinition.sku! : 'Premium'
var varAcrNameEffective = !empty(containerRegistryDefinition.name!)
  ? containerRegistryDefinition.name!
  : '${varAcr}${baseName}'

var varAppConfigName = empty((appConfigurationDefinition ?? { name: '' }).name!)
  ? '${varAppcs}${baseName}'
  : (appConfigurationDefinition.name!)

var varWafName = empty(wafPolicyDefinition.name!) ? '${varWaf}${baseName}' : wafPolicyDefinition.name!
var varAgwName = empty(appGatewayDefinition.name!) ? '${varAgw}${baseName}' : appGatewayDefinition.name!

// Convenience alias for downstream modules
var agwName = varAgwName
var agwId = resourceId('Microsoft.Network/applicationGateways', agwName)
var agwSubnet = varAgwSubnetId

var varAfwPolicyName = '${varAfwp}${baseName}'
var varAfwName = empty(firewallDefinition.name!) ? '${varAfw}${baseName}' : firewallDefinition.name!
var varApimName = empty(apimDefinition.name!) ? '${varApim}${baseName}' : apimDefinition.name!
var varBastionKvName = empty(bastionKeyVaultDefinition.name!)
  ? '${varKv}${baseName}-jump'
  : bastionKeyVaultDefinition.name!
var varBingNameEffective = empty(groundingWithBingDefinition.name!)
  ? '${varBing}${baseName}'
  : groundingWithBingDefinition.name!

// ── 2.7 Deployment switches & “has” state (create vs reuse)
var varDeploySa = empty(resourceIds.storageAccountResourceId!) && deployGenAiAppBackingServices && deployToggles.storageAccount
var varDeployCosmos = empty(resourceIds.dbAccountResourceId!) && deployGenAiAppBackingServices && deployToggles.cosmosDb
var varDeploySearch = empty(resourceIds.searchServiceResourceId!) && deployGenAiAppBackingServices && deployToggles.searchService
var varDeployKv = empty(resourceIds.keyVaultResourceId!) && deployGenAiAppBackingServices && deployToggles.keyVault
var varDeployContainerAppEnv = empty(resourceIds.containerEnvResourceId!) && deployGenAiAppBackingServices && deployToggles.containerEnv
var varDeployContainerApps = deployGenAiAppBackingServices && varHasContainerEnv && deployToggles.containerApps && length(containerAppsList) > 0
var varDeployAppConfig = empty(resourceIds.appConfigResourceId!) && deployGenAiAppBackingServices && deployToggles.appConfig
var varDeployAcr = empty(resourceIds.containerRegistryResourceId!) && deployGenAiAppBackingServices && deployToggles.containerRegistry
var varDeployApim = empty(resourceIds.apimServiceResourceId!) && deployToggles.apiManagement
var varDeployAppGateway = empty(resourceIds.applicationGatewayResourceId!) && deployToggles.applicationGateway
var varDeployFirewall = empty(resourceIds.firewallResourceId!) && deployToggles.firewall

var varIsPlatformLz = flagPlatformLandingZone
var varDeployPdnsAndPe = networkIsolation && !varIsPlatformLz
var varDeployBuildVm = deployToggles.buildVm && !varIsPlatformLz
var varDeployJumpVm = deployToggles.jumpVm && !varIsPlatformLz && !empty(jumpVmAdminPassword)

// Observability coupling (App Insights requires LAW)
var varDeployLogAnalytics = empty(resourceIds.logAnalyticsWorkspaceResourceId!) && deployToggles.logAnalytics
var varHasLogAnalytics = (!empty(resourceIds.logAnalyticsWorkspaceResourceId!)) || (varDeployLogAnalytics)
var varDeployAppInsights = empty(resourceIds.appInsightsResourceId!) && deployToggles.appInsights && varHasLogAnalytics
var varHasAppInsights = (!empty(resourceIds.appInsightsResourceId!)) || (varDeployAppInsights)

// Decide if Bing module runs (create or reuse+connect)
var varInvokeBingModule = (!empty(resourceIds.groundingServiceResourceId!)) || (deployToggles.groundingWithBingSearch && empty(resourceIds.groundingServiceResourceId!))

// “Has” state for GenAI app stack (create or reuse)
var varHasStorage = (!empty(resourceIds.storageAccountResourceId!)) || (varDeploySa)
var varHasCosmos = (!empty(resourceIds.dbAccountResourceId!)) || (varDeployCosmos)
var varHasSearch = (!empty(resourceIds.searchServiceResourceId!)) || (varDeploySearch)
var varHasKv = (!empty(resourceIds.keyVaultResourceId!)) || (varDeployKv)
var varHasContainerEnv = (!empty(resourceIds.containerEnvResourceId!)) || (varDeployContainerAppEnv)
var varHasAppConfig = (!empty(resourceIds.appConfigResourceId!)) || (varDeployAppConfig)
var varHasAcr = (!empty(resourceIds.containerRegistryResourceId!)) || (varDeployAcr)

// ── 2.8 Observability effective values (LAW Id, AI connection)
var varLaIdEffective = !empty(resourceIds.logAnalyticsWorkspaceResourceId!)
  ? resourceIds.logAnalyticsWorkspaceResourceId!
  : (varDeployLogAnalytics ? logAnalytics!.outputs.resourceId : '')
var varLaCustomerIdEffective = !empty(resourceIds.logAnalyticsWorkspaceResourceId!)
  ? reference(resourceIds.logAnalyticsWorkspaceResourceId!, '2022-10-01', 'Full').properties.customerId
  : (varDeployLogAnalytics ? logAnalytics!.outputs.logAnalyticsWorkspaceId : '')
var varLaSharedKeyEffective = !empty(resourceIds.logAnalyticsWorkspaceResourceId!)
  ? listKeys(resourceIds.logAnalyticsWorkspaceResourceId!, '2020-08-01').primarySharedKey
  #disable-next-line BCP318
  : (varDeployLogAnalytics ? logAnalytics.outputs.primarySharedKey : '')

// ── 2.9 Effective resourceIds for dependent modules (env, ACR, App Config)
var varContainerEnvIdEffective = !empty(resourceIds.containerEnvResourceId!)
  ? resourceIds.containerEnvResourceId!
  #disable-next-line BCP318
  : containerEnv.outputs.resourceId

var varAcrResourceId = !empty(resourceIds.containerRegistryResourceId!)
  ? existingAcr.id
  : (varDeployAcr ? resourceId('Microsoft.ContainerRegistry/registries', varAcrNameEffective) : '')

var varAppConfigResourceId = !empty(resourceIds.appConfigResourceId!)
  ? resourceIds.appConfigResourceId!
  : (varDeployAppConfig ? resourceId('Microsoft.AppConfiguration/configurationStores', varAppConfigName) : '')

// ── 2.10 AI Foundry inputs & derived values
var varAfDefaults = {
  baseUniqueName: ''
  location: location
  enableTelemetry: enableTelemetry
  aiProjects: []
  aiModelDeployments: [
    {
      name: 'chat'
      raiPolicyName: ''
      versionUpgradeOption: ''
      model: {
        format: 'OpenAI'
        name: 'gpt-4o'
        version: '2024-11-20'
      }
      scale: {
        capacity: 1
        family: ''
        size: ''
        tier: ''
        type: 'Standard'
      }
    }
    {
      name: 'text-embedding'
      raiPolicyName: ''
      versionUpgradeOption: ''
      model: {
        format: 'OpenAI'
        name: 'text-embedding-3-large'
        version: '1'
      }
      scale: {
        capacity: 1
        family: ''
        size: ''
        tier: ''
        type: 'Standard'
      }
    }
  ]
  lock: { kind: 'None', name: '' }
  includeAssociatedResources: true
  privateEndpointSubnetResourceId: ''
  aiFoundryConfiguration: {
    accountName: ''
    location: location
    sku: 'S0'
    createCapabilityHosts: false
    allowProjectManagement: true
    networking: {
      agentServiceSubnetResourceId: ''
      cognitiveServicesPrivateDnsZoneResourceId: ''
      openAiPrivateDnsZoneResourceId: ''
      aiServicesPrivateDnsZoneResourceId: ''
    }
    project: { name: '', displayName: '', desc: 'This is the default project for AI Foundry.' }
    roleAssignments: []
  }
  aiSearchConfiguration: {
    existingResourceId: ''
    name: 'srch-${baseName}-af'
    privateDnsZoneResourceId: ''
    roleAssignments: []
  }
  keyVaultConfiguration: {
    existingResourceId: ''
    name: 'kv-${baseName}-af'
    privateDnsZoneResourceId: ''
    roleAssignments: []
  }
  storageAccountConfiguration: {
    existingResourceId: ''
    name: 'st${baseName}af'
    blobPrivateDnsZoneResourceId: ''
    roleAssignments: []
  }
  cosmosDbConfiguration: {
    existingResourceId: ''
    name: 'cos${baseName}af'
    privateDnsZoneResourceId: ''
    roleAssignments: []
  }
}

var varAfParam = union(varAfDefaults, aiFoundryDefinition ?? {})

// Safe defaults from varAfParam
var varAfBaseUniqueName = contains(varAfParam!, 'baseUniqueName') && !empty(varAfParam!.baseUniqueName!)
  ? varAfParam.baseUniqueName!
  : ''
var varAfLocation = contains(varAfParam, 'location') && !empty(varAfParam.location!) ? varAfParam.location! : location
var varAfConfigObj = contains(varAfParam, 'aiFoundryConfiguration') ? varAfParam.aiFoundryConfiguration! : {}
var varAfAgentSvcEnabled = bool((varAfConfigObj.?createCapabilityHosts ?? false))
var varAfPeSubnetParam = contains(varAfParam, 'privateEndpointSubnetResourceId') && !empty(varAfParam.privateEndpointSubnetResourceId!)
  ? varAfParam.privateEndpointSubnetResourceId!
  : ''
var varAfSearchCfg = contains(varAfParam, 'aiSearchConfiguration') ? varAfParam.aiSearchConfiguration! : {}
var varAfCosmosCfg = contains(varAfParam, 'cosmosDbConfiguration') ? varAfParam.cosmosDbConfiguration! : {}
var varAfKvCfg = contains(varAfParam, 'keyVaultConfiguration') ? varAfParam.keyVaultConfiguration! : {}
var varAfStorageCfg = contains(varAfParam, 'storageAccountConfiguration') ? varAfParam.storageAccountConfiguration! : {}

// Source entries and mapped AVM model deployments
var varAfModelEntries = varAfParam.aiModelDeployments
var varAfModelDeployments = [
  for (md, idx) in varAfModelEntries: union(
    {
      name: empty(md.name) ? 'model-${idx}' : string(md.name)
      model: {
        format: md.model.format
        name: md.model.name
        version: md.model.version
      }
      sku: {
        capacity: int(md.scale.capacity)
        name: empty(md.scale.type) ? 'Standard' : string(md.scale.type)
      }
    },
    (contains(md, 'raiPolicyName') && !empty(string(md.raiPolicyName)))
      ? { raiPolicyName: string(md.raiPolicyName) }
      : {},
    (contains(md, 'versionUpgradeOption') && !empty(string(md.versionUpgradeOption)))
      ? { versionUpgradeOption: string(md.versionUpgradeOption) }
      : {}
  )
]

// Ask AVM to create AF-associated deps only if Agent Service is enabled
var varAfWantsDeps = varAfAgentSvcEnabled && (varAfParam.includeAssociatedResources! ?? true)

// ── 2.11 Private DNS decisions (reuse/create) + AF PDNS bindings
// Which PDNS zones are being reused vs. created here?
var varUseExistingPdz = {
  cognitiveservices: !empty(privateDnsZoneIds.cognitiveservices)
  openai: !empty(privateDnsZoneIds.openai)
  aiServices: !empty(privateDnsZoneIds.aiServices)
  search: !empty(privateDnsZoneIds.search)
  cosmosSql: !empty(privateDnsZoneIds.cosmosSql)
  blob: !empty(privateDnsZoneIds.blob)
  keyVault: !empty(privateDnsZoneIds.keyVault)
  appConfig: !empty(privateDnsZoneIds.appConfig)
  containerApps: !empty(privateDnsZoneIds.containerApps)
  acr: !empty(privateDnsZoneIds.acr)
  appInsights: !empty(privateDnsZoneIds.appInsights)
}

// Whether AF/app stacks require specific PDNS zones
var varFoundryNeedsCosmosPdns = varAfWantsDeps && varAfAgentSvcEnabled
var varFoundryNeedsBlobPdns = varAfWantsDeps && varAfAgentSvcEnabled
var varFoundryNeedsSearchPdns = varAfWantsDeps && varAfAgentSvcEnabled
var varFoundryNeedsKvPdns = varAfWantsDeps && varAfAgentSvcEnabled

var varAppNeedsCosmosPdns = varHasCosmos
var varAppNeedsBlobPdns = varHasStorage
var varAppNeedsSearchPdns = varHasSearch
var varAppNeedsKvPdns = varHasKv

var varNeedCosmosPdns = varAppNeedsCosmosPdns || varFoundryNeedsCosmosPdns
var varNeedBlobPdns = varAppNeedsBlobPdns || varFoundryNeedsBlobPdns
var varNeedSearchPdns = varAppNeedsSearchPdns || varFoundryNeedsSearchPdns
var varNeedKvPdns = varAppNeedsKvPdns || varFoundryNeedsKvPdns

// Map caller-provided VNet links to AVM shape once
var varPdnsLinksFromParam = [
  for l in privateDnsZones.networkLinks: {
    name: l.vnetLinkName
    registrationEnabled: false
    virtualNetworkResourceId: l.vnetId
  }
]

// AF networking & PDNS bindings (only when not platform-managed)
var varAfNetworkingConfig = !flagPlatformLandingZone && varAfAgentSvcEnabled
  ? {
      networking: {
        agentServiceSubnetResourceId: varAgentSubnetId
        aiServicesPrivateDnsZoneResourceId: !varUseExistingPdz.aiServices
          #disable-next-line BCP318
          ? privateDnsZoneAiService.outputs.resourceId
          : privateDnsZoneIds.aiServices
        cognitiveServicesPrivateDnsZoneResourceId: !varUseExistingPdz.cognitiveservices
          #disable-next-line BCP318
          ? privateDnsZoneCogSvcs.outputs.resourceId
          : privateDnsZoneIds.cognitiveservices
        openAiPrivateDnsZoneResourceId: !varUseExistingPdz.openai
          #disable-next-line BCP318
          ? privateDnsZoneOpenAi.outputs.resourceId
          : privateDnsZoneIds.openai
      }
    }
  : {}

var varAfAiSearchPdzBinding = !flagPlatformLandingZone
  ? {
      privateDnsZoneResourceId: !varUseExistingPdz.search
        #disable-next-line BCP318
        ? privateDnsZoneSearch.outputs.resourceId
        : privateDnsZoneIds.search
    }
  : {}

var varAfCosmosPdzBinding = !flagPlatformLandingZone
  ? {
      privateDnsZoneResourceId: !varUseExistingPdz.cosmosSql
        #disable-next-line BCP318
        ? privateDnsZoneCosmos.outputs.resourceId
        : privateDnsZoneIds.cosmosSql
    }
  : {}

var varAfKvPdzBinding = !flagPlatformLandingZone
  ? {
      privateDnsZoneResourceId: !varUseExistingPdz.keyVault
        #disable-next-line BCP318
        ? privateDnsZoneKeyVault.outputs.resourceId
        : privateDnsZoneIds.keyVault
    }
  : {}

var varAfBlobPdzBinding = !flagPlatformLandingZone
  ? {
      blobPrivateDnsZoneResourceId: !varUseExistingPdz.blob
        #disable-next-line BCP318
        ? privateDnsZoneBlob.outputs.resourceId
        : privateDnsZoneIds.blob
    }
  : {}

// ── 2.12 WAF/AGW/Firewall policy helpers
var varPolicySettingsForModule = {
  state: wafPolicyDefinition.policySettings.enabledState
  mode: wafPolicyDefinition.policySettings.mode
  requestBodyCheck: wafPolicyDefinition.policySettings.requestBodyCheck
  maxRequestBodySizeInKb: wafPolicyDefinition.policySettings.maxRequestBodySizeInKb
  fileUploadLimitInMb: wafPolicyDefinition.policySettings.fileUploadLimitInMb
}

// Whether to deploy a WAF policy for AGW
var varDeployWafPolicy = varDeployAppGateway && deployToggles.wafPolicy

// If deploying WAF policy, cache its resourceId for AGW wiring
var varWafPolicyResourceId = varDeployWafPolicy ? wafPolicy!.outputs.resourceId : ''

// Public IP name for AGW (only used if public frontend is enabled)
var varAgwPipName = '${varPip}${varAgw}${baseName}'

// Firewall policy wiring and rules (optional)
var varDeployAfwPolicy = varDeployFirewall && length(firewallPolicyDefinition.networkRules! ?? []) > 0
var varNetworkRulesForModule = [
  for r in firewallPolicyDefinition.networkRules!: {
    name: r.name
    ruleType: 'NetworkRule'
    ...(empty(r.description!) ? {} : { description: r.description! })
    sourceAddresses: r.sourceAddresses
    destinationAddresses: r.destinationAddresses
    destinationPorts: r.destinationPorts
    ipProtocols: r.protocols
  }
]

// ── 2.13 Compute helpers (Jump VM, Build VM)
// Jump VM OS/image and computerName normalization
var varJumpVmOsType = contains(jumpVmDefinition, 'osType') && !empty(jumpVmDefinition.osType!)
  ? jumpVmDefinition.osType!
  : 'Windows'
var varDefaultJumpWindows = {
  publisher: 'MicrosoftWindowsServer'
  offer: 'WindowsServer'
  sku: '2022-datacenter-azure-edition'
  version: 'latest'
}
var varJumpVmImageRef = contains(jumpVmDefinition, 'imageReference') && !empty(string(jumpVmDefinition.imageReference!))
  ? jumpVmDefinition.imageReference!
  : varDefaultJumpWindows

var varRawJumpName = empty(jumpVmDefinition.name!)
  ? '${varVm}${baseName}jmp'
  : replace(replace(replace(jumpVmDefinition.name!, ' ', ''), '_', ''), '.', '')
var varMaxComputerNameLength = 15
var varJumpNameLen = min(varMaxComputerNameLength, length(varRawJumpName))
var varJumpComputerName = toLower(substring(varRawJumpName, 0, varJumpNameLen))

// Build VM OS/image and cloud-init templating
var varBuildVmOsType = contains(buildVmDefinition, 'osType') && !empty(buildVmDefinition.osType!)
  ? buildVmDefinition.osType!
  : 'Linux'
var varDefaultBuildUbuntu = {
  publisher: 'Canonical'
  offer: '0001-com-ubuntu-server-jammy'
  sku: '22_04-lts'
  version: 'latest'
}
var varBuildVmImageRef = contains(buildVmDefinition, 'imageReference') && !empty(string(buildVmDefinition.imageReference!))
  ? buildVmDefinition.imageReference!
  : varDefaultBuildUbuntu

// Normalize entire build VM object so nested props always exist
var varBuildVmNormalized = union(
  {
    azdo: { orgUrl: '', pool: '', agentName: '', workFolder: '' }
    github: { owner: '', repo: '', labels: '', agentName: '', workFolder: '' }
  },
  buildVmDefinition
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

// ── 2.14 Hub VNet (peer) parsing for reverse peering
var varPeerVnetId = hubVnetPeeringDefinition.peerVnetResourceId
var varPeerParts = split(varPeerVnetId, '/')
var varPeerSub = length(varPeerParts) >= 3 ? varPeerParts[2] : ''
var varPeerRg = length(varPeerParts) >= 5 ? varPeerParts[4] : ''
var varPeerVnetName = length(varPeerParts) >= 9 ? varPeerParts[8] : ''

//////////////////////////////////////////////////////////////////////////
// 3. RESOURCES
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

// ──────────────────────────────────────────────────────────────────────
// 3.1 Networking — VNet (reuse or create)
// ─────────────────────────────────────────────────────────────────────-

resource existingVNet 'Microsoft.Network/virtualNetworks@2024-07-01' existing = if (!empty(resourceIds.virtualNetworkResourceId!)) {
  name: varExistingVNetName
  scope: resourceGroup(varExistingVNetSubscriptionId, varExistingVNetResourceGroupName)
}

module virtualNetwork 'br/public:avm/res/network/virtual-network:0.7.0' = if (varDeployVnet) {
  name: 'virtualNetworkDeployment'
  params: {
    name: varVnetName
    location: location
    tags: varTags
    addressPrefixes: [vnetDefinition.addressSpace]
    dnsServers: vnetDefinition.dnsServers!
    enableTelemetry: enableTelemetry
    subnets: [
      for s in vnetDefinition.subnets: {
        name: s.name
        addressPrefix: s.addressPrefix
        ...(contains(s, 'delegation') && !empty(s.delegation!) ? { delegation: s.delegation! } : {})
        ...(contains(s, 'serviceEndpoints') && !empty(s.serviceEndpoints!)
          ? { serviceEndpoints: s.serviceEndpoints! }
          : {})
      }
    ]
    peerings: varHasPeer
      ? [
          {
            name: varPeerName
            remoteVirtualNetworkResourceId: varPeerCfgVnetId
            allowVirtualNetworkAccess: varPeerAllowVna
            allowForwardedTraffic: varPeerAllowFwd
            allowGatewayTransit: varPeerAllowGw
            useRemoteGateways: varPeerUseRgw
          }
        ]
      : []
  }
}

// ──────────────────────────────────────────────────────────────────────
// 3.3 Private DNS Zones (create when isolated AND per-zone ID not provided)
// ─────────────────────────────────────────────────────────────────────-

// Cognitiveservices
module privateDnsZoneCogSvcs 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.cognitiveservices) {
  name: 'dep-cogsvcs-private-dns-zone'
  params: {
    name: 'privatelink.cognitiveservices.azure.com'
    location: 'global'
    tags: varTags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: length(varPdnsLinksFromParam) > 0
      ? varPdnsLinksFromParam
      : [
          {
            name: '${varVnetName}-cogsvcs-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
  }
}

// OpenAI
module privateDnsZoneOpenAi 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.openai) {
  name: 'dep-openai-private-dns-zone'
  params: {
    name: 'privatelink.openai.azure.com'
    location: 'global'
    tags: varTags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: length(varPdnsLinksFromParam) > 0
      ? varPdnsLinksFromParam
      : [
          {
            name: '${varVnetName}-openai-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
  }
}

// AI Services
module privateDnsZoneAiService 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.aiServices) {
  name: 'dep-aiservices-private-dns-zone'
  params: {
    name: 'privatelink.services.ai.azure.com'
    location: 'global'
    tags: varTags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: length(varPdnsLinksFromParam) > 0
      ? varPdnsLinksFromParam
      : [
          {
            name: '${varVnetName}-aiservices-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
  }
}

// Search (needed by GenAI app and/or AF)
module privateDnsZoneSearch 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.search && varNeedSearchPdns) {
  name: 'dep-search-std-private-dns-zone'
  params: {
    name: 'privatelink.search.windows.net'
    location: 'global'
    tags: varTags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: length(varPdnsLinksFromParam) > 0
      ? varPdnsLinksFromParam
      : [
          {
            name: '${varVnetName}-search-std-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
  }
}

// Cosmos (SQL) (needed by GenAI app and/or AF)
module privateDnsZoneCosmos 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.cosmosSql && varNeedCosmosPdns) {
  name: 'dep-cosmos-std-private-dns-zone'
  params: {
    name: 'privatelink.documents.azure.com'
    location: 'global'
    tags: varTags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: length(varPdnsLinksFromParam) > 0
      ? varPdnsLinksFromParam
      : [
          {
            name: '${varVnetName}-cosmos-std-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
  }
}

// Blob (needed by GenAI app and/or AF)
module privateDnsZoneBlob 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.blob && varNeedBlobPdns) {
  name: 'dep-blob-std-private-dns-zone'
  params: {
    name: 'privatelink.blob.${environment().suffixes.storage}'
    location: 'global'
    tags: varTags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: length(varPdnsLinksFromParam) > 0
      ? varPdnsLinksFromParam
      : [
          {
            name: '${varVnetName}-blob-std-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
  }
}

// Key Vault (tie creation to whether ANY stack needs KV)
module privateDnsZoneKeyVault 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.keyVault && varNeedKvPdns) {
  name: 'kv-private-dns-zone'
  params: {
    name: 'privatelink.vaultcore.azure.net'
    location: 'global'
    tags: varTags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: length(varPdnsLinksFromParam) > 0
      ? varPdnsLinksFromParam
      : [
          {
            name: '${varVnetName}-kv-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
  }
}

// App Configuration
module privateDnsZoneAppConfig 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.appConfig && varHasAppConfig) {
  name: 'appconfig-private-dns-zone'
  params: {
    name: 'privatelink.azconfig.io'
    location: 'global'
    tags: varTags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: length(varPdnsLinksFromParam) > 0
      ? varPdnsLinksFromParam
      : [
          {
            name: '${varVnetName}-appcfg-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
  }
}

// Container Apps (regional PDNS zone)
module privateDnsZoneContainerApps 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.containerApps && varHasContainerEnv) {
  name: 'dep-containerapps-env-private-dns-zone'
  params: {
    name: 'privatelink.${location}.azurecontainerapps.io'
    location: 'global'
    tags: varTags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: length(varPdnsLinksFromParam) > 0
      ? varPdnsLinksFromParam
      : [
          {
            name: '${varVnetName}-containerapps-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
  }
}

// Container Registry PDNS
module privateDnsZoneAcr 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.acr && varHasAcr) {
  name: 'acr-private-dns-zone'
  params: {
    name: 'privatelink.azurecr.io'
    location: 'global'
    tags: varTags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: length(varPdnsLinksFromParam) > 0
      ? varPdnsLinksFromParam
      : [
          {
            name: '${varVnetName}-acr-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
  }
}

// App Insights PDNS
module privateDnsZoneInsights 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (varDeployPdnsAndPe && !varUseExistingPdz.appInsights && varHasAppInsights) {
  name: 'ai-private-dns-zone'
  params: {
    name: 'privatelink.applicationinsights.azure.com'
    location: 'global'
    tags: varTags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: length(varPdnsLinksFromParam) > 0
      ? varPdnsLinksFromParam
      : [
          {
            name: '${varVnetName}-ai-link'
            registrationEnabled: false
            virtualNetworkResourceId: varVnetResourceId
          }
        ]
  }
}

// ─────────────────────────────────────────────────────────────────────-
// 3.4 Private Endpoints (helpers + per-service)
// ─────────────────────────────────────────────────────────────────────-

// App Configuration
module privateEndpointAppConfig 'br/public:avm/res/network/private-endpoint:0.11.0' = if (varDeployPdnsAndPe && varHasAppConfig) {
  name: 'appconfig-private-endpoint'
  params: {
    name: '${varPe}${varAppcs}${baseName}'
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
            : privateDnsZoneIds.appConfig
        }
      ]
    }
  }
}

// Container Apps Environment
module privateEndpointContainerAppsEnv 'br/public:avm/res/network/private-endpoint:0.11.0' = if (varDeployPdnsAndPe && varHasContainerEnv) {
  name: 'containerapps-env-private-endpoint'
  params: {
    name: '${varPe}${varCae}${baseName}'
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
            : privateDnsZoneIds.containerApps
        }
      ]
    }
  }
}

// Azure Container Registry
module privateEndpointAcr 'br/public:avm/res/network/private-endpoint:0.11.0' = if (varDeployPdnsAndPe && varHasAcr) {
  name: 'acr-private-endpoint'
  params: {
    name: '${varPe}${varAcr}${baseName}'
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
            : privateDnsZoneIds.acr
        }
      ]
    }
  }
  dependsOn: [
    #disable-next-line BCP321
    (varDeployAcr) ? registry : null
  ]
}

// Storage (blob)
module privateEndpointStorageBlob 'br/public:avm/res/network/private-endpoint:0.11.0' = if (varDeployPdnsAndPe && varHasStorage) {
  name: 'blob-private-endpoint'
  params: {
    name: '${varPe}${varSt}${baseName}'
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
            : privateDnsZoneIds.blob
        }
      ]
    }
  }
}

// Cosmos DB (SQL)
module privateEndpointCosmos 'br/public:avm/res/network/private-endpoint:0.11.0' = if (varDeployPdnsAndPe && varHasCosmos) {
  name: 'cosmos-private-endpoint'
  params: {
    name: '${varPe}${varCos}${baseName}'
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
            ? databaseAccount.outputs.resourceId
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
            : privateDnsZoneIds.cosmosSql
        }
      ]
    }
  }
}

// Azure AI Search
module privateEndpointSearch 'br/public:avm/res/network/private-endpoint:0.11.0' = if (varDeployPdnsAndPe && varHasSearch) {
  name: 'search-private-endpoint'
  params: {
    name: '${varPe}${varSrch}${baseName}'
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
            : privateDnsZoneIds.search
        }
      ]
    }
  }
  dependsOn: [
    #disable-next-line BCP321
    (empty(resourceIds.searchServiceResourceId!)) ? searchService : null
    #disable-next-line BCP321
    (empty(resourceIds.virtualNetworkResourceId!)) ? virtualNetwork : null
    #disable-next-line BCP321
    (varDeployPdnsAndPe && !varUseExistingPdz.search && varNeedSearchPdns) ? privateDnsZoneSearch : null
  ]
}

// Key Vault (GenAI)
module privateEndpointKeyVault 'br/public:avm/res/network/private-endpoint:0.11.0' = if (varDeployPdnsAndPe && varHasKv) {
  name: 'kv-private-endpoint'
  params: {
    name: '${varPe}${varKv}${baseName}'
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
            : privateDnsZoneIds.keyVault
        }
      ]
    }
  }
}

// ─────────────────────────────────────────────────────────────────────-
// 3.5 Existing Resources (APIM, AGW, Firewall)
// ─────────────────────────────────────────────────────────────────────-
resource existingApim 'Microsoft.ApiManagement/service@2024-06-01-preview' existing = if (!empty(resourceIds.apimServiceResourceId!)) {
  name: varApimNameExisting
  scope: resourceGroup(varApimSub, varApimRg)
}

resource existingAppGateway 'Microsoft.Network/applicationGateways@2024-07-01' existing = if (!empty(resourceIds.applicationGatewayResourceId!)) {
  name: varAgwNameExisting
  scope: resourceGroup(varAgwSub, varAgwRg)
}

resource existingFirewall 'Microsoft.Network/azureFirewalls@2024-07-01' existing = if (!empty(resourceIds.firewallResourceId!)) {
  name: varAfwNameExisting
  scope: resourceGroup(varAfwSub, varAfwRg)
}

// ─────────────────────────────────────────────────────────────────────-
// 3.6 Observability (LAW, App Insights)
// ─────────────────────────────────────────────────────────────────────-

resource existingLogAnalytics 'Microsoft.OperationalInsights/workspaces@2025-02-01' existing = if (!empty(resourceIds.logAnalyticsWorkspaceResourceId!)) {
  name: varExistingLawName
  scope: resourceGroup(varExistingLawSubscriptionId, varExistingLawResourceGroupName)
}

module logAnalytics 'br/public:avm/res/operational-insights/workspace:0.12.0' = if (varDeployLogAnalytics) {
  name: 'deployLogAnalytics'
  params: {
    name: empty(logAnalyticsDefinition.name!) ? '${varLaw}${baseName}' : logAnalyticsDefinition.name!
    location: location
    skuName: logAnalyticsDefinition.sku
    dataRetention: logAnalyticsDefinition.retention
    tags: union(tags, logAnalyticsDefinition.tags! ?? {})
    managedIdentities: { systemAssigned: true }
    enableTelemetry: enableTelemetry
    replication: logAnalyticsDefinition.replication! ?? { enabled: true, location: 'westus2' }
  }
}

// App Insights

resource existingAppInsights 'Microsoft.Insights/components@2020-02-02' existing = if (!empty(resourceIds.appInsightsResourceId!)) {
  name: varExistingAIName
  scope: resourceGroup(varExistingAISubscriptionId, varExistingAIResourceGroupName)
}

module appInsights 'br/public:avm/res/insights/component:0.6.0' = if (varDeployAppInsights) {
  name: 'deployAppInsights'
  params: {
    name: empty(appInsightsDefinition.name!) ? '${varAi}${baseName}' : appInsightsDefinition.name!
    location: location
    workspaceResourceId: varLaIdEffective
    applicationType: appInsightsDefinition.applicationType ?? 'web'
    kind: appInsightsDefinition.kind ?? 'web'
    disableIpMasking: appInsightsDefinition.disableIpMasking! ?? false
    tags: union(tags, appInsightsDefinition.tags! ?? {})
    enableTelemetry: enableTelemetry
  }
  dependsOn: [
    #disable-next-line BCP321
    (empty(resourceIds.logAnalyticsWorkspaceResourceId!)) ? logAnalytics : null
  ]
}

// ─────────────────────────────────────────────────────────────────────-
// 3.7 Container Apps Environment (reuse or create)
// ─────────────────────────────────────────────────────────────────────-

resource existingContainerEnv 'Microsoft.App/managedEnvironments@2025-02-02-preview' existing = if (!empty(resourceIds.containerEnvResourceId!)) {
  name: varExistingEnvName
  scope: resourceGroup(varExistingEnvSubscriptionId, varExistingEnvResourceGroup)
}

module containerEnv 'br/public:avm/res/app/managed-environment:0.11.3' = if (varDeployContainerAppEnv) {
  name: 'deployContainerEnv'
  params: {
    name: varContainerEnvName
    location: location
    tags: union(tags, containerAppEnvDefinition.tags! ?? {})
    enableTelemetry: enableTelemetry

    appLogsConfiguration: (varHasLogAnalytics && (containerAppEnvDefinition.enableDiagnosticSettings! ?? false))
      ? {
          destination: 'log-analytics'
          logAnalyticsConfiguration: {
            customerId: varLaCustomerIdEffective
            sharedKey: varLaSharedKeyEffective
          }
        }
      : null

    appInsightsConnectionString: empty(resourceIds.appInsightsResourceId!)
      #disable-next-line BCP318
      ? appInsights.outputs.connectionString
      #disable-next-line BCP318
      : existingAppInsights.properties.ConnectionString

    // Key network settings
    internal: containerAppEnvDefinition.internalLoadBalancerEnabled
    infrastructureSubnetResourceId: varAcaInfraSubnetId
    zoneRedundant: containerAppEnvDefinition.zoneRedundancyEnabled

    // forward profiles (optional but recommended)
    workloadProfiles: containerAppEnvDefinition.workloadProfiles
  }
  dependsOn: [
    #disable-next-line BCP321
    (empty(resourceIds.virtualNetworkResourceId!)) ? virtualNetwork : null
    #disable-next-line BCP321
    (empty(resourceIds.logAnalyticsWorkspaceResourceId!)) ? logAnalytics : null
  ]
}

// ─────────────────────────────────────────────────────────────────────-
// 3.8 Container Apps
// ─────────────────────────────────────────────────────────────────────-

@batchSize(4)
module containerApps 'br/public:avm/res/app/container-app:0.18.1' = [
  for (app, index) in containerAppsList: if (varDeployContainerApps) {
    name: empty(app.name!) ? '${varCa}${baseName}-${app.appId}' : app.name!
    params: {
      name: empty(app.name!) ? '${varCa}${baseName}-${app.appId}' : app.name!
      location: location
      enableTelemetry: enableTelemetry

      environmentResourceId: varContainerEnvIdEffective
      workloadProfileName: app.profileName

      ingressExternal: bool(app.external!)
      ingressTargetPort: 80
      ingressTransport: 'auto'
      ingressAllowInsecure: false

      dapr: {
        enabled: true
        appId: app.appId
        appPort: 80
        appProtocol: 'http'
      }

      managedIdentities: {
        systemAssigned: true
        userAssignedResourceIds: []
      }

      scaleSettings: {
        minReplicas: app.minReplicas
        maxReplicas: app.maxReplicas
      }

      containers: [
        {
          name: app.appId
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

      tags: union(varTags, {
        'azd-service-name': app.appId
      })
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

// ─────────────────────────────────────────────────────────────────────-
// 3.9 App Services Backing Services — GenAI app scope (reuse or create)
// ─────────────────────────────────────────────────────────────────────-
// -------- ACR

resource existingAcr 'Microsoft.ContainerRegistry/registries@2025-05-01-preview' existing = if (!empty(resourceIds.containerRegistryResourceId!)) {
  name: varExistingAcrName
  scope: resourceGroup(varExistingAcrSub, varExistingAcrRg)
}

module registry 'br/public:avm/res/container-registry/registry:0.9.3' = if (varDeployAcr) {
  name: 'registryDeployment'
  params: {
    name: varAcrNameEffective!
    acrSku: varAcrEffectiveSku
    location: location
    publicNetworkAccess: 'Disabled'
    managedIdentities: { systemAssigned: true }
    tags: union(tags, containerRegistryDefinition.tags! ?? {})
    enableTelemetry: enableTelemetry
  }
}

// -------- Cosmos DB (GenAI)

resource existingCosmos 'Microsoft.DocumentDB/databaseAccounts@2025-04-15' existing = if (!empty(resourceIds.dbAccountResourceId!)) {
  name: varExistingCosmosName
  scope: resourceGroup(varExistingCosmosSub, varExistingCosmosRg)
}

module databaseAccount 'br/public:avm/res/document-db/database-account:0.15.1' = if (varDeployCosmos) {
  name: 'databaseAccountDeployment'
  params: {
    name: empty(varCosmosDef.name!) ? '${varCos}${baseName}' : varCosmosDef.name!
    zoneRedundant: false
    enableTelemetry: enableTelemetry
  }
}

// -------- Key Vault (GenAI)

resource existingVault 'Microsoft.KeyVault/vaults@2024-12-01-preview' existing = if (!empty(resourceIds.keyVaultResourceId!)) {
  name: varExistingKvName
  scope: resourceGroup(varExistingKvSub, varExistingKvRg)
}

module vault 'br/public:avm/res/key-vault/vault:0.13.3' = if (varDeployKv) {
  name: 'vaultDeployment'
  params: {
    name: empty(keyVaultDefinition.name!) ? '${varKv}${baseName}' : keyVaultDefinition.name!
    enablePurgeProtection: true
    tags: union(tags, keyVaultDefinition.tags! ?? {})
    enableTelemetry: enableTelemetry
  }
}

// -------- Storage Account (GenAI)

resource existingStorage 'Microsoft.Storage/storageAccounts@2025-01-01' existing = if (!empty(resourceIds.storageAccountResourceId!)) {
  name: varExistingSaName
  scope: resourceGroup(varExistingSaSub, varExistingSaRg)
}

module storageAccount 'br/public:avm/res/storage/storage-account:0.26.2' = if (varDeploySa) {
  name: 'storageAccountDeployment'
  params: {
    name: empty(varStorageAccountDef.name!) ? '${varSt}${baseName}' : varStorageAccountDef.name!
    allowBlobPublicAccess: false
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Deny'
    }
    tags: union(tags, varStorageAccountDef.tags! ?? {})
    enableTelemetry: enableTelemetry
  }
}

// -------- AI Search (GenAI)
#disable-next-line BCP081
resource existingSearch 'Microsoft.Search/searchServices@2024-03-01' existing = if (!empty(resourceIds.searchServiceResourceId!)) {
  name: varExistingSearchName
  scope: resourceGroup(varExistingSearchSub, varExistingSearchRg)
}

module searchService 'br/public:avm/res/search/search-service:0.11.1' = if (varDeploySearch) {
  name: 'searchServiceDeployment'
  params: {
    name: empty(varSearchDef.name!) ? '${varSrch}${baseName}' : varSearchDef.name!
    tags: union(tags, varSearchDef.tags! ?? {})
    enableTelemetry: enableTelemetry
  }
}

// -------- App Configuration

resource existingAppConfig 'Microsoft.AppConfiguration/configurationStores@2024-06-01' existing = if (!empty(resourceIds.appConfigResourceId!)) {
  name: varExistingAppcsName
  scope: resourceGroup(varExistingAppcsSub, varExistingAppcsRg)
}

module configurationStore 'br/public:avm/res/app-configuration/configuration-store:0.9.2' = if (varDeployAppConfig) {
  name: 'configurationStoreDeployment'
  params: {
    name: varAppConfigName
    location: location
    disableLocalAuth: !(appConfigurationDefinition.localAuthEnabled! ?? false)
    enablePurgeProtection: appConfigurationDefinition.purgeProtectionEnabled! ?? true
    softDeleteRetentionInDays: appConfigurationDefinition.softDeleteRetentionInDays! ?? 7
    replicaLocations: [
      for r in (toLower(appConfigurationDefinition.sku! ?? 'standard') == 'free'
        ? []
        : (appConfigurationDefinition.replicaLocations! ?? [])): {
        name: empty(r.name!) ? 'rep-${replace(r.replicaLocation, ' ', '')}' : r.name!
        replicaLocation: r.replicaLocation
      }
    ]

    tags: union(tags, appConfigurationDefinition.tags! ?? {})
    roleAssignments: appConfigurationDefinition.roleAssignments! ?? []
    enableTelemetry: enableTelemetry
  }
}

// ─────────────────────────────────────────────────────────────────────-
// 3.10 AI Foundry (AVM Pattern Module)
// ─────────────────────────────────────────────────────────────────────-

// module aiFoundry 'br/public:avm/ptn/ai-ml/ai-foundry:0.3.0' = {
// Note: temporarily using custom module to avoid deployment scripts creation by AI Foundry AVM Module
module aiFoundry 'components/ai-foundry/main.bicep' = {
  name: 'aiFoundryDeployment'
  params: {
    baseUniqueName: varAfBaseUniqueName
    location: varAfLocation
    enableTelemetry: enableTelemetry
    lock: varAfParam.lock

    // Disabling wait scripts to avoid access key authoring issues
    waitForConnections: false
    waitForProject: false

    // Deterministic base for AF resource names
    baseName: baseName

    // Core networking (PDNS for AI services domain families)
    // Force createCapabilityHosts=false when Agent Service is disabled
    aiFoundryConfiguration: union(varAfConfigObj, varAfNetworkingConfig, {
      createCapabilityHosts: varAfAgentSvcEnabled
    })

    // Ask AVM to create AF-associated resources (Search/Cosmos/Storage/KV)
    includeAssociatedResources: varAfWantsDeps

    // Bind AF-associated resources to your PDNS zones (and optionally reuse app resources)
    aiSearchConfiguration: union(varAfSearchCfg, varAfAiSearchPdzBinding, {})

    cosmosDbConfiguration: union(varAfCosmosCfg, varAfCosmosPdzBinding, {})

    keyVaultConfiguration: union(varAfKvCfg, varAfKvPdzBinding, {})

    storageAccountConfiguration: union(varAfStorageCfg, varAfBlobPdzBinding, {})

    // Use caller subnet if provided, otherwise our PE subnet
    privateEndpointSubnetResourceId: varAfAgentSvcEnabled
      ? (!empty(varAfPeSubnetParam) ? varAfPeSubnetParam : varPeSubnetId)
      : ''

    aiModelDeployments: varAfModelDeployments
    tags: tags
  }
  dependsOn: [
    #disable-next-line BCP321
    (empty(resourceIds.searchServiceResourceId!)) ? searchService : null
    #disable-next-line BCP321
    (empty(resourceIds.virtualNetworkResourceId!)) ? virtualNetwork : null
    #disable-next-line BCP321
    (varDeployPdnsAndPe && !varUseExistingPdz.search && varNeedSearchPdns) ? privateDnsZoneSearch : null
    #disable-next-line BCP321
    (varDeployPdnsAndPe && !varUseExistingPdz.cognitiveservices) ? privateDnsZoneCogSvcs : null
    #disable-next-line BCP321
    (varDeployPdnsAndPe && !varUseExistingPdz.openai) ? privateDnsZoneOpenAi : null
    #disable-next-line BCP321
    (varDeployPdnsAndPe && !varUseExistingPdz.aiServices) ? privateDnsZoneAiService : null
  ]
}

// ─────────────────────────────────────────────────────────────────────-
// 3.11 Gateways (WAF policy, App Gateway, Azure Firewall, APIM)
// ─────────────────────────────────────────────────────────────────────-

module wafPolicy 'br/public:avm/res/network/application-gateway-web-application-firewall-policy:0.2.0' = if (varDeployWafPolicy) {
  name: 'wafPolicyDeployment'
  params: {
    name: varWafName
    location: location
    tags: union(tags, wafPolicyDefinition.tags! ?? {})
    enableTelemetry: enableTelemetry
    policySettings: varPolicySettingsForModule

    managedRules: {
      managedRuleSets: [
        { ruleSetType: 'OWASP', ruleSetVersion: '3.2' }
      ]
      exclusions: []
    }
    customRules: []
  }
}

module applicationGateway 'br/public:avm/res/network/application-gateway:0.7.1' = if (varDeployAppGateway) {
  name: 'applicationGatewayDeployment'
  params: {
    name: agwName
    location: location
    sku: 'WAF_v2'
    firewallPolicyResourceId: varWafPolicyResourceId
    enableTelemetry: enableTelemetry
    gatewayIPConfigurations: [
      { name: 'appGatewayIpConfig', properties: { subnet: { id: agwSubnet } } }
    ]

    frontendIPConfigurations: concat(
      varAgwCreatePublicFrontend
        ? [
            {
              name: 'publicFrontend'
              properties: { publicIPAddress: { id: resourceId('Microsoft.Network/publicIPAddresses', varAgwPipName) } }
            }
          ]
        : [],
      [
        {
          name: 'privateFrontend'
          properties: {
            privateIPAllocationMethod: 'Static'
            privateIPAddress: '192.168.3.10'
            subnet: { id: agwSubnet }
          }
        }
      ]
    )

    frontendPorts: [
      { name: 'port80', properties: { port: 80 } }
    ]

    backendAddressPools: [
      { name: 'defaultPool' }
    ]

    backendHttpSettingsCollection: [
      {
        name: 'defaultSetting'
        properties: {
          cookieBasedAffinity: 'Disabled'
          port: 80
          protocol: 'Http'
        }
      }
    ]

    // keep listener on the private frontend
    httpListeners: [
      {
        name: 'defaultListener'
        properties: {
          frontendIPConfiguration: { id: '${agwId}/frontendIPConfigurations/privateFrontend' }
          frontendPort: { id: '${agwId}/frontendPorts/port80' }
          protocol: 'Http'
        }
      }
    ]

    redirectConfigurations: [
      {
        name: 'httpsRedirect'
        properties: {
          redirectType: 'Permanent'
          includePath: true
          includeQueryString: true
          targetUrl: 'https://example.com'
        }
      }
    ]

    requestRoutingRules: [
      {
        name: 'defaultRule'
        properties: {
          ruleType: 'Basic'
          priority: 100
          httpListener: { id: '${agwId}/httpListeners/defaultListener' }
          redirectConfiguration: { id: '${agwId}/redirectConfigurations/httpsRedirect' }
        }
      }
    ]
  }

  dependsOn: [
    #disable-next-line BCP321
    (varDeployWafPolicy) ? wafPolicy : null
    #disable-next-line BCP321
    (varAgwCreatePublicFrontend) ? appGatewayPip : null
    #disable-next-line BCP321
    (empty(resourceIds.virtualNetworkResourceId!)) ? virtualNetwork : null
  ]
}

module appGatewayPip 'br/public:avm/res/network/public-ip-address:0.9.0' = if (varDeployAppGateway && varAgwCreatePublicFrontend) {
  name: 'appGatewayPipDeployment'
  params: {
    name: varAgwPipName
    location: location
    skuName: 'Standard'
    publicIPAllocationMethod: 'Static'
    availabilityZones: publicIpAvailabilityZones
    tags: tags
    enableTelemetry: enableTelemetry
  }
}

module fwPolicy 'br/public:avm/res/network/firewall-policy:0.3.1' = if (varDeployAfwPolicy) {
  name: 'firewallPolicyDeployment'
  params: {
    name: varAfwPolicyName
    location: location
    tags: tags
    enableTelemetry: enableTelemetry

    ruleCollectionGroups: (length(varNetworkRulesForModule) > 0)
      ? [
          {
            name: empty(firewallPolicyDefinition.networkPolicyRuleCollectionGroupName!)
              ? 'networkRules'
              : firewallPolicyDefinition.networkPolicyRuleCollectionGroupName!
            priority: firewallPolicyDefinition.networkPolicyRuleCollectionGroupPriority! ?? 100
            ruleCollections: [
              {
                name: 'defaultNetworkRules'
                ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
                action: { type: 'Allow' }
                rules: varNetworkRulesForModule
              }
            ]
          }
        ]
      : []
  }
}

module firewallPip 'br/public:avm/res/network/public-ip-address:0.9.0' = if (varDeployFirewall) {
  name: 'firewallPipDeployment'
  params: {
    name: '${varPip}${varAfw}${baseName}'
    location: location
    skuName: 'Standard'
    publicIPAllocationMethod: 'Static'
    availabilityZones: publicIpAvailabilityZones
    tags: tags
    enableTelemetry: enableTelemetry
  }
}

// 1) Azure Firewall without policy
module azureFirewall_noPolicy 'br/public:avm/res/network/azure-firewall:0.8.0' = if (varDeployFirewall && !varDeployAfwPolicy) {
  name: 'azureFirewallDeployment'
  params: {
    name: varAfwName
    location: location
    tags: union(tags, firewallDefinition.tags! ?? {})
    azureSkuTier: firewallDefinition.tier!
    availabilityZones: firewallDefinition.zones
    virtualNetworkResourceId: varVnetResourceId
    enableTelemetry: enableTelemetry
  }
}

// 2) Azure Firewall with policy
module azureFirewall_withPolicy 'br/public:avm/res/network/azure-firewall:0.8.0' = if (varDeployFirewall && varDeployAfwPolicy) {
  name: 'azureFirewallDeployment'
  params: {
    name: varAfwName
    location: location
    tags: union(tags, firewallDefinition.tags! ?? {})
    azureSkuTier: firewallDefinition.tier!
    availabilityZones: firewallDefinition.zones
    virtualNetworkResourceId: varVnetResourceId
    enableTelemetry: enableTelemetry
    firewallPolicyId: fwPolicy!.outputs.resourceId
  }
  dependsOn: [
    fwPolicy!
  ]
}

#disable-next-line BCP081
module apim 'br/public:avm/res/api-management/service:0.11.0' = if (varDeployApim) {
  name: 'apimDeployment'
  params: {
    name: varApimName
    location: location
    tags: union(tags, apimDefinition.tags! ?? {})

    // AVM expects these:
    sku: apimDefinition.skuRoot! // Developer | Basic | Standard | Premium | Consumption
    skuCapacity: apimDefinition.skuCapacity

    publisherEmail: apimDefinition.publisherEmail
    publisherName: apimDefinition.publisherName

    // Enable HTTP/2 via customProperties (string "true"/"false")
    customProperties: apimDefinition.protocols! != null && apimDefinition!.protocols!.enableHttp2
      ? { 'Microsoft.WindowsAzure.ApiManagement.Gateway.Protocols.Server.Http2': 'true' }
      : {}

    enableTelemetry: enableTelemetry
    // Optional:
    // minApiVersion: apimDefinition.minApiVersion
    // notificationSenderEmail: apimDefinition.notificationSenderEmail
    // hostnameConfigurations: apimDefinition.hostnameConfiguration
    // additionalLocations: apimDefinition.additionalLocations
  }
}

// ─────────────────────────────────────────────────────────────────────-
// 3.12 Hub/Spoke Peering
// ─────────────────────────────────────────────────────────────────────-

// Spoke -> Hub
module existingSpokePeering 'br/public:avm/res/network/virtual-network:0.7.0' = if (!empty(resourceIds.virtualNetworkResourceId!) && varHasPeer) {
  name: 'existingSpokePeering'
  scope: resourceGroup(varExistingVNetSubscriptionId, varExistingVNetResourceGroupName)
  params: {
    // point the module at the existing spoke VNet
    name: varExistingVNetName
    location: existingVNet!.location
    // pass through current settings so we don't drift anything
    addressPrefixes: existingVNet!.properties.addressSpace.addressPrefixes
    dnsServers: empty(existingVNet!.properties.dhcpOptions!.dnsServers)
      ? []
      : existingVNet!.properties.dhcpOptions.dnsServers
    tags: existingVNet!.tags
    enableTelemetry: enableTelemetry

    // add only the peering we need
    peerings: [
      {
        name: varPeerName
        remoteVirtualNetworkResourceId: varPeerCfgVnetId
        allowVirtualNetworkAccess: varPeerAllowVna
        allowForwardedTraffic: varPeerAllowFwd
        allowGatewayTransit: varPeerAllowGw
        useRemoteGateways: varPeerUseRgw
      }
    ]
  }
}

resource peerVnet 'Microsoft.Network/virtualNetworks@2024-07-01' existing = if (!empty(varPeerVnetId)) {
  name: varPeerVnetName
  scope: resourceGroup(varPeerSub, varPeerRg)
}

// Hub -> Spoke reverse peering
module hubReversePeering 'br/public:avm/res/network/virtual-network:0.7.0' = if (!empty(varPeerVnetId) && hubVnetPeeringDefinition.createReversePeering) {
  name: 'hubReversePeering'
  scope: resourceGroup(varPeerSub, varPeerRg)
  params: {
    // point the module at the existing hub VNet
    name: varPeerVnetName
    location: peerVnet!.location
    // preserve existing settings to avoid drift
    addressPrefixes: peerVnet!.properties.addressSpace.addressPrefixes
    dnsServers: empty(peerVnet!.properties.dhcpOptions!.dnsServers) ? [] : peerVnet!.properties.dhcpOptions.dnsServers
    tags: peerVnet!.tags
    enableTelemetry: enableTelemetry

    // add only the reverse peering we need
    peerings: [
      {
        name: empty(hubVnetPeeringDefinition.reverseName) ? 'to-spoke' : hubVnetPeeringDefinition.reverseName
        remoteVirtualNetworkResourceId: varVnetResourceId
        allowVirtualNetworkAccess: hubVnetPeeringDefinition.reverseAllowVirtualNetworkAccess
        allowForwardedTraffic: hubVnetPeeringDefinition.reverseAllowForwardedTraffic
        allowGatewayTransit: hubVnetPeeringDefinition.reverseAllowGatewayTransit
        useRemoteGateways: hubVnetPeeringDefinition.reverseUseRemoteGateways
      }
    ]
  }
  dependsOn: [
    #disable-next-line BCP321
    (empty(resourceIds.virtualNetworkResourceId!)) ? virtualNetwork : null
  ]
}

module bastionVault 'br/public:avm/res/key-vault/vault:0.13.3' = if (varDeployJumpVm) {
  name: 'bastionKeyVaultDeployment'
  params: {
    name: varBastionKvName
    // Public by default (no private endpoints or firewall rules passed here)
    enablePurgeProtection: true
    tags: union(tags, bastionKeyVaultDefinition.tags! ?? {})
    enableTelemetry: enableTelemetry
  }
}

// Create/seed the admin password as a secret for operators (optional but handy)
resource bastionVaultSecret 'Microsoft.KeyVault/vaults/secrets@2024-11-01' = if (varDeployJumpVm) {
  name: '${varBastionKvName}/${jumpVmDefinition.vmKeyVaultSecName}'
  properties: {
    value: jumpVmAdminPassword
    contentType: 'text/plain'
  }
  dependsOn: [bastionVault]
}

module jumpVm 'br/public:avm/res/compute/virtual-machine:0.20.0' = if (varDeployJumpVm) {
  name: 'jumpVmDeployment'
  params: {
    name: empty(jumpVmDefinition.name!) ? '${varVm}${baseName}-jump' : jumpVmDefinition.name!
    location: location
    tags: union(tags, jumpVmDefinition.tags! ?? {})
    enableTelemetry: enableTelemetry
    osType: varJumpVmOsType
    availabilityZone: -1
    adminUsername: jumpVmDefinition.adminUsername
    adminPassword: jumpVmAdminPassword
    computerName: varJumpComputerName
    imageReference: varJumpVmImageRef
    vmSize: jumpVmDefinition.sku

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
    (empty(resourceIds.virtualNetworkResourceId!)) ? virtualNetwork : null
  ]
}

// Only deploy Build VM when an SSH key is provided
module buildVm 'br/public:avm/res/compute/virtual-machine:0.20.0' = if (varDeployBuildVm && !empty(buildVmDefinition.sshPublicKey)) {
  name: 'buildVmDeployment'
  params: {
    name: empty(buildVmDefinition.name!) ? '${varVm}${baseName}-build' : buildVmDefinition.name!
    location: location
    tags: union(tags, buildVmDefinition.tags! ?? {})
    enableTelemetry: enableTelemetry

    osType: varBuildVmOsType
    availabilityZone: -1
    adminUsername: buildVmDefinition.adminUsername
    imageReference: varBuildVmImageRef
    vmSize: buildVmDefinition.sku

    disablePasswordAuthentication: true
    publicKeys: [
      {
        path: '/home/${buildVmDefinition.adminUsername}/.ssh/authorized_keys'
        keyData: buildVmDefinition.sshPublicKey
      }
    ]

    osDisk: {
      caching: 'ReadWrite'
      diskSizeGB: 64
      managedDisk: { storageAccountType: 'Premium_LRS' }
    }

    nicConfigurations: [
      {
        name: 'nic-build-1'
        ipConfigurations: [
          {
            name: 'ipconfig1'
            subnetResourceId: varBuildSubnetId
            privateIPAllocationMethod: 'Dynamic'
          }
        ]
      }
    ]

    customData: base64(varBuildVMCloudInit)
  }
  dependsOn: [
    #disable-next-line BCP321
    (empty(resourceIds.virtualNetworkResourceId!)) ? virtualNetwork : null
  ]
}

// ─────────────────────────────────────────────────────────────────────-
// 3.13 Grounding with Bing Search
// ─────────────────────────────────────────────────────────────────────-

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
output virtualNetworkResourceId string = empty(resourceIds.virtualNetworkResourceId!)
  #disable-next-line BCP318
  ? virtualNetwork.outputs.resourceId
  : existingVNet.id

// Log Analytics
@description('Log Analytics workspace resource ID.')
output logAnalyticsWorkspaceResourceId string = varDeployLogAnalytics
  #disable-next-line BCP318
  ? logAnalytics.outputs.resourceId
  : (empty(resourceIds.logAnalyticsWorkspaceResourceId!) ? '' : existingLogAnalytics.id)

// App Insights
@description('Application Insights resource ID.')
output applicationInsightsResourceId string = varDeployAppInsights
  #disable-next-line BCP318
  ? appInsights.outputs.resourceId
  : (empty(resourceIds.appInsightsResourceId!) ? '' : existingAppInsights.id)

// Container Apps Environment
@description('Container Apps Environment resource ID.')
output containerEnvResourceId string = !empty(resourceIds.containerEnvResourceId!)
  ? resourceIds.containerEnvResourceId!
  : (varDeployContainerAppEnv ? resourceId('Microsoft.App/managedEnvironments', varContainerEnvName) : '')

// ACR
@description('Container registry resource ID.')
output containerRegistryResourceId string = !empty(resourceIds.containerRegistryResourceId!)
  ? resourceIds.containerRegistryResourceId!
  : (varDeployAcr ? resourceId('Microsoft.ContainerRegistry/registries', varAcrNameEffective) : '')

// Storage
@description('Storage account resource ID.')
#disable-next-line BCP318
output storageAccountResourceId string = varDeploySa ? storageAccount.outputs.resourceId : existingStorage.id

// Key Vault
@description('Key Vault resource ID.')
#disable-next-line BCP318
output keyVaultResourceId string = varDeployKv ? vault.outputs.resourceId : existingVault.id

// Cosmos
@description('Cosmos DB account resource ID.')
#disable-next-line BCP318
output dbAccountResourceId string = varDeployCosmos ? databaseAccount.outputs.resourceId : existingCosmos.id

// Search
@description('Azure AI Search service resource ID.')
#disable-next-line BCP318
output searchServiceResourceId string = varDeploySearch ? searchService.outputs.resourceId : existingSearch.id

// App Configuration
@description('App Configuration store resource ID.')
output appConfigResourceId string = !empty(resourceIds.appConfigResourceId!)
  ? resourceIds.appConfigResourceId!
  : (varDeployAppConfig ? resourceId('Microsoft.AppConfiguration/configurationStores', varAppConfigName) : '')

// APIM
@description('API Management service resource ID.')
output apimServiceResourceId string = varDeployApim
  ? resourceId('Microsoft.ApiManagement/service', varApimName)
  : (empty(resourceIds.apimServiceResourceId!) ? '' : existingApim.id)

// Application Gateway
@description('Application Gateway resource ID.')
output applicationGatewayResourceId string = varDeployAppGateway
  ? resourceId('Microsoft.Network/applicationGateways', varAgwName)
  : (empty(resourceIds.applicationGatewayResourceId!) ? '' : existingAppGateway.id)

// Azure Firewall
@description('Azure Firewall resource ID.')
output firewallResourceId string = varDeployFirewall
  ? resourceId('Microsoft.Network/azureFirewalls', varAfwName)
  : (empty(resourceIds.firewallResourceId!) ? '' : existingFirewall.id)

// Grounding with Bing
@description('Grounding (Bing Search) resource ID.')
#disable-next-line BCP318
output groundingServiceResourceId string = varInvokeBingModule ? bingSearch!.outputs.resourceId : ''

// WAF Policy
@description('Web Application Firewall (WAF) policy resource ID.')
output wafPolicyResourceId string = varDeployAppGateway ? varWafPolicyResourceId : ''
