// -------------------------------------------------------------------------------------------------
// API Management - direct ARM resource (no AVM), but reusing your exported types
// Notes:
// - Keeps the same shape you pass today (apimDefinition: types.apimDefinitionType).
// - Ensures "zones" is emitted as string[] ('1','2','3'), which PSRule checks for AZR-000052.
// - Additional locations also map availabilityZones (int[]) -> zones (string[]).
// - HTTP/2 flag kept compatible with how you were setting it.
// - enableTelemetry is accepted for interface-compatibility, but not used by the ARM resource.
// -------------------------------------------------------------------------------------------------

// Adjust the path below to where your exported types live.
import * as types from '../../common/types.bicep'

@description('Required. APIM resource name (usually your varApimName).')
param name string

@description('Required. Azure region for the primary location.')
param location string

@description('Required. Full APIM definition object, using your exported type.')
param apimDefinition types.apimDefinitionType

// -------------------------------
// Helpers
// -------------------------------

var primaryZones = length(apimDefinition.zones!) > 0 ? apimDefinition.zones! : null

// Cache the source list
var _additionalLocations = apimDefinition.additionalLocations! ?? []

// Build zones (string[]) for each location in a separate var
// Removed nested for-expression to avoid parser limitations

// Normalize additional locations (no nested 'for' inside object)
var additionalLocationsNormalized = [
  for (l, i) in _additionalLocations: {
    location: l.location
    sku: {
      name: l.sku.name
      capacity: l.sku.capacity
    }

    // Emit availability/zones as provided by the source type (avoid nested for)
    zones: length(l.availabilityZones! ?? []) > 0 ? l.availabilityZones! : null

    disableGateway: l.disableGateway!
    natGatewayState: l.natGatewayState!
    publicIpAddressId: l.publicIpAddressResourceId!

    virtualNetworkConfiguration: l.virtualNetworkConfiguration! != null
      ? ({
          subnetResourceId: l.virtualNetworkConfiguration!.subnetResourceId
        })
      : null
  }
]

// Hostname configurations – include only when provided, property-level conditionals to avoid nulls
var hostnameConfigurationsNormalized = [
  for h in (apimDefinition.hostnameConfigurations! ?? []): {
    type: h.type
    hostName: h.hostName
    keyVaultId: h.keyVaultId!
    encodedCertificate: h.encodedCertificate!
    certificatePassword: h.certificatePassword!
    negotiateClientCertificate: h.negotiateClientCertificate!
    defaultSslBinding: h.defaultSslBinding!
    identityClientId: h.identityClientId!
  }
]

// Helper conditional objects
var _apiVersionConstraint = apimDefinition.minApiVersion! != null
  ? { minApiVersion: apimDefinition.minApiVersion! }
  : null
var _customProperties = apimDefinition.protocols!.enableHttp2 == true
  ? {
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Protocols.Server.Http2': 'true'
    }
  : null

// -------------------------------
// Resource
// -------------------------------
resource apim 'Microsoft.ApiManagement/service@2024-05-01' = {
  name: name
  location: location
  tags: apimDefinition.tags! ?? {}

  // Top-level SKU
  sku: {
    name: apimDefinition.skuRoot!
    capacity: apimDefinition.skuCapacity
  }

  // Top-level zones (string[] or null)
  zones: primaryZones

  // Everything else lives under 'properties'
  properties: {
    // Publisher info
    publisherEmail: apimDefinition.publisherEmail
    publisherName: apimDefinition.publisherName

    // Optional min control-plane API version
    apiVersionConstraint: _apiVersionConstraint

    // Notification sender (only emit when provided)
    notificationSenderEmail: apimDefinition.notificationSenderEmail!

    // HTTP/2 flag (same logic you had)
    customProperties: _customProperties

    // Multi-region
    additionalLocations: length(additionalLocationsNormalized) > 0 ? additionalLocationsNormalized : null

    // Hostnames
    hostnameConfigurations: length(hostnameConfigurationsNormalized) > 0 ? hostnameConfigurationsNormalized : null

    // Only valid for Consumption SKU
    enableClientCertificate: apimDefinition.skuRoot! == 'Consumption' ? apimDefinition.clientCertificateEnabled : null
  }
}

// Handy outputs
output resourceId string = apim.id
output nameOut string = apim.name
output locationOut string = apim.location
