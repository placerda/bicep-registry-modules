#  `[AiMl/LandingZoneComponentsApiManagement]`


## Navigation

- [Resource Types](#Resource-Types)
- [Parameters](#Parameters)
- [Outputs](#Outputs)

## Resource Types

| Resource Type | API Version | References |
| :-- | :-- | :-- |
| `Microsoft.ApiManagement/service` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.apimanagement_service.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2024-05-01/service)</li></ul> |

## Parameters

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`apimDefinition`](#parameter-apimdefinition) | object | Full APIM definition object, using your exported type. |
| [`location`](#parameter-location) | string | Azure region for the primary location. |
| [`name`](#parameter-name) | string | APIM resource name (usually your varApimName). |

### Parameter: `apimDefinition`

Full APIM definition object, using your exported type.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`clientCertificateEnabled`](#parameter-apimdefinitionclientcertificateenabled) | bool | Enables client certificate authentication on the gateway. |
| [`publisherEmail`](#parameter-apimdefinitionpublisheremail) | string | Publisher email address. |
| [`publisherName`](#parameter-apimdefinitionpublishername) | string | Publisher display name. |
| [`signIn`](#parameter-apimdefinitionsignin) | object | Sign-in configuration for the developer portal. |
| [`signUp`](#parameter-apimdefinitionsignup) | object | Sign-up configuration for the developer portal. |
| [`skuCapacity`](#parameter-apimdefinitionskucapacity) | int | Capacity (scale units) for the chosen SKU. |
| [`tenantAccess`](#parameter-apimdefinitiontenantaccess) | object | Tenant access configuration for the management plane. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`additionalLocations`](#parameter-apimdefinitionadditionallocations) | array | Additional regions for the API Management service. |
| [`certificate`](#parameter-apimdefinitioncertificate) | object | Certificates map that can be used by other flows (not directly by hostnameConfigurations). |
| [`hostnameConfigurations`](#parameter-apimdefinitionhostnameconfigurations) | array | Hostname configuration array in AVM-friendly format. |
| [`minApiVersion`](#parameter-apimdefinitionminapiversion) | string | Minimum ARM API version to use for APIM control-plane operations. |
| [`name`](#parameter-apimdefinitionname) | string | API Management service name. |
| [`notificationSenderEmail`](#parameter-apimdefinitionnotificationsenderemail) | string | Sender email address used by APIM system notifications. |
| [`protocols`](#parameter-apimdefinitionprotocols) | object | Protocol options for the gateway. |
| [`roleAssignments`](#parameter-apimdefinitionroleassignments) | array | Role assignments to create on the API Management service. |
| [`skuRoot`](#parameter-apimdefinitionskuroot) | string | SKU for API Management (Developer/Basic/Standard/Premium/Consumption/V2 variants). |
| [`tags`](#parameter-apimdefinitiontags) | object | Tags to apply to the API Management service. |
| [`zones`](#parameter-apimdefinitionzones) | array | Availability Zones for the primary region (use at least two where supported). |

### Parameter: `apimDefinition.clientCertificateEnabled`

Enables client certificate authentication on the gateway.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.publisherEmail`

Publisher email address.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.publisherName`

Publisher display name.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.signIn`

Sign-in configuration for the developer portal.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enabled`](#parameter-apimdefinitionsigninenabled) | bool | Enables sign-in on the developer portal. |

### Parameter: `apimDefinition.signIn.enabled`

Enables sign-in on the developer portal.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.signUp`

Sign-up configuration for the developer portal.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enabled`](#parameter-apimdefinitionsignupenabled) | bool | Enables sign-up on the developer portal. |
| [`termsOfService`](#parameter-apimdefinitionsignuptermsofservice) | object | Terms of Service configuration for sign-up. |

### Parameter: `apimDefinition.signUp.enabled`

Enables sign-up on the developer portal.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.signUp.termsOfService`

Terms of Service configuration for sign-up.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`consentRequired`](#parameter-apimdefinitionsignuptermsofserviceconsentrequired) | bool | Indicates whether user consent to ToS is required. |
| [`enabled`](#parameter-apimdefinitionsignuptermsofserviceenabled) | bool | Indicates whether Terms of Service are enabled. |
| [`text`](#parameter-apimdefinitionsignuptermsofservicetext) | string | Text for the Terms of Service displayed to users. |

### Parameter: `apimDefinition.signUp.termsOfService.consentRequired`

Indicates whether user consent to ToS is required.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.signUp.termsOfService.enabled`

Indicates whether Terms of Service are enabled.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.signUp.termsOfService.text`

Text for the Terms of Service displayed to users.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.skuCapacity`

Capacity (scale units) for the chosen SKU.

- Required: Yes
- Type: int

### Parameter: `apimDefinition.tenantAccess`

Tenant access configuration for the management plane.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enabled`](#parameter-apimdefinitiontenantaccessenabled) | bool | Enables tenant access for the management plane. |

### Parameter: `apimDefinition.tenantAccess.enabled`

Enables tenant access for the management plane.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.additionalLocations`

Additional regions for the API Management service.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`location`](#parameter-apimdefinitionadditionallocationslocation) | string | Azure region name for this additional location (e.g., westus2). |
| [`sku`](#parameter-apimdefinitionadditionallocationssku) | object | SKU settings for this additional location. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`availabilityZones`](#parameter-apimdefinitionadditionallocationsavailabilityzones) | array | Availability Zones to use in this location (use at least two where supported). |
| [`disableGateway`](#parameter-apimdefinitionadditionallocationsdisablegateway) | bool | Disables the gateway in this additional location. |
| [`natGatewayState`](#parameter-apimdefinitionadditionallocationsnatgatewaystate) | string | Enables or disables NAT Gateway for this location. |
| [`publicIpAddressResourceId`](#parameter-apimdefinitionadditionallocationspublicipaddressresourceid) | string | Resource ID of a Standard Public IP to associate (where supported). |
| [`virtualNetworkConfiguration`](#parameter-apimdefinitionadditionallocationsvirtualnetworkconfiguration) | object | Virtual network configuration for this location. |

### Parameter: `apimDefinition.additionalLocations.location`

Azure region name for this additional location (e.g., westus2).

- Required: Yes
- Type: string

### Parameter: `apimDefinition.additionalLocations.sku`

SKU settings for this additional location.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`capacity`](#parameter-apimdefinitionadditionallocationsskucapacity) | int | Capacity (scale units) for this location. |
| [`name`](#parameter-apimdefinitionadditionallocationsskuname) | string | Name of the SKU for this location. |

### Parameter: `apimDefinition.additionalLocations.sku.capacity`

Capacity (scale units) for this location.

- Required: Yes
- Type: int

### Parameter: `apimDefinition.additionalLocations.sku.name`

Name of the SKU for this location.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Basic'
    'BasicV2'
    'Consumption'
    'Developer'
    'Isolated'
    'Premium'
    'Standard'
    'StandardV2'
  ]
  ```

### Parameter: `apimDefinition.additionalLocations.availabilityZones`

Availability Zones to use in this location (use at least two where supported).

- Required: No
- Type: array

### Parameter: `apimDefinition.additionalLocations.disableGateway`

Disables the gateway in this additional location.

- Required: No
- Type: bool

### Parameter: `apimDefinition.additionalLocations.natGatewayState`

Enables or disables NAT Gateway for this location.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Disabled'
    'Enabled'
  ]
  ```

### Parameter: `apimDefinition.additionalLocations.publicIpAddressResourceId`

Resource ID of a Standard Public IP to associate (where supported).

- Required: No
- Type: string

### Parameter: `apimDefinition.additionalLocations.virtualNetworkConfiguration`

Virtual network configuration for this location.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`subnetResourceId`](#parameter-apimdefinitionadditionallocationsvirtualnetworkconfigurationsubnetresourceid) | string | Subnet resource ID for the APIM deployment in this location. |

### Parameter: `apimDefinition.additionalLocations.virtualNetworkConfiguration.subnetResourceId`

Subnet resource ID for the APIM deployment in this location.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.certificate`

Certificates map that can be used by other flows (not directly by hostnameConfigurations).

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-apimdefinitioncertificate>any_other_property<) | object | Arbitrary key for each certificate entry. |

### Parameter: `apimDefinition.certificate.>Any_other_property<`

Arbitrary key for each certificate entry.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`encodedCertificate`](#parameter-apimdefinitioncertificate>any_other_property<encodedcertificate) | string | Base64-encoded PFX certificate. |
| [`storeName`](#parameter-apimdefinitioncertificate>any_other_property<storename) | string | Certificate store name (e.g., CertificateAuthority). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`certificatePassword`](#parameter-apimdefinitioncertificate>any_other_property<certificatepassword) | string | Password for the encoded certificate, if required. |

### Parameter: `apimDefinition.certificate.>Any_other_property<.encodedCertificate`

Base64-encoded PFX certificate.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.certificate.>Any_other_property<.storeName`

Certificate store name (e.g., CertificateAuthority).

- Required: Yes
- Type: string

### Parameter: `apimDefinition.certificate.>Any_other_property<.certificatePassword`

Password for the encoded certificate, if required.

- Required: No
- Type: string

### Parameter: `apimDefinition.hostnameConfigurations`

Hostname configuration array in AVM-friendly format.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`hostName`](#parameter-apimdefinitionhostnameconfigurationshostname) | string | DNS host name to bind to this endpoint. |
| [`type`](#parameter-apimdefinitionhostnameconfigurationstype) | string | Endpoint type for this binding. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`certificatePassword`](#parameter-apimdefinitionhostnameconfigurationscertificatepassword) | string | Password for the provided encoded certificate, if required. |
| [`defaultSslBinding`](#parameter-apimdefinitionhostnameconfigurationsdefaultsslbinding) | bool | Marks this binding as the default SSL binding for the endpoint type. |
| [`encodedCertificate`](#parameter-apimdefinitionhostnameconfigurationsencodedcertificate) | string | Base64-encoded PFX certificate to use when not referencing Key Vault. |
| [`identityClientId`](#parameter-apimdefinitionhostnameconfigurationsidentityclientid) | string | Client ID of the managed identity used to access Key Vault for this binding. |
| [`keyVaultId`](#parameter-apimdefinitionhostnameconfigurationskeyvaultid) | string | Key Vault secret ID containing the TLS certificate to use for this hostname. |
| [`negotiateClientCertificate`](#parameter-apimdefinitionhostnameconfigurationsnegotiateclientcertificate) | bool | Require/negotiates a client certificate during TLS handshake. |

### Parameter: `apimDefinition.hostnameConfigurations.hostName`

DNS host name to bind to this endpoint.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfigurations.type`

Endpoint type for this binding.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'DeveloperPortal'
    'Management'
    'Portal'
    'Proxy'
    'Scm'
  ]
  ```

### Parameter: `apimDefinition.hostnameConfigurations.certificatePassword`

Password for the provided encoded certificate, if required.

- Required: No
- Type: string

### Parameter: `apimDefinition.hostnameConfigurations.defaultSslBinding`

Marks this binding as the default SSL binding for the endpoint type.

- Required: No
- Type: bool

### Parameter: `apimDefinition.hostnameConfigurations.encodedCertificate`

Base64-encoded PFX certificate to use when not referencing Key Vault.

- Required: No
- Type: string

### Parameter: `apimDefinition.hostnameConfigurations.identityClientId`

Client ID of the managed identity used to access Key Vault for this binding.

- Required: No
- Type: string

### Parameter: `apimDefinition.hostnameConfigurations.keyVaultId`

Key Vault secret ID containing the TLS certificate to use for this hostname.

- Required: No
- Type: string

### Parameter: `apimDefinition.hostnameConfigurations.negotiateClientCertificate`

Require/negotiates a client certificate during TLS handshake.

- Required: No
- Type: bool

### Parameter: `apimDefinition.minApiVersion`

Minimum ARM API version to use for APIM control-plane operations.

- Required: No
- Type: string

### Parameter: `apimDefinition.name`

API Management service name.

- Required: No
- Type: string

### Parameter: `apimDefinition.notificationSenderEmail`

Sender email address used by APIM system notifications.

- Required: No
- Type: string

### Parameter: `apimDefinition.protocols`

Protocol options for the gateway.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enableHttp2`](#parameter-apimdefinitionprotocolsenablehttp2) | bool | Enables HTTP/2 for API traffic. |

### Parameter: `apimDefinition.protocols.enableHttp2`

Enables HTTP/2 for API traffic.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.roleAssignments`

Role assignments to create on the API Management service.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-apimdefinitionroleassignmentsprincipalid) | string | Principal ID to assign (objectId of user, group, or service principal). |
| [`principalType`](#parameter-apimdefinitionroleassignmentsprincipaltype) | string | Principal type of the assignment. |
| [`roleDefinitionIdOrName`](#parameter-apimdefinitionroleassignmentsroledefinitionidorname) | string | Role definition ID or role name to assign. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-apimdefinitionroleassignmentscondition) | string | Condition for the role assignment (for conditional access). |
| [`conditionVersion`](#parameter-apimdefinitionroleassignmentsconditionversion) | string | Condition version (only 2.0 supported). |
| [`delegatedManagedIdentityResourceId`](#parameter-apimdefinitionroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID (when applicable). |
| [`description`](#parameter-apimdefinitionroleassignmentsdescription) | string | Description for the role assignment. |
| [`name`](#parameter-apimdefinitionroleassignmentsname) | string | Name of the role assignment (GUID or custom). |

### Parameter: `apimDefinition.roleAssignments.principalId`

Principal ID to assign (objectId of user, group, or service principal).

- Required: Yes
- Type: string

### Parameter: `apimDefinition.roleAssignments.principalType`

Principal type of the assignment.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Device'
    'ForeignGroup'
    'Group'
    'ServicePrincipal'
    'User'
  ]
  ```

### Parameter: `apimDefinition.roleAssignments.roleDefinitionIdOrName`

Role definition ID or role name to assign.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.roleAssignments.condition`

Condition for the role assignment (for conditional access).

- Required: No
- Type: string

### Parameter: `apimDefinition.roleAssignments.conditionVersion`

Condition version (only 2.0 supported).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `apimDefinition.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID (when applicable).

- Required: No
- Type: string

### Parameter: `apimDefinition.roleAssignments.description`

Description for the role assignment.

- Required: No
- Type: string

### Parameter: `apimDefinition.roleAssignments.name`

Name of the role assignment (GUID or custom).

- Required: No
- Type: string

### Parameter: `apimDefinition.skuRoot`

SKU for API Management (Developer/Basic/Standard/Premium/Consumption/V2 variants).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Basic'
    'BasicV2'
    'Consumption'
    'Developer'
    'Premium'
    'Standard'
    'StandardV2'
  ]
  ```

### Parameter: `apimDefinition.tags`

Tags to apply to the API Management service.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-apimdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `apimDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.zones`

Availability Zones for the primary region (use at least two where supported).

- Required: No
- Type: array

### Parameter: `location`

Azure region for the primary location.

- Required: Yes
- Type: string

### Parameter: `name`

APIM resource name (usually your varApimName).

- Required: Yes
- Type: string

## Outputs

| Output | Type |
| :-- | :-- |
| `locationOut` | string |
| `nameOut` | string |
| `resourceId` | string |
