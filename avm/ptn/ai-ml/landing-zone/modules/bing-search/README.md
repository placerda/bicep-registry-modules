#  `[AiMl/LandingZoneModulesBingSearch]`


## Navigation

- [Resource Types](#Resource-Types)
- [Parameters](#Parameters)
- [Outputs](#Outputs)

## Resource Types

| Resource Type | API Version | References |
| :-- | :-- | :-- |
| `Microsoft.Bing/accounts` | 2025-05-01-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.bing_accounts.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates)</li></ul> |
| `Microsoft.CognitiveServices/accounts/connections` | 2025-06-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.cognitiveservices_accounts_connections.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.CognitiveServices/2025-06-01/accounts/connections)</li></ul> |

## Parameters

**Conditional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`account_name`](#parameter-account_name) | string | Required when `enableBingSearchConnection` is true. The name of the Azure Cognitive Services account to be used for the Bing Search tool. |
| [`bingConnectionName`](#parameter-bingconnectionname) | string | Required when `enableBingSearchConnection` is true. The name to assign to the Bing Search connection in the project. |
| [`bingSearchName`](#parameter-bingsearchname) | string | Required when `enableBingSearchConnection` is true. The name to assign to the Bing Search resource instance (used when creating a new account). |
| [`project_name`](#parameter-project_name) | string | Required when `enableBingSearchConnection` is true. The name of the Azure Cognitive Services Project. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`existingResourceId`](#parameter-existingresourceid) | string | Existing Bing Grounding account resource ID to reuse instead of creating a new one. |

### Parameter: `account_name`

Required when `enableBingSearchConnection` is true. The name of the Azure Cognitive Services account to be used for the Bing Search tool.

- Required: Yes
- Type: string

### Parameter: `bingConnectionName`

Required when `enableBingSearchConnection` is true. The name to assign to the Bing Search connection in the project.

- Required: No
- Type: string
- Default: `[format('{0}-connection', parameters('bingSearchName'))]`

### Parameter: `bingSearchName`

Required when `enableBingSearchConnection` is true. The name to assign to the Bing Search resource instance (used when creating a new account).

- Required: Yes
- Type: string

### Parameter: `project_name`

Required when `enableBingSearchConnection` is true. The name of the Azure Cognitive Services Project.

- Required: Yes
- Type: string

### Parameter: `existingResourceId`

Existing Bing Grounding account resource ID to reuse instead of creating a new one.

- Required: No
- Type: string
- Default: `''`

## Outputs

| Output | Type | Description |
| :-- | :-- | :-- |
| `bingConnectionId` | string | Connection ID path under the AI services project. |
| `resourceId` | string | Resource ID of the Bing Grounding account (created or reused). |
