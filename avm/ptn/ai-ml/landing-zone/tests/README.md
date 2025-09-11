#  `[AiMl/LandingZoneTests]`


## Navigation

- [Resource Types](#Resource-Types)
- [Usage examples](#Usage-examples)
- [Parameters](#Parameters)
- [Outputs](#Outputs)

## Resource Types

| Resource Type | API Version | References |
| :-- | :-- | :-- |
| `Microsoft.Authorization/locks` | 2020-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.authorization_locks.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Authorization/2020-05-01/locks)</li></ul> |
| `Microsoft.Authorization/roleAssignments` | 2022-04-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.authorization_roleassignments.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Authorization/2022-04-01/roleAssignments)</li></ul> |
| `Microsoft.Insights/diagnosticSettings` | 2021-05-01-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.insights_diagnosticsettings.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Insights/2021-05-01-preview/diagnosticSettings)</li></ul> |
| `Microsoft.Network/virtualNetworks` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_virtualnetworks.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-05-01/virtualNetworks)</li></ul> |
| `Microsoft.Network/virtualNetworks/subnets` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_virtualnetworks_subnets.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-05-01/virtualNetworks/subnets)</li></ul> |
| `Microsoft.Network/virtualNetworks/virtualNetworkPeerings` | 2024-01-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_virtualnetworks_virtualnetworkpeerings.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-01-01/virtualNetworks/virtualNetworkPeerings)</li></ul> |

## Usage examples

The following section provides usage examples for the module, which were used to validate and deploy the module successfully. For a full reference, please review the module's test folder in its repository.

>**Note**: Each example lists all the required parameters first, followed by the rest - each in alphabetical order.

>**Note**: To reference the module, please use the following syntax `br/public:avm/ptn/ai-ml/landing-zone/tests:<version>`.

- [Landing Zone - Defaults](#example-1-landing-zone---defaults)
- [Landing Zone - WAF Aligned](#example-2-landing-zone---waf-aligned)

### Example 1: _Landing Zone - Defaults_

Deploys the landing zone with defaults.


<details>

<summary>via Bicep module</summary>

```bicep
module landingZone 'br/public:avm/ptn/ai-ml/landing-zone/tests:<version>' = {
  name: 'landingZoneDeployment'
  params: {
    baseName: '<baseName>'
  }
}
```

</details>
<p>

<details>

<summary>via JSON parameters file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "baseName": {
      "value": "<baseName>"
    }
  }
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/ptn/ai-ml/landing-zone/tests:<version>'

param baseName = '<baseName>'
```

</details>
<p>

### Example 2: _Landing Zone - WAF Aligned_

Deploys the landing zone with WAF alignment.


<details>

<summary>via Bicep module</summary>

```bicep
module landingZone 'br/public:avm/ptn/ai-ml/landing-zone/tests:<version>' = {
  name: 'landingZoneDeployment'
  params: {
    baseName: '<baseName>'
  }
}
```

</details>
<p>

<details>

<summary>via JSON parameters file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "baseName": {
      "value": "<baseName>"
    }
  }
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/ptn/ai-ml/landing-zone/tests:<version>'

param baseName = '<baseName>'
```

</details>
<p>

## Parameters

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`baseName`](#parameter-basename) | string |  Base name to seed resource names; defaults to a 12-char token. |
| [`location`](#parameter-location) | string | Azure region for AI LZ resources. Defaults to the resource group location. |
| [`resourceToken`](#parameter-resourcetoken) | string |  Deterministic token for resource names; auto-generated if not provided. |

### Parameter: `baseName`

 Base name to seed resource names; defaults to a 12-char token.

- Required: No
- Type: string
- Default: `[substring(parameters('resourceToken'), 0, 12)]`

### Parameter: `location`

Azure region for AI LZ resources. Defaults to the resource group location.

- Required: No
- Type: string
- Default: `[resourceGroup().location]`

### Parameter: `resourceToken`

 Deterministic token for resource names; auto-generated if not provided.

- Required: No
- Type: string
- Default: `[toLower(uniqueString(subscription().id, resourceGroup().name, parameters('location')))]`

## Outputs

_None_
