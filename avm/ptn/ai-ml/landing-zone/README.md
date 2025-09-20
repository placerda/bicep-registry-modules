# AI/ML Landing Zone `[AiMl/LandingZone]`

Deploys a secure AI/ML landing zone (resource groups, networking, AI services, private endpoints, and guardrails) using AVM resource modules.

## Navigation

- [Resource Types](#Resource-Types)
- [Usage examples](#Usage-examples)
- [Parameters](#Parameters)
- [Outputs](#Outputs)
- [Cross-referenced modules](#Cross-referenced-modules)
- [Data Collection](#Data-Collection)

## Resource Types

| Resource Type | API Version | References |
| :-- | :-- | :-- |
| `Microsoft.ApiManagement/service` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.apimanagement_service.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2024-05-01/service)</li></ul> |
| `Microsoft.ApiManagement/service/apis` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.apimanagement_service_apis.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2024-05-01/service/apis)</li></ul> |
| `Microsoft.ApiManagement/service/apis/diagnostics` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.apimanagement_service_apis_diagnostics.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2024-05-01/service/apis/diagnostics)</li></ul> |
| `Microsoft.ApiManagement/service/apis/operations` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.apimanagement_service_apis_operations.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2024-05-01/service/apis/operations)</li></ul> |
| `Microsoft.ApiManagement/service/apis/operations/policies` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.apimanagement_service_apis_operations_policies.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2024-05-01/service/apis/operations/policies)</li></ul> |
| `Microsoft.ApiManagement/service/apis/policies` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.apimanagement_service_apis_policies.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2024-05-01/service/apis/policies)</li></ul> |
| `Microsoft.ApiManagement/service/apiVersionSets` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.apimanagement_service_apiversionsets.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2024-05-01/service/apiVersionSets)</li></ul> |
| `Microsoft.ApiManagement/service/authorizationServers` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.apimanagement_service_authorizationservers.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2024-05-01/service/authorizationServers)</li></ul> |
| `Microsoft.ApiManagement/service/backends` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.apimanagement_service_backends.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2024-05-01/service/backends)</li></ul> |
| `Microsoft.ApiManagement/service/caches` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.apimanagement_service_caches.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2024-05-01/service/caches)</li></ul> |
| `Microsoft.ApiManagement/service/identityProviders` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.apimanagement_service_identityproviders.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2024-05-01/service/identityProviders)</li></ul> |
| `Microsoft.ApiManagement/service/loggers` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.apimanagement_service_loggers.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2024-05-01/service/loggers)</li></ul> |
| `Microsoft.ApiManagement/service/namedValues` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.apimanagement_service_namedvalues.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2024-05-01/service/namedValues)</li></ul> |
| `Microsoft.ApiManagement/service/policies` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.apimanagement_service_policies.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2024-05-01/service/policies)</li></ul> |
| `Microsoft.ApiManagement/service/portalsettings` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.apimanagement_service_portalsettings.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2024-05-01/service/portalsettings)</li></ul> |
| `Microsoft.ApiManagement/service/products` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.apimanagement_service_products.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2024-05-01/service/products)</li></ul> |
| `Microsoft.ApiManagement/service/products/apis` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.apimanagement_service_products_apis.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2024-05-01/service/products/apis)</li></ul> |
| `Microsoft.ApiManagement/service/products/groups` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.apimanagement_service_products_groups.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2024-05-01/service/products/groups)</li></ul> |
| `Microsoft.ApiManagement/service/subscriptions` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.apimanagement_service_subscriptions.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2024-05-01/service/subscriptions)</li></ul> |
| `Microsoft.App/containerApps` | 2025-01-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.app_containerapps.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.App/2025-01-01/containerApps)</li></ul> |
| `Microsoft.App/containerApps/authConfigs` | 2025-01-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.app_containerapps_authconfigs.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.App/2025-01-01/containerApps/authConfigs)</li></ul> |
| `Microsoft.App/managedEnvironments` | 2024-10-02-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.app_managedenvironments.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.App/2024-10-02-preview/managedEnvironments)</li></ul> |
| `Microsoft.App/managedEnvironments/certificates` | 2024-10-02-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.app_managedenvironments_certificates.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.App/2024-10-02-preview/managedEnvironments/certificates)</li></ul> |
| `Microsoft.App/managedEnvironments/storages` | 2024-10-02-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.app_managedenvironments_storages.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.App/2024-10-02-preview/managedEnvironments/storages)</li></ul> |
| `Microsoft.AppConfiguration/configurationStores` | 2025-02-01-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.appconfiguration_configurationstores.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.AppConfiguration/2025-02-01-preview/configurationStores)</li></ul> |
| `Microsoft.AppConfiguration/configurationStores/keyValues` | 2025-02-01-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.appconfiguration_configurationstores_keyvalues.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.AppConfiguration/2025-02-01-preview/configurationStores/keyValues)</li></ul> |
| `Microsoft.AppConfiguration/configurationStores/replicas` | 2025-02-01-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.appconfiguration_configurationstores_replicas.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.AppConfiguration/2025-02-01-preview/configurationStores/replicas)</li></ul> |
| `Microsoft.Authorization/locks` | 2020-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.authorization_locks.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Authorization/2020-05-01/locks)</li></ul> |
| `Microsoft.Authorization/roleAssignments` | 2022-04-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.authorization_roleassignments.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Authorization/2022-04-01/roleAssignments)</li></ul> |
| `Microsoft.Automanage/configurationProfileAssignments` | 2022-05-04 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.automanage_configurationprofileassignments.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Automanage/2022-05-04/configurationProfileAssignments)</li></ul> |
| `Microsoft.Bing/accounts` | 2025-05-01-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.bing_accounts.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates)</li></ul> |
| `Microsoft.CognitiveServices/accounts` | 2025-06-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.cognitiveservices_accounts.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.CognitiveServices/2025-06-01/accounts)</li></ul> |
| `Microsoft.CognitiveServices/accounts/capabilityHosts` | 2025-04-01-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.cognitiveservices_accounts_capabilityhosts.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.CognitiveServices/2025-04-01-preview/accounts/capabilityHosts)</li></ul> |
| `Microsoft.CognitiveServices/accounts/commitmentPlans` | 2025-06-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.cognitiveservices_accounts_commitmentplans.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.CognitiveServices/2025-06-01/accounts/commitmentPlans)</li></ul> |
| `Microsoft.CognitiveServices/accounts/connections` | 2025-06-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.cognitiveservices_accounts_connections.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.CognitiveServices/2025-06-01/accounts/connections)</li></ul> |
| `Microsoft.CognitiveServices/accounts/deployments` | 2025-06-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.cognitiveservices_accounts_deployments.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.CognitiveServices/2025-06-01/accounts/deployments)</li></ul> |
| `Microsoft.CognitiveServices/accounts/projects` | 2025-04-01-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.cognitiveservices_accounts_projects.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.CognitiveServices/2025-04-01-preview/accounts/projects)</li></ul> |
| `Microsoft.CognitiveServices/accounts/projects/capabilityHosts` | 2025-04-01-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.cognitiveservices_accounts_projects_capabilityhosts.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.CognitiveServices/2025-04-01-preview/accounts/projects/capabilityHosts)</li></ul> |
| `Microsoft.CognitiveServices/accounts/projects/connections` | 2025-04-01-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.cognitiveservices_accounts_projects_connections.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.CognitiveServices/2025-04-01-preview/accounts/projects/connections)</li></ul> |
| `Microsoft.Compute/disks` | 2024-03-02 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.compute_disks.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Compute/2024-03-02/disks)</li></ul> |
| `Microsoft.Compute/virtualMachines` | 2024-07-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.compute_virtualmachines.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Compute/2024-07-01/virtualMachines)</li></ul> |
| `Microsoft.Compute/virtualMachines/extensions` | 2024-11-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.compute_virtualmachines_extensions.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Compute/2024-11-01/virtualMachines/extensions)</li></ul> |
| `Microsoft.ContainerRegistry/registries` | 2023-06-01-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.containerregistry_registries.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ContainerRegistry/2023-06-01-preview/registries)</li></ul> |
| `Microsoft.ContainerRegistry/registries/cacheRules` | 2023-06-01-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.containerregistry_registries_cacherules.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ContainerRegistry/2023-06-01-preview/registries/cacheRules)</li></ul> |
| `Microsoft.ContainerRegistry/registries/credentialSets` | 2023-11-01-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.containerregistry_registries_credentialsets.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ContainerRegistry/2023-11-01-preview/registries/credentialSets)</li></ul> |
| `Microsoft.ContainerRegistry/registries/replications` | 2023-06-01-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.containerregistry_registries_replications.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ContainerRegistry/2023-06-01-preview/registries/replications)</li></ul> |
| `Microsoft.ContainerRegistry/registries/scopeMaps` | 2023-06-01-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.containerregistry_registries_scopemaps.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ContainerRegistry/2023-06-01-preview/registries/scopeMaps)</li></ul> |
| `Microsoft.ContainerRegistry/registries/webhooks` | 2023-06-01-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.containerregistry_registries_webhooks.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ContainerRegistry/2023-06-01-preview/registries/webhooks)</li></ul> |
| `Microsoft.DevTestLab/schedules` | 2018-09-15 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.devtestlab_schedules.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DevTestLab/2018-09-15/schedules)</li></ul> |
| `Microsoft.DocumentDB/databaseAccounts` | 2024-11-15 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.documentdb_databaseaccounts.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DocumentDB/2024-11-15/databaseAccounts)</li></ul> |
| `Microsoft.DocumentDB/databaseAccounts/gremlinDatabases` | 2024-11-15 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.documentdb_databaseaccounts_gremlindatabases.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DocumentDB/2024-11-15/databaseAccounts/gremlinDatabases)</li></ul> |
| `Microsoft.DocumentDB/databaseAccounts/gremlinDatabases/graphs` | 2024-11-15 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.documentdb_databaseaccounts_gremlindatabases_graphs.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DocumentDB/2024-11-15/databaseAccounts/gremlinDatabases/graphs)</li></ul> |
| `Microsoft.DocumentDB/databaseAccounts/mongodbDatabases` | 2024-11-15 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.documentdb_databaseaccounts_mongodbdatabases.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DocumentDB/2024-11-15/databaseAccounts/mongodbDatabases)</li></ul> |
| `Microsoft.DocumentDB/databaseAccounts/mongodbDatabases/collections` | 2024-11-15 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.documentdb_databaseaccounts_mongodbdatabases_collections.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DocumentDB/2024-11-15/databaseAccounts/mongodbDatabases/collections)</li></ul> |
| `Microsoft.DocumentDB/databaseAccounts/sqlDatabases` | 2024-11-15 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.documentdb_databaseaccounts_sqldatabases.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DocumentDB/2024-11-15/databaseAccounts/sqlDatabases)</li></ul> |
| `Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers` | 2024-11-15 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.documentdb_databaseaccounts_sqldatabases_containers.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DocumentDB/2024-11-15/databaseAccounts/sqlDatabases/containers)</li></ul> |
| `Microsoft.DocumentDB/databaseAccounts/sqlRoleAssignments` | 2024-11-15 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.documentdb_databaseaccounts_sqlroleassignments.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DocumentDB/2024-11-15/databaseAccounts/sqlRoleAssignments)</li></ul> |
| `Microsoft.DocumentDB/databaseAccounts/sqlRoleAssignments` | 2025-04-15 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.documentdb_databaseaccounts_sqlroleassignments.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DocumentDB/2025-04-15/databaseAccounts/sqlRoleAssignments)</li></ul> |
| `Microsoft.DocumentDB/databaseAccounts/sqlRoleDefinitions` | 2024-11-15 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.documentdb_databaseaccounts_sqlroledefinitions.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DocumentDB/2024-11-15/databaseAccounts/sqlRoleDefinitions)</li></ul> |
| `Microsoft.DocumentDB/databaseAccounts/tables` | 2024-11-15 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.documentdb_databaseaccounts_tables.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DocumentDB/2024-11-15/databaseAccounts/tables)</li></ul> |
| `Microsoft.GuestConfiguration/guestConfigurationAssignments` | 2024-04-05 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.guestconfiguration_guestconfigurationassignments.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.GuestConfiguration/2024-04-05/guestConfigurationAssignments)</li></ul> |
| `Microsoft.Insights/components` | 2020-02-02 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.insights_components.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Insights/2020-02-02/components)</li></ul> |
| `microsoft.insights/components/linkedStorageAccounts` | 2020-03-01-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.insights_components_linkedstorageaccounts.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/microsoft.insights/2020-03-01-preview/components/linkedStorageAccounts)</li></ul> |
| `Microsoft.Insights/dataCollectionRuleAssociations` | 2023-03-11 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.insights_datacollectionruleassociations.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Insights/2023-03-11/dataCollectionRuleAssociations)</li></ul> |
| `Microsoft.Insights/diagnosticSettings` | 2021-05-01-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.insights_diagnosticsettings.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Insights/2021-05-01-preview/diagnosticSettings)</li></ul> |
| `Microsoft.KeyVault/vaults` | 2024-11-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.keyvault_vaults.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.KeyVault/2024-11-01/vaults)</li></ul> |
| `Microsoft.KeyVault/vaults/accessPolicies` | 2023-07-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.keyvault_vaults_accesspolicies.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.KeyVault/2023-07-01/vaults/accessPolicies)</li></ul> |
| `Microsoft.KeyVault/vaults/accessPolicies` | 2024-11-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.keyvault_vaults_accesspolicies.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.KeyVault/2024-11-01/vaults/accessPolicies)</li></ul> |
| `Microsoft.KeyVault/vaults/keys` | 2024-11-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.keyvault_vaults_keys.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.KeyVault/2024-11-01/vaults/keys)</li></ul> |
| `Microsoft.KeyVault/vaults/secrets` | 2024-11-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.keyvault_vaults_secrets.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.KeyVault/2024-11-01/vaults/secrets)</li></ul> |
| `Microsoft.Maintenance/configurationAssignments` | 2023-04-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.maintenance_configurationassignments.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Maintenance/2023-04-01/configurationAssignments)</li></ul> |
| `Microsoft.Maintenance/maintenanceConfigurations` | 2023-04-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.maintenance_maintenanceconfigurations.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Maintenance/2023-04-01/maintenanceConfigurations)</li></ul> |
| `Microsoft.Network/applicationGateways` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_applicationgateways.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-05-01/applicationGateways)</li></ul> |
| `Microsoft.Network/ApplicationGatewayWebApplicationFirewallPolicies` | 2024-03-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_applicationgatewaywebapplicationfirewallpolicies.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-03-01/ApplicationGatewayWebApplicationFirewallPolicies)</li></ul> |
| `Microsoft.Network/azureFirewalls` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_azurefirewalls.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-05-01/azureFirewalls)</li></ul> |
| `Microsoft.Network/firewallPolicies` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_firewallpolicies.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-05-01/firewallPolicies)</li></ul> |
| `Microsoft.Network/firewallPolicies/ruleCollectionGroups` | 2023-04-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_firewallpolicies_rulecollectiongroups.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2023-04-01/firewallPolicies/ruleCollectionGroups)</li></ul> |
| `Microsoft.Network/networkInterfaces` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_networkinterfaces.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-05-01/networkInterfaces)</li></ul> |
| `Microsoft.Network/networkSecurityGroups` | 2023-11-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_networksecuritygroups.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2023-11-01/networkSecurityGroups)</li></ul> |
| `Microsoft.Network/privateDnsZones` | 2020-06-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_privatednszones.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones)</li></ul> |
| `Microsoft.Network/privateDnsZones/A` | 2020-06-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_privatednszones_a.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/A)</li></ul> |
| `Microsoft.Network/privateDnsZones/AAAA` | 2020-06-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_privatednszones_aaaa.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/AAAA)</li></ul> |
| `Microsoft.Network/privateDnsZones/CNAME` | 2020-06-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_privatednszones_cname.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/CNAME)</li></ul> |
| `Microsoft.Network/privateDnsZones/MX` | 2020-06-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_privatednszones_mx.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/MX)</li></ul> |
| `Microsoft.Network/privateDnsZones/PTR` | 2020-06-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_privatednszones_ptr.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/PTR)</li></ul> |
| `Microsoft.Network/privateDnsZones/SOA` | 2020-06-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_privatednszones_soa.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/SOA)</li></ul> |
| `Microsoft.Network/privateDnsZones/SRV` | 2020-06-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_privatednszones_srv.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/SRV)</li></ul> |
| `Microsoft.Network/privateDnsZones/TXT` | 2020-06-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_privatednszones_txt.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/TXT)</li></ul> |
| `Microsoft.Network/privateDnsZones/virtualNetworkLinks` | 2024-06-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_privatednszones_virtualnetworklinks.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-06-01/privateDnsZones/virtualNetworkLinks)</li></ul> |
| `Microsoft.Network/privateEndpoints` | 2023-11-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_privateendpoints.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2023-11-01/privateEndpoints)</li></ul> |
| `Microsoft.Network/privateEndpoints` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_privateendpoints.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-05-01/privateEndpoints)</li></ul> |
| `Microsoft.Network/privateEndpoints/privateDnsZoneGroups` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_privateendpoints_privatednszonegroups.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-05-01/privateEndpoints/privateDnsZoneGroups)</li></ul> |
| `Microsoft.Network/privateEndpoints/privateDnsZoneGroups` | 2023-11-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_privateendpoints_privatednszonegroups.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2023-11-01/privateEndpoints/privateDnsZoneGroups)</li></ul> |
| `Microsoft.Network/publicIPAddresses` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_publicipaddresses.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-05-01/publicIPAddresses)</li></ul> |
| `Microsoft.Network/virtualNetworks` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_virtualnetworks.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-05-01/virtualNetworks)</li></ul> |
| `Microsoft.Network/virtualNetworks/subnets` | 2024-05-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_virtualnetworks_subnets.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-05-01/virtualNetworks/subnets)</li></ul> |
| `Microsoft.Network/virtualNetworks/virtualNetworkPeerings` | 2024-01-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.network_virtualnetworks_virtualnetworkpeerings.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-01-01/virtualNetworks/virtualNetworkPeerings)</li></ul> |
| `Microsoft.OperationalInsights/workspaces` | 2025-02-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.operationalinsights_workspaces.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.OperationalInsights/2025-02-01/workspaces)</li></ul> |
| `Microsoft.OperationalInsights/workspaces/dataExports` | 2025-02-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.operationalinsights_workspaces_dataexports.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.OperationalInsights/2025-02-01/workspaces/dataExports)</li></ul> |
| `Microsoft.OperationalInsights/workspaces/dataSources` | 2025-02-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.operationalinsights_workspaces_datasources.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.OperationalInsights/2025-02-01/workspaces/dataSources)</li></ul> |
| `Microsoft.OperationalInsights/workspaces/linkedServices` | 2025-02-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.operationalinsights_workspaces_linkedservices.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.OperationalInsights/2025-02-01/workspaces/linkedServices)</li></ul> |
| `Microsoft.OperationalInsights/workspaces/linkedStorageAccounts` | 2025-02-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.operationalinsights_workspaces_linkedstorageaccounts.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.OperationalInsights/2025-02-01/workspaces/linkedStorageAccounts)</li></ul> |
| `Microsoft.OperationalInsights/workspaces/savedSearches` | 2025-02-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.operationalinsights_workspaces_savedsearches.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.OperationalInsights/2025-02-01/workspaces/savedSearches)</li></ul> |
| `Microsoft.OperationalInsights/workspaces/storageInsightConfigs` | 2025-02-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.operationalinsights_workspaces_storageinsightconfigs.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.OperationalInsights/2025-02-01/workspaces/storageInsightConfigs)</li></ul> |
| `Microsoft.OperationalInsights/workspaces/tables` | 2025-02-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.operationalinsights_workspaces_tables.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.OperationalInsights/2025-02-01/workspaces/tables)</li></ul> |
| `Microsoft.OperationsManagement/solutions` | 2015-11-01-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.operationsmanagement_solutions.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.OperationsManagement/2015-11-01-preview/solutions)</li></ul> |
| `Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems` | 2025-02-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.recoveryservices_vaults_backupfabrics_protectioncontainers_protecteditems.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.RecoveryServices/2025-02-01/vaults/backupFabrics/protectionContainers/protectedItems)</li></ul> |
| `Microsoft.Resources/deploymentScripts` | 2023-08-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.resources_deploymentscripts.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Resources/2023-08-01/deploymentScripts)</li></ul> |
| `Microsoft.Search/searchServices` | 2025-02-01-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.search_searchservices.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Search/2025-02-01-preview/searchServices)</li></ul> |
| `Microsoft.Search/searchServices/sharedPrivateLinkResources` | 2025-02-01-preview | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.search_searchservices_sharedprivatelinkresources.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Search/2025-02-01-preview/searchServices/sharedPrivateLinkResources)</li></ul> |
| `Microsoft.SecurityInsights/onboardingStates` | 2024-03-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.securityinsights_onboardingstates.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.SecurityInsights/2024-03-01/onboardingStates)</li></ul> |
| `Microsoft.Storage/storageAccounts` | 2024-01-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.storage_storageaccounts.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts)</li></ul> |
| `Microsoft.Storage/storageAccounts/blobServices` | 2024-01-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.storage_storageaccounts_blobservices.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts/blobServices)</li></ul> |
| `Microsoft.Storage/storageAccounts/blobServices/containers` | 2024-01-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.storage_storageaccounts_blobservices_containers.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts/blobServices/containers)</li></ul> |
| `Microsoft.Storage/storageAccounts/blobServices/containers/immutabilityPolicies` | 2024-01-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.storage_storageaccounts_blobservices_containers_immutabilitypolicies.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts/blobServices/containers/immutabilityPolicies)</li></ul> |
| `Microsoft.Storage/storageAccounts/fileServices` | 2024-01-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.storage_storageaccounts_fileservices.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts/fileServices)</li></ul> |
| `Microsoft.Storage/storageAccounts/fileServices/shares` | 2024-01-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.storage_storageaccounts_fileservices_shares.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts/fileServices/shares)</li></ul> |
| `Microsoft.Storage/storageAccounts/localUsers` | 2024-01-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.storage_storageaccounts_localusers.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts/localUsers)</li></ul> |
| `Microsoft.Storage/storageAccounts/managementPolicies` | 2024-01-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.storage_storageaccounts_managementpolicies.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts/managementPolicies)</li></ul> |
| `Microsoft.Storage/storageAccounts/queueServices` | 2024-01-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.storage_storageaccounts_queueservices.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts/queueServices)</li></ul> |
| `Microsoft.Storage/storageAccounts/queueServices/queues` | 2024-01-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.storage_storageaccounts_queueservices_queues.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts/queueServices/queues)</li></ul> |
| `Microsoft.Storage/storageAccounts/tableServices` | 2024-01-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.storage_storageaccounts_tableservices.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts/tableServices)</li></ul> |
| `Microsoft.Storage/storageAccounts/tableServices/tables` | 2024-01-01 | <ul style="padding-left: 0px;"><li>[AzAdvertizer](https://www.azadvertizer.net/azresourcetypes/microsoft.storage_storageaccounts_tableservices_tables.html)</li><li>[Template reference](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts/tableServices/tables)</li></ul> |

## Usage examples

The following section provides usage examples for the module, which were used to validate and deploy the module successfully. For a full reference, please review the module's test folder in its repository.

>**Note**: Each example lists all the required parameters first, followed by the rest - each in alphabetical order.

>**Note**: To reference the module, please use the following syntax `br/public:avm/ptn/ai-ml/landing-zone:<version>`.

- [Landing Zone - Defaults](#example-1-landing-zone---defaults)
- [Landing Zone - WAF Aligned](#example-2-landing-zone---waf-aligned)

### Example 1: _Landing Zone - Defaults_

Deploys the landing zone with defaults.


<details>

<summary>via Bicep module</summary>

```bicep
module landingZone 'br/public:avm/ptn/ai-ml/landing-zone:<version>' = {
  name: 'landingZoneDeployment'
  params: {
    aiFoundryDefinition: {
      aiFoundryConfiguration: {
        createCapabilityHosts: false
      }
      aiModelDeployments: []
      includeAssociatedResources: false
    }
    baseName: '<baseName>'
    location: '<location>'
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
    "aiFoundryDefinition": {
      "value": {
        "aiFoundryConfiguration": {
          "createCapabilityHosts": false
        },
        "aiModelDeployments": [],
        "includeAssociatedResources": false
      }
    },
    "baseName": {
      "value": "<baseName>"
    },
    "location": {
      "value": "<location>"
    }
  }
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/ptn/ai-ml/landing-zone:<version>'

param aiFoundryDefinition = {
  aiFoundryConfiguration: {
    createCapabilityHosts: false
  }
  aiModelDeployments: []
  includeAssociatedResources: false
}
param baseName = '<baseName>'
param location = '<location>'
```

</details>
<p>

### Example 2: _Landing Zone - WAF Aligned_

Deploys the landing zone with WAF alignment.


<details>

<summary>via Bicep module</summary>

```bicep
module landingZone 'br/public:avm/ptn/ai-ml/landing-zone:<version>' = {
  name: 'landingZoneDeployment'
  params: {
    aiFoundryDefinition: {
      aiFoundryConfiguration: {
        createCapabilityHosts: true
      }
      aiModelDeployments: [
        {
          model: {
            format: 'OpenAI'
            name: 'gpt-4o'
            version: '2024-11-20'
          }
          name: 'gpt-4o'
          sku: {
            capacity: 1
            name: 'Standard'
          }
        }
      ]
      aiSearchConfiguration: {}
      cosmosDbConfiguration: {}
      includeAssociatedResources: true
      keyVaultConfiguration: {}
      lock: {
        kind: 'None'
        name: ''
      }
      storageAccountConfiguration: {}
    }
    baseName: '<baseName>'
    jumpVmAdminPassword: '<StrongP@ssw0rd!>'
    location: '<location>'
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
    "aiFoundryDefinition": {
      "value": {
        "aiFoundryConfiguration": {
          "createCapabilityHosts": true
        },
        "aiModelDeployments": [
          {
            "model": {
              "format": "OpenAI",
              "name": "gpt-4o",
              "version": "2024-11-20"
            },
            "name": "gpt-4o",
            "sku": {
              "capacity": 1,
              "name": "Standard"
            }
          }
        ],
        "aiSearchConfiguration": {},
        "cosmosDbConfiguration": {},
        "includeAssociatedResources": true,
        "keyVaultConfiguration": {},
        "lock": {
          "kind": "None",
          "name": ""
        },
        "storageAccountConfiguration": {}
      }
    },
    "baseName": {
      "value": "<baseName>"
    },
    "jumpVmAdminPassword": {
      "value": "<StrongP@ssw0rd!>"
    },
    "location": {
      "value": "<location>"
    }
  }
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/ptn/ai-ml/landing-zone:<version>'

param aiFoundryDefinition = {
  aiFoundryConfiguration: {
    createCapabilityHosts: true
  }
  aiModelDeployments: [
    {
      model: {
        format: 'OpenAI'
        name: 'gpt-4o'
        version: '2024-11-20'
      }
      name: 'gpt-4o'
      sku: {
        capacity: 1
        name: 'Standard'
      }
    }
  ]
  aiSearchConfiguration: {}
  cosmosDbConfiguration: {}
  includeAssociatedResources: true
  keyVaultConfiguration: {}
  lock: {
    kind: 'None'
    name: ''
  }
  storageAccountConfiguration: {}
}
param baseName = '<baseName>'
param jumpVmAdminPassword = '<StrongP@ssw0rd!>'
param location = '<location>'
```

</details>
<p>

## Parameters

**Conditional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`apimDefinition`](#parameter-apimdefinition) | object | API Management configuration. Required if deployToggles.apiManagement is true and resourceIds.apimServiceResourceId is empty. |
| [`appConfigurationDefinition`](#parameter-appconfigurationdefinition) | object | App Configuration store settings. Required if deployGenAiAppBackingServices is true, deployToggles.appConfig is true, and resourceIds.appConfigResourceId is empty. |
| [`appGatewayDefinition`](#parameter-appgatewaydefinition) | object | Application Gateway configuration. Required if deployToggles.applicationGateway is true and resourceIds.applicationGatewayResourceId is empty. |
| [`appGatewayPublicIpDefinition`](#parameter-appgatewaypublicipdefinition) | object | Public IP configuration for the Application Gateway. Required if deployToggles.applicationGateway is true and resourceIds.applicationGatewayResourceId is empty and a public frontend is being created. |
| [`appInsightsDefinition`](#parameter-appinsightsdefinition) | object | Application Insights configuration. Required if deployToggles.appInsights is true and resourceIds.appInsightsResourceId is empty; a Log Analytics workspace must exist or be deployed. |
| [`buildVmDefinition`](#parameter-buildvmdefinition) | object | Build VM configuration to support CI/CD workers (Linux). Required if deployToggles.buildVm is true and you intend to deploy the Build VM. |
| [`buildVmMaintenanceDefinition`](#parameter-buildvmmaintenancedefinition) | object | Jump (bastion) VM Maintenance Definition (Windows). Required if deployToggles.jumpVm is true. |
| [`containerAppEnvDefinition`](#parameter-containerappenvdefinition) | object | Container Apps Environment configuration. Required if deployGenAiAppBackingServices is true, deployToggles.containerEnv is true, and resourceIds.containerEnvResourceId is empty. |
| [`containerRegistryDefinition`](#parameter-containerregistrydefinition) | object | Container Registry configuration. Required if deployGenAiAppBackingServices is true, deployToggles.containerRegistry is true, and resourceIds.containerRegistryResourceId is empty. |
| [`cosmosDbDefinition`](#parameter-cosmosdbdefinition) | object | Cosmos DB account configuration for the GenAI app. Required if deployGenAiAppBackingServices is true, deployToggles.cosmosDb is true, and resourceIds.dbAccountResourceId is empty. |
| [`firewallDefinition`](#parameter-firewalldefinition) | object | Azure Firewall configuration. Required if deployToggles.firewall is true and resourceIds.firewallResourceId is empty. |
| [`firewallPolicyDefinition`](#parameter-firewallpolicydefinition) | object | Azure Firewall Policy configuration. Required if deployToggles.firewall is true and resourceIds.firewallPolicyResourceId is empty. |
| [`groundingWithBingDefinition`](#parameter-groundingwithbingdefinition) | object | Grounding with Bing configuration. Required if deployToggles.groundingWithBingSearch is true and resourceIds.groundingServiceResourceId is empty. |
| [`hubVnetPeeringDefinition`](#parameter-hubvnetpeeringdefinition) | object | Hub VNet peering configuration. Required if you plan to establish hub-spoke peering. |
| [`jumpVmAdminPassword`](#parameter-jumpvmadminpassword) | securestring | Local admin password for the Windows JumpVM. Required if deployToggles.jumpVm is true. |
| [`jumpVmDefinition`](#parameter-jumpvmdefinition) | object | Jump (bastion) VM configuration (Windows). Required if deployToggles.jumpVm is true. |
| [`jumpVmMaintenanceDefinition`](#parameter-jumpvmmaintenancedefinition) | object | Jump (bastion) VM Maintenance Definition (Windows). Required if deployToggles.jumpVm is true. |
| [`keyVaultDefinition`](#parameter-keyvaultdefinition) | object | Key Vault configuration for the GenAI app. Required if deployGenAiAppBackingServices is true, deployToggles.keyVault is true, and resourceIds.keyVaultResourceId is empty. |
| [`logAnalyticsDefinition`](#parameter-loganalyticsdefinition) | object | Log Analytics Workspace configuration. Required if deployToggles.logAnalytics is true and resourceIds.logAnalyticsWorkspaceResourceId is empty. |
| [`privateDnsZonesDefinition`](#parameter-privatednszonesdefinition) | object | Existing Private DNS Zone resource IDs per service. Required if you plan to reuse existing zones for any service. |
| [`searchDefinition`](#parameter-searchdefinition) | object | Azure AI Search configuration for the GenAI app. Required if deployGenAiAppBackingServices is true, deployToggles.searchService is true, and resourceIds.searchServiceResourceId is empty. |
| [`storageAccountDefinition`](#parameter-storageaccountdefinition) | object | Storage Account configuration for the GenAI app. Required if deployGenAiAppBackingServices is true, deployToggles.storageAccount is true, and resourceIds.storageAccountResourceId is empty. |
| [`subnetsNamesDefinition`](#parameter-subnetsnamesdefinition) | object | Subnet names configuration. Required if you want to use names different than the defaults names for the subnets. |
| [`vNetDefinition`](#parameter-vnetdefinition) | object | Virtual Network configuration. Required if deployToggles.virtualNetwork is true and resourceIds.virtualNetworkResourceId is empty. |
| [`wafPolicyDefinition`](#parameter-wafpolicydefinition) | object | Web Application Firewall (WAF) policy configuration. Required if deployToggles.wafPolicy is true and you are deploying Application Gateway via this template. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`aiFoundryDefinition`](#parameter-aifoundrydefinition) | object | AI Foundry project configuration (account/project, networking, associated resources, and deployments). |
| [`azdoPat`](#parameter-azdopat) | securestring | PAT used to register the Azure DevOps agent (when runner = azdo). |
| [`baseName`](#parameter-basename) | string |  Base name to seed resource names; defaults to a 12-char token. |
| [`containerAppsList`](#parameter-containerappslist) | array | List of Container Apps to create. |
| [`deployToggles`](#parameter-deploytoggles) | object |  Per-service deployment toggles; set false to skip creating a service. Reuse still works via resourceIds. |
| [`enableTelemetry`](#parameter-enabletelemetry) | bool | Enable/Disable usage telemetry for module. |
| [`flagPlatformLandingZone`](#parameter-flagplatformlandingzone) | bool |  Enable platform landing zone integration. |
| [`githubPat`](#parameter-githubpat) | securestring | PAT used to request a GitHub runner registration token (when runner = github). |
| [`location`](#parameter-location) | string | Azure region for AI LZ resources. Defaults to the resource group location. |
| [`nsgDefinitions`](#parameter-nsgdefinitions) | object | NSG definitions per subnet role; each entry deploys an NSG for that subnet when a non-empty name is provided. |
| [`resourceIds`](#parameter-resourceids) | object |  Existing resource IDs to reuse; leave empty to create new resources. |
| [`resourceToken`](#parameter-resourcetoken) | string |  Deterministic token for resource names; auto-generated if not provided. |
| [`tags`](#parameter-tags) | object |  Tags applied to all deployed resources. |

### Parameter: `apimDefinition`

API Management configuration. Required if deployToggles.apiManagement is true and resourceIds.apimServiceResourceId is empty.

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      name: ''
      publisherEmail: 'admin@example.com'
      publisherName: 'Contoso'
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-apimdefinitionname) | string | Name of the API Management service. |
| [`publisherEmail`](#parameter-apimdefinitionpublisheremail) | string | Publisher email address. |
| [`publisherName`](#parameter-apimdefinitionpublishername) | string | Publisher display name. |

**Conditional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`skuCapacity`](#parameter-apimdefinitionskucapacity) | int | SKU capacity. Required if SKU is not Consumption. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`additionalLocations`](#parameter-apimdefinitionadditionallocations) | array | Additional locations for the API Management service. |
| [`apiDiagnostics`](#parameter-apimdefinitionapidiagnostics) | array | API diagnostics for APIs. |
| [`apis`](#parameter-apimdefinitionapis) | array | APIs to create in the API Management service. |
| [`apiVersionSets`](#parameter-apimdefinitionapiversionsets) | array | API version sets to configure. |
| [`authorizationServers`](#parameter-apimdefinitionauthorizationservers) | array | Authorization servers to configure. |
| [`availabilityZones`](#parameter-apimdefinitionavailabilityzones) | array | Availability Zones for HA deployment. |
| [`backends`](#parameter-apimdefinitionbackends) | array | Backends to configure. |
| [`caches`](#parameter-apimdefinitioncaches) | array | Caches to configure. |
| [`certificates`](#parameter-apimdefinitioncertificates) | array | Certificates to configure for API Management. Maximum of 10 certificates. |
| [`customProperties`](#parameter-apimdefinitioncustomproperties) | object | Custom properties to configure. |
| [`diagnosticSettings`](#parameter-apimdefinitiondiagnosticsettings) | array | Diagnostic settings for the API Management service. |
| [`disableGateway`](#parameter-apimdefinitiondisablegateway) | bool | Disable gateway in a region (for multi-region setup). |
| [`enableClientCertificate`](#parameter-apimdefinitionenableclientcertificate) | bool | Enable client certificate for requests (Consumption SKU only). |
| [`enableDeveloperPortal`](#parameter-apimdefinitionenabledeveloperportal) | bool | Enable developer portal for the service. |
| [`enableTelemetry`](#parameter-apimdefinitionenabletelemetry) | bool | Enable/disable usage telemetry for module. Default is true. |
| [`hostnameConfigurations`](#parameter-apimdefinitionhostnameconfigurations) | array | Hostname configurations for the API Management service. |
| [`identityProviders`](#parameter-apimdefinitionidentityproviders) | array | Identity providers to configure. |
| [`location`](#parameter-apimdefinitionlocation) | string | Location for the API Management service. Default is resourceGroup().location. |
| [`lock`](#parameter-apimdefinitionlock) | object | Lock settings for the API Management service. |
| [`loggers`](#parameter-apimdefinitionloggers) | array | Loggers to configure. |
| [`managedIdentities`](#parameter-apimdefinitionmanagedidentities) | object | Managed identity settings for the API Management service. |
| [`minApiVersion`](#parameter-apimdefinitionminapiversion) | string | Minimum ARM API version to use for control-plane operations. |
| [`namedValues`](#parameter-apimdefinitionnamedvalues) | array | Named values to configure. |
| [`newGuidValue`](#parameter-apimdefinitionnewguidvalue) | string | Helper for generating new GUID values. |
| [`notificationSenderEmail`](#parameter-apimdefinitionnotificationsenderemail) | string | Notification sender email address. |
| [`policies`](#parameter-apimdefinitionpolicies) | array | Policies to configure. |
| [`portalsettings`](#parameter-apimdefinitionportalsettings) | array | Portal settings for the developer portal. Allowed names: signin, signup, delegation. |
| [`products`](#parameter-apimdefinitionproducts) | array | Products to configure. |
| [`publicIpAddressResourceId`](#parameter-apimdefinitionpublicipaddressresourceid) | string | Public IP address resource ID for API Management. |
| [`restore`](#parameter-apimdefinitionrestore) | bool | Restore configuration for undeleting API Management services. |
| [`roleAssignments`](#parameter-apimdefinitionroleassignments) | array | Role assignments for the API Management service. |
| [`sku`](#parameter-apimdefinitionsku) | string | SKU of the API Management service. Allowed values: Consumption, Developer, Basic, Standard, Premium. |
| [`subnetResourceId`](#parameter-apimdefinitionsubnetresourceid) | string | Subnet resource ID for VNet integration. |
| [`subscriptions`](#parameter-apimdefinitionsubscriptions) | array | Subscriptions to configure. |
| [`tags`](#parameter-apimdefinitiontags) | object | Tags to apply to the API Management service. |
| [`virtualNetworkType`](#parameter-apimdefinitionvirtualnetworktype) | string | Virtual network type. Allowed values: None, External, Internal. |

### Parameter: `apimDefinition.name`

Name of the API Management service.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.publisherEmail`

Publisher email address.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.publisherName`

Publisher display name.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.skuCapacity`

SKU capacity. Required if SKU is not Consumption.

- Required: No
- Type: int

### Parameter: `apimDefinition.additionalLocations`

Additional locations for the API Management service.

- Required: No
- Type: array

### Parameter: `apimDefinition.apiDiagnostics`

API diagnostics for APIs.

- Required: No
- Type: array

### Parameter: `apimDefinition.apis`

APIs to create in the API Management service.

- Required: No
- Type: array

### Parameter: `apimDefinition.apiVersionSets`

API version sets to configure.

- Required: No
- Type: array

### Parameter: `apimDefinition.authorizationServers`

Authorization servers to configure.

- Required: No
- Type: array

### Parameter: `apimDefinition.availabilityZones`

Availability Zones for HA deployment.

- Required: No
- Type: array

### Parameter: `apimDefinition.backends`

Backends to configure.

- Required: No
- Type: array

### Parameter: `apimDefinition.caches`

Caches to configure.

- Required: No
- Type: array

### Parameter: `apimDefinition.certificates`

Certificates to configure for API Management. Maximum of 10 certificates.

- Required: No
- Type: array

### Parameter: `apimDefinition.customProperties`

Custom properties to configure.

- Required: No
- Type: object

### Parameter: `apimDefinition.diagnosticSettings`

Diagnostic settings for the API Management service.

- Required: No
- Type: array

### Parameter: `apimDefinition.disableGateway`

Disable gateway in a region (for multi-region setup).

- Required: No
- Type: bool

### Parameter: `apimDefinition.enableClientCertificate`

Enable client certificate for requests (Consumption SKU only).

- Required: No
- Type: bool

### Parameter: `apimDefinition.enableDeveloperPortal`

Enable developer portal for the service.

- Required: No
- Type: bool

### Parameter: `apimDefinition.enableTelemetry`

Enable/disable usage telemetry for module. Default is true.

- Required: No
- Type: bool

### Parameter: `apimDefinition.hostnameConfigurations`

Hostname configurations for the API Management service.

- Required: No
- Type: array

### Parameter: `apimDefinition.identityProviders`

Identity providers to configure.

- Required: No
- Type: array

### Parameter: `apimDefinition.location`

Location for the API Management service. Default is resourceGroup().location.

- Required: No
- Type: string

### Parameter: `apimDefinition.lock`

Lock settings for the API Management service.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-apimdefinitionlockkind) | string | Type of lock. Allowed values: CanNotDelete, None, ReadOnly. |
| [`name`](#parameter-apimdefinitionlockname) | string | Name of the lock. |
| [`notes`](#parameter-apimdefinitionlocknotes) | string | Notes for the lock. |

### Parameter: `apimDefinition.lock.kind`

Type of lock. Allowed values: CanNotDelete, None, ReadOnly.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `apimDefinition.lock.name`

Name of the lock.

- Required: No
- Type: string

### Parameter: `apimDefinition.lock.notes`

Notes for the lock.

- Required: No
- Type: string

### Parameter: `apimDefinition.loggers`

Loggers to configure.

- Required: No
- Type: array

### Parameter: `apimDefinition.managedIdentities`

Managed identity settings for the API Management service.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`systemAssigned`](#parameter-apimdefinitionmanagedidentitiessystemassigned) | bool | Enables system-assigned managed identity. |
| [`userAssignedResourceIds`](#parameter-apimdefinitionmanagedidentitiesuserassignedresourceids) | array | User-assigned identity resource IDs. |

### Parameter: `apimDefinition.managedIdentities.systemAssigned`

Enables system-assigned managed identity.

- Required: No
- Type: bool

### Parameter: `apimDefinition.managedIdentities.userAssignedResourceIds`

User-assigned identity resource IDs.

- Required: No
- Type: array

### Parameter: `apimDefinition.minApiVersion`

Minimum ARM API version to use for control-plane operations.

- Required: No
- Type: string

### Parameter: `apimDefinition.namedValues`

Named values to configure.

- Required: No
- Type: array

### Parameter: `apimDefinition.newGuidValue`

Helper for generating new GUID values.

- Required: No
- Type: string

### Parameter: `apimDefinition.notificationSenderEmail`

Notification sender email address.

- Required: No
- Type: string

### Parameter: `apimDefinition.policies`

Policies to configure.

- Required: No
- Type: array

### Parameter: `apimDefinition.portalsettings`

Portal settings for the developer portal. Allowed names: signin, signup, delegation.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-apimdefinitionportalsettingsname) | string | The name of the portal-setting. Allowed values: signin, signup, delegation. |
| [`properties`](#parameter-apimdefinitionportalsettingsproperties) | object | The portal-settings contract properties. Shape depends on the "name". |

### Parameter: `apimDefinition.portalsettings.name`

The name of the portal-setting. Allowed values: signin, signup, delegation.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'delegation'
    'signin'
    'signup'
  ]
  ```

### Parameter: `apimDefinition.portalsettings.properties`

The portal-settings contract properties. Shape depends on the "name".

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enabled`](#parameter-apimdefinitionportalsettingspropertiesenabled) | bool | Redirect Anonymous users to the Sign-In page. |

### Parameter: `apimDefinition.portalsettings.properties.enabled`

Redirect Anonymous users to the Sign-In page.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.products`

Products to configure.

- Required: No
- Type: array

### Parameter: `apimDefinition.publicIpAddressResourceId`

Public IP address resource ID for API Management.

- Required: No
- Type: string

### Parameter: `apimDefinition.restore`

Restore configuration for undeleting API Management services.

- Required: No
- Type: bool

### Parameter: `apimDefinition.roleAssignments`

Role assignments for the API Management service.

- Required: No
- Type: array

### Parameter: `apimDefinition.sku`

SKU of the API Management service. Allowed values: Consumption, Developer, Basic, Standard, Premium.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Basic'
    'Consumption'
    'Developer'
    'Premium'
    'Standard'
  ]
  ```

### Parameter: `apimDefinition.subnetResourceId`

Subnet resource ID for VNet integration.

- Required: No
- Type: string

### Parameter: `apimDefinition.subscriptions`

Subscriptions to configure.

- Required: No
- Type: array

### Parameter: `apimDefinition.tags`

Tags to apply to the API Management service.

- Required: No
- Type: object

### Parameter: `apimDefinition.virtualNetworkType`

Virtual network type. Allowed values: None, External, Internal.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'External'
    'Internal'
    'None'
  ]
  ```

### Parameter: `appConfigurationDefinition`

App Configuration store settings. Required if deployGenAiAppBackingServices is true, deployToggles.appConfig is true, and resourceIds.appConfigResourceId is empty.

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      name: ''
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-appconfigurationdefinitionname) | string | Name of the Azure App Configuration. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`createMode`](#parameter-appconfigurationdefinitioncreatemode) | string | Indicates whether the configuration store needs to be recovered. |
| [`customerManagedKey`](#parameter-appconfigurationdefinitioncustomermanagedkey) | object | Customer Managed Key definition. |
| [`dataPlaneProxy`](#parameter-appconfigurationdefinitiondataplaneproxy) | object | Data plane proxy configuration for ARM. |
| [`diagnosticSettings`](#parameter-appconfigurationdefinitiondiagnosticsettings) | array | Diagnostic settings for the service. |
| [`disableLocalAuth`](#parameter-appconfigurationdefinitiondisablelocalauth) | bool | Disable all non-AAD authentication methods. |
| [`enablePurgeProtection`](#parameter-appconfigurationdefinitionenablepurgeprotection) | bool | Enable purge protection (default true, except Free SKU). |
| [`enableTelemetry`](#parameter-appconfigurationdefinitionenabletelemetry) | bool | Enable or disable usage telemetry for module. |
| [`keyValues`](#parameter-appconfigurationdefinitionkeyvalues) | array | List of key/values to create (requires local auth). |
| [`location`](#parameter-appconfigurationdefinitionlocation) | string | Location for the resource (default resourceGroup().location). |
| [`lock`](#parameter-appconfigurationdefinitionlock) | object | Lock settings. |
| [`managedIdentities`](#parameter-appconfigurationdefinitionmanagedidentities) | object | Managed identity configuration. |
| [`privateEndpoints`](#parameter-appconfigurationdefinitionprivateendpoints) | array | Private endpoint configuration. |
| [`publicNetworkAccess`](#parameter-appconfigurationdefinitionpublicnetworkaccess) | string | Whether public network access is allowed. |
| [`replicaLocations`](#parameter-appconfigurationdefinitionreplicalocations) | array | Replica locations. |
| [`roleAssignments`](#parameter-appconfigurationdefinitionroleassignments) | array | Role assignments for App Configuration. |
| [`sku`](#parameter-appconfigurationdefinitionsku) | string | Pricing tier of App Configuration. |
| [`softDeleteRetentionInDays`](#parameter-appconfigurationdefinitionsoftdeleteretentionindays) | int | Retention period in days for soft delete (1–7). Default 1. |
| [`tags`](#parameter-appconfigurationdefinitiontags) | object | Tags for the resource. |

### Parameter: `appConfigurationDefinition.name`

Name of the Azure App Configuration.

- Required: Yes
- Type: string

### Parameter: `appConfigurationDefinition.createMode`

Indicates whether the configuration store needs to be recovered.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Default'
    'Recover'
  ]
  ```

### Parameter: `appConfigurationDefinition.customerManagedKey`

Customer Managed Key definition.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`keyName`](#parameter-appconfigurationdefinitioncustomermanagedkeykeyname) | string | Key name used for encryption. |
| [`keyVaultResourceId`](#parameter-appconfigurationdefinitioncustomermanagedkeykeyvaultresourceid) | string | Resource ID of the Key Vault containing the key. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`autoRotationEnabled`](#parameter-appconfigurationdefinitioncustomermanagedkeyautorotationenabled) | bool | Enable or disable auto-rotation (default true). |
| [`keyVersion`](#parameter-appconfigurationdefinitioncustomermanagedkeykeyversion) | string | Specific key version to use. |
| [`userAssignedIdentityResourceId`](#parameter-appconfigurationdefinitioncustomermanagedkeyuserassignedidentityresourceid) | string | User-assigned identity resource ID if system identity is not available. |

### Parameter: `appConfigurationDefinition.customerManagedKey.keyName`

Key name used for encryption.

- Required: Yes
- Type: string

### Parameter: `appConfigurationDefinition.customerManagedKey.keyVaultResourceId`

Resource ID of the Key Vault containing the key.

- Required: Yes
- Type: string

### Parameter: `appConfigurationDefinition.customerManagedKey.autoRotationEnabled`

Enable or disable auto-rotation (default true).

- Required: No
- Type: bool

### Parameter: `appConfigurationDefinition.customerManagedKey.keyVersion`

Specific key version to use.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.customerManagedKey.userAssignedIdentityResourceId`

User-assigned identity resource ID if system identity is not available.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.dataPlaneProxy`

Data plane proxy configuration for ARM.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`privateLinkDelegation`](#parameter-appconfigurationdefinitiondataplaneproxyprivatelinkdelegation) | string | Whether private link delegation is enabled. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`authenticationMode`](#parameter-appconfigurationdefinitiondataplaneproxyauthenticationmode) | string | Authentication mode for data plane proxy. |

### Parameter: `appConfigurationDefinition.dataPlaneProxy.privateLinkDelegation`

Whether private link delegation is enabled.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Disabled'
    'Enabled'
  ]
  ```

### Parameter: `appConfigurationDefinition.dataPlaneProxy.authenticationMode`

Authentication mode for data plane proxy.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Local'
    'Pass-through'
  ]
  ```

### Parameter: `appConfigurationDefinition.diagnosticSettings`

Diagnostic settings for the service.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`eventHubAuthorizationRuleResourceId`](#parameter-appconfigurationdefinitiondiagnosticsettingseventhubauthorizationruleresourceid) | string | Resource ID of the diagnostic event hub authorization rule. |
| [`eventHubName`](#parameter-appconfigurationdefinitiondiagnosticsettingseventhubname) | string | Name of the diagnostic Event Hub. |
| [`logAnalyticsDestinationType`](#parameter-appconfigurationdefinitiondiagnosticsettingsloganalyticsdestinationtype) | string | Destination type for Log Analytics. Allowed values: AzureDiagnostics, Dedicated. |
| [`logCategoriesAndGroups`](#parameter-appconfigurationdefinitiondiagnosticsettingslogcategoriesandgroups) | array | Log categories and groups to stream. |
| [`marketplacePartnerResourceId`](#parameter-appconfigurationdefinitiondiagnosticsettingsmarketplacepartnerresourceid) | string | Marketplace partner resource ID. |
| [`metricCategories`](#parameter-appconfigurationdefinitiondiagnosticsettingsmetriccategories) | array | Metric categories to stream. |
| [`name`](#parameter-appconfigurationdefinitiondiagnosticsettingsname) | string | Diagnostic setting name. |
| [`storageAccountResourceId`](#parameter-appconfigurationdefinitiondiagnosticsettingsstorageaccountresourceid) | string | Storage account resource ID for diagnostic logs. |
| [`workspaceResourceId`](#parameter-appconfigurationdefinitiondiagnosticsettingsworkspaceresourceid) | string | Log Analytics workspace resource ID for diagnostic logs. |

### Parameter: `appConfigurationDefinition.diagnosticSettings.eventHubAuthorizationRuleResourceId`

Resource ID of the diagnostic event hub authorization rule.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.diagnosticSettings.eventHubName`

Name of the diagnostic Event Hub.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.diagnosticSettings.logAnalyticsDestinationType`

Destination type for Log Analytics. Allowed values: AzureDiagnostics, Dedicated.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'AzureDiagnostics'
    'Dedicated'
  ]
  ```

### Parameter: `appConfigurationDefinition.diagnosticSettings.logCategoriesAndGroups`

Log categories and groups to stream.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-appconfigurationdefinitiondiagnosticsettingslogcategoriesandgroupscategory) | string | Name of a diagnostic log category. |
| [`categoryGroup`](#parameter-appconfigurationdefinitiondiagnosticsettingslogcategoriesandgroupscategorygroup) | string | Name of a diagnostic log category group. |
| [`enabled`](#parameter-appconfigurationdefinitiondiagnosticsettingslogcategoriesandgroupsenabled) | bool | Enable or disable the category. Default true. |

### Parameter: `appConfigurationDefinition.diagnosticSettings.logCategoriesAndGroups.category`

Name of a diagnostic log category.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.diagnosticSettings.logCategoriesAndGroups.categoryGroup`

Name of a diagnostic log category group.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.diagnosticSettings.logCategoriesAndGroups.enabled`

Enable or disable the category. Default true.

- Required: No
- Type: bool

### Parameter: `appConfigurationDefinition.diagnosticSettings.marketplacePartnerResourceId`

Marketplace partner resource ID.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.diagnosticSettings.metricCategories`

Metric categories to stream.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-appconfigurationdefinitiondiagnosticsettingsmetriccategoriescategory) | string | Diagnostic metric category name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enabled`](#parameter-appconfigurationdefinitiondiagnosticsettingsmetriccategoriesenabled) | bool | Enable or disable the metric category. Default true. |

### Parameter: `appConfigurationDefinition.diagnosticSettings.metricCategories.category`

Diagnostic metric category name.

- Required: Yes
- Type: string

### Parameter: `appConfigurationDefinition.diagnosticSettings.metricCategories.enabled`

Enable or disable the metric category. Default true.

- Required: No
- Type: bool

### Parameter: `appConfigurationDefinition.diagnosticSettings.name`

Diagnostic setting name.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.diagnosticSettings.storageAccountResourceId`

Storage account resource ID for diagnostic logs.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.diagnosticSettings.workspaceResourceId`

Log Analytics workspace resource ID for diagnostic logs.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.disableLocalAuth`

Disable all non-AAD authentication methods.

- Required: No
- Type: bool

### Parameter: `appConfigurationDefinition.enablePurgeProtection`

Enable purge protection (default true, except Free SKU).

- Required: No
- Type: bool

### Parameter: `appConfigurationDefinition.enableTelemetry`

Enable or disable usage telemetry for module.

- Required: No
- Type: bool

### Parameter: `appConfigurationDefinition.keyValues`

List of key/values to create (requires local auth).

- Required: No
- Type: array

### Parameter: `appConfigurationDefinition.location`

Location for the resource (default resourceGroup().location).

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.lock`

Lock settings.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-appconfigurationdefinitionlockkind) | string | Lock type. |
| [`name`](#parameter-appconfigurationdefinitionlockname) | string | Lock name. |
| [`notes`](#parameter-appconfigurationdefinitionlocknotes) | string | Lock notes. |

### Parameter: `appConfigurationDefinition.lock.kind`

Lock type.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `appConfigurationDefinition.lock.name`

Lock name.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.lock.notes`

Lock notes.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.managedIdentities`

Managed identity configuration.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`systemAssigned`](#parameter-appconfigurationdefinitionmanagedidentitiessystemassigned) | bool | Enable system-assigned managed identity. |
| [`userAssignedResourceIds`](#parameter-appconfigurationdefinitionmanagedidentitiesuserassignedresourceids) | array | User-assigned identity resource IDs. |

### Parameter: `appConfigurationDefinition.managedIdentities.systemAssigned`

Enable system-assigned managed identity.

- Required: No
- Type: bool

### Parameter: `appConfigurationDefinition.managedIdentities.userAssignedResourceIds`

User-assigned identity resource IDs.

- Required: No
- Type: array

### Parameter: `appConfigurationDefinition.privateEndpoints`

Private endpoint configuration.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`subnetResourceId`](#parameter-appconfigurationdefinitionprivateendpointssubnetresourceid) | string | Subnet resource ID for the private endpoint. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`applicationSecurityGroupResourceIds`](#parameter-appconfigurationdefinitionprivateendpointsapplicationsecuritygroupresourceids) | array | Application Security Group resource IDs. |
| [`customDnsConfigs`](#parameter-appconfigurationdefinitionprivateendpointscustomdnsconfigs) | array | Custom DNS configs. |
| [`customNetworkInterfaceName`](#parameter-appconfigurationdefinitionprivateendpointscustomnetworkinterfacename) | string | Custom network interface name. |
| [`enableTelemetry`](#parameter-appconfigurationdefinitionprivateendpointsenabletelemetry) | bool | Enable or disable usage telemetry for the module. |
| [`ipConfigurations`](#parameter-appconfigurationdefinitionprivateendpointsipconfigurations) | array | Explicit IP configurations for the Private Endpoint. |
| [`isManualConnection`](#parameter-appconfigurationdefinitionprivateendpointsismanualconnection) | bool | Use manual Private Link approval flow. |
| [`location`](#parameter-appconfigurationdefinitionprivateendpointslocation) | string | Location to deploy the Private Endpoint to. |
| [`lock`](#parameter-appconfigurationdefinitionprivateendpointslock) | object | Lock settings for the Private Endpoint. |
| [`manualConnectionRequestMessage`](#parameter-appconfigurationdefinitionprivateendpointsmanualconnectionrequestmessage) | string | Manual connection request message. |
| [`name`](#parameter-appconfigurationdefinitionprivateendpointsname) | string | Name of the Private Endpoint resource. |
| [`privateDnsZoneGroup`](#parameter-appconfigurationdefinitionprivateendpointsprivatednszonegroup) | object | Private DNS Zone group configuration. |
| [`privateLinkServiceConnectionName`](#parameter-appconfigurationdefinitionprivateendpointsprivatelinkserviceconnectionname) | string | Private Link service connection name. |
| [`resourceGroupResourceId`](#parameter-appconfigurationdefinitionprivateendpointsresourcegroupresourceid) | string | Resource group resource ID to place the PE in. |
| [`roleAssignments`](#parameter-appconfigurationdefinitionprivateendpointsroleassignments) | array | Role assignments for the Private Endpoint. |
| [`service`](#parameter-appconfigurationdefinitionprivateendpointsservice) | string | Target service group ID (as string). |
| [`tags`](#parameter-appconfigurationdefinitionprivateendpointstags) | object | Tags to apply to the Private Endpoint. |

### Parameter: `appConfigurationDefinition.privateEndpoints.subnetResourceId`

Subnet resource ID for the private endpoint.

- Required: Yes
- Type: string

### Parameter: `appConfigurationDefinition.privateEndpoints.applicationSecurityGroupResourceIds`

Application Security Group resource IDs.

- Required: No
- Type: array

### Parameter: `appConfigurationDefinition.privateEndpoints.customDnsConfigs`

Custom DNS configs.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`ipAddresses`](#parameter-appconfigurationdefinitionprivateendpointscustomdnsconfigsipaddresses) | array | Private IP addresses for the endpoint. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`fqdn`](#parameter-appconfigurationdefinitionprivateendpointscustomdnsconfigsfqdn) | string | FQDN that maps to the private IPs. |

### Parameter: `appConfigurationDefinition.privateEndpoints.customDnsConfigs.ipAddresses`

Private IP addresses for the endpoint.

- Required: Yes
- Type: array

### Parameter: `appConfigurationDefinition.privateEndpoints.customDnsConfigs.fqdn`

FQDN that maps to the private IPs.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.privateEndpoints.customNetworkInterfaceName`

Custom network interface name.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.privateEndpoints.enableTelemetry`

Enable or disable usage telemetry for the module.

- Required: No
- Type: bool

### Parameter: `appConfigurationDefinition.privateEndpoints.ipConfigurations`

Explicit IP configurations for the Private Endpoint.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-appconfigurationdefinitionprivateendpointsipconfigurationsname) | string | Name of this IP configuration. |
| [`properties`](#parameter-appconfigurationdefinitionprivateendpointsipconfigurationsproperties) | object | Object defining groupId, memberName, and privateIPAddress for the private endpoint IP configuration. |

### Parameter: `appConfigurationDefinition.privateEndpoints.ipConfigurations.name`

Name of this IP configuration.

- Required: Yes
- Type: string

### Parameter: `appConfigurationDefinition.privateEndpoints.ipConfigurations.properties`

Object defining groupId, memberName, and privateIPAddress for the private endpoint IP configuration.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`groupId`](#parameter-appconfigurationdefinitionprivateendpointsipconfigurationspropertiesgroupid) | string | Group ID from the remote resource. |
| [`memberName`](#parameter-appconfigurationdefinitionprivateendpointsipconfigurationspropertiesmembername) | string | Member name from the remote resource. |
| [`privateIPAddress`](#parameter-appconfigurationdefinitionprivateendpointsipconfigurationspropertiesprivateipaddress) | string | Private IP address from the PE subnet. |

### Parameter: `appConfigurationDefinition.privateEndpoints.ipConfigurations.properties.groupId`

Group ID from the remote resource.

- Required: Yes
- Type: string

### Parameter: `appConfigurationDefinition.privateEndpoints.ipConfigurations.properties.memberName`

Member name from the remote resource.

- Required: Yes
- Type: string

### Parameter: `appConfigurationDefinition.privateEndpoints.ipConfigurations.properties.privateIPAddress`

Private IP address from the PE subnet.

- Required: Yes
- Type: string

### Parameter: `appConfigurationDefinition.privateEndpoints.isManualConnection`

Use manual Private Link approval flow.

- Required: No
- Type: bool

### Parameter: `appConfigurationDefinition.privateEndpoints.location`

Location to deploy the Private Endpoint to.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.privateEndpoints.lock`

Lock settings for the Private Endpoint.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-appconfigurationdefinitionprivateendpointslockkind) | string | Lock type. |
| [`name`](#parameter-appconfigurationdefinitionprivateendpointslockname) | string | Lock name. |
| [`notes`](#parameter-appconfigurationdefinitionprivateendpointslocknotes) | string | Lock notes. |

### Parameter: `appConfigurationDefinition.privateEndpoints.lock.kind`

Lock type.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `appConfigurationDefinition.privateEndpoints.lock.name`

Lock name.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.privateEndpoints.lock.notes`

Lock notes.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.privateEndpoints.manualConnectionRequestMessage`

Manual connection request message.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.privateEndpoints.name`

Name of the Private Endpoint resource.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.privateEndpoints.privateDnsZoneGroup`

Private DNS Zone group configuration.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`privateDnsZoneGroupConfigs`](#parameter-appconfigurationdefinitionprivateendpointsprivatednszonegroupprivatednszonegroupconfigs) | array | Configs for linking PDNS zones. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-appconfigurationdefinitionprivateendpointsprivatednszonegroupname) | string | Name of the Private DNS Zone group. |

### Parameter: `appConfigurationDefinition.privateEndpoints.privateDnsZoneGroup.privateDnsZoneGroupConfigs`

Configs for linking PDNS zones.

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`privateDnsZoneResourceId`](#parameter-appconfigurationdefinitionprivateendpointsprivatednszonegroupprivatednszonegroupconfigsprivatednszoneresourceid) | string | Private DNS Zone resource ID. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-appconfigurationdefinitionprivateendpointsprivatednszonegroupprivatednszonegroupconfigsname) | string | Name of this DNS zone config. |

### Parameter: `appConfigurationDefinition.privateEndpoints.privateDnsZoneGroup.privateDnsZoneGroupConfigs.privateDnsZoneResourceId`

Private DNS Zone resource ID.

- Required: Yes
- Type: string

### Parameter: `appConfigurationDefinition.privateEndpoints.privateDnsZoneGroup.privateDnsZoneGroupConfigs.name`

Name of this DNS zone config.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.privateEndpoints.privateDnsZoneGroup.name`

Name of the Private DNS Zone group.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.privateEndpoints.privateLinkServiceConnectionName`

Private Link service connection name.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.privateEndpoints.resourceGroupResourceId`

Resource group resource ID to place the PE in.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.privateEndpoints.roleAssignments`

Role assignments for the Private Endpoint.

- Required: No
- Type: array

### Parameter: `appConfigurationDefinition.privateEndpoints.service`

Target service group ID (as string).

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.privateEndpoints.tags`

Tags to apply to the Private Endpoint.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appconfigurationdefinitionprivateendpointstags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `appConfigurationDefinition.privateEndpoints.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `appConfigurationDefinition.publicNetworkAccess`

Whether public network access is allowed.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Disabled'
    'Enabled'
  ]
  ```

### Parameter: `appConfigurationDefinition.replicaLocations`

Replica locations.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`replicaLocation`](#parameter-appconfigurationdefinitionreplicalocationsreplicalocation) | string | Azure region name for the replica. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-appconfigurationdefinitionreplicalocationsname) | string | Replica name. |

### Parameter: `appConfigurationDefinition.replicaLocations.replicaLocation`

Azure region name for the replica.

- Required: Yes
- Type: string

### Parameter: `appConfigurationDefinition.replicaLocations.name`

Replica name.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.roleAssignments`

Role assignments for App Configuration.

- Required: No
- Type: array

### Parameter: `appConfigurationDefinition.sku`

Pricing tier of App Configuration.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Developer'
    'Free'
    'Premium'
    'Standard'
  ]
  ```

### Parameter: `appConfigurationDefinition.softDeleteRetentionInDays`

Retention period in days for soft delete (1–7). Default 1.

- Required: No
- Type: int

### Parameter: `appConfigurationDefinition.tags`

Tags for the resource.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appconfigurationdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `appConfigurationDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition`

Application Gateway configuration. Required if deployToggles.applicationGateway is true and resourceIds.applicationGatewayResourceId is empty.

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      name: ''
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-appgatewaydefinitionname) | string | Name of the Application Gateway. |

**Conditional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`firewallPolicyResourceId`](#parameter-appgatewaydefinitionfirewallpolicyresourceid) | string | Resource ID of the associated firewall policy. Required if SKU is WAF_v2. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`authenticationCertificates`](#parameter-appgatewaydefinitionauthenticationcertificates) | array | Authentication certificates of the Application Gateway. |
| [`autoscaleMaxCapacity`](#parameter-appgatewaydefinitionautoscalemaxcapacity) | int | Maximum autoscale capacity. |
| [`autoscaleMinCapacity`](#parameter-appgatewaydefinitionautoscalemincapacity) | int | Minimum autoscale capacity. |
| [`availabilityZones`](#parameter-appgatewaydefinitionavailabilityzones) | array | Availability zones used by the gateway. |
| [`backendAddressPools`](#parameter-appgatewaydefinitionbackendaddresspools) | array | Backend address pools of the Application Gateway. |
| [`backendHttpSettingsCollection`](#parameter-appgatewaydefinitionbackendhttpsettingscollection) | array | Backend HTTP settings. |
| [`backendSettingsCollection`](#parameter-appgatewaydefinitionbackendsettingscollection) | array | Backend settings collection (see limits). |
| [`capacity`](#parameter-appgatewaydefinitioncapacity) | int | Static instance capacity. Default is 2. |
| [`customErrorConfigurations`](#parameter-appgatewaydefinitioncustomerrorconfigurations) | array | Custom error configurations. |
| [`diagnosticSettings`](#parameter-appgatewaydefinitiondiagnosticsettings) | array | Diagnostic settings for the Application Gateway. |
| [`enableFips`](#parameter-appgatewaydefinitionenablefips) | bool | Whether FIPS is enabled. |
| [`enableHttp2`](#parameter-appgatewaydefinitionenablehttp2) | bool | Whether HTTP/2 is enabled. |
| [`enableRequestBuffering`](#parameter-appgatewaydefinitionenablerequestbuffering) | bool | Enable request buffering. |
| [`enableResponseBuffering`](#parameter-appgatewaydefinitionenableresponsebuffering) | bool | Enable response buffering. |
| [`enableTelemetry`](#parameter-appgatewaydefinitionenabletelemetry) | bool | Enable or disable telemetry (default true). |
| [`frontendIPConfigurations`](#parameter-appgatewaydefinitionfrontendipconfigurations) | array | Frontend IP configurations. |
| [`frontendPorts`](#parameter-appgatewaydefinitionfrontendports) | array | Frontend ports. |
| [`gatewayIPConfigurations`](#parameter-appgatewaydefinitiongatewayipconfigurations) | array | Gateway IP configurations (subnets). |
| [`httpListeners`](#parameter-appgatewaydefinitionhttplisteners) | array | HTTP listeners. |
| [`listeners`](#parameter-appgatewaydefinitionlisteners) | array | Listeners (see limits). |
| [`loadDistributionPolicies`](#parameter-appgatewaydefinitionloaddistributionpolicies) | array | Load distribution policies. |
| [`location`](#parameter-appgatewaydefinitionlocation) | string | Location of the Application Gateway. |
| [`lock`](#parameter-appgatewaydefinitionlock) | object | Lock settings. |
| [`managedIdentities`](#parameter-appgatewaydefinitionmanagedidentities) | object | Managed identities for the Application Gateway. |
| [`privateEndpoints`](#parameter-appgatewaydefinitionprivateendpoints) | array | Private endpoints configuration. |
| [`privateLinkConfigurations`](#parameter-appgatewaydefinitionprivatelinkconfigurations) | array | Private link configurations. |
| [`probes`](#parameter-appgatewaydefinitionprobes) | array | Probes for backend health monitoring. |
| [`redirectConfigurations`](#parameter-appgatewaydefinitionredirectconfigurations) | array | Redirect configurations. |
| [`requestRoutingRules`](#parameter-appgatewaydefinitionrequestroutingrules) | array | Request routing rules. |
| [`rewriteRuleSets`](#parameter-appgatewaydefinitionrewriterulesets) | array | Rewrite rule sets. |
| [`roleAssignments`](#parameter-appgatewaydefinitionroleassignments) | array | Role assignments for the Application Gateway. |
| [`routingRules`](#parameter-appgatewaydefinitionroutingrules) | array | Routing rules. |
| [`sku`](#parameter-appgatewaydefinitionsku) | string | SKU of the Application Gateway. Default is WAF_v2. |
| [`sslCertificates`](#parameter-appgatewaydefinitionsslcertificates) | array | SSL certificates. |
| [`sslPolicyCipherSuites`](#parameter-appgatewaydefinitionsslpolicyciphersuites) | array | SSL policy cipher suites. |
| [`sslPolicyMinProtocolVersion`](#parameter-appgatewaydefinitionsslpolicyminprotocolversion) | string | Minimum SSL protocol version. |
| [`sslPolicyName`](#parameter-appgatewaydefinitionsslpolicyname) | string | Predefined SSL policy name. |
| [`sslPolicyType`](#parameter-appgatewaydefinitionsslpolicytype) | string | SSL policy type. |
| [`sslProfiles`](#parameter-appgatewaydefinitionsslprofiles) | array | SSL profiles. |
| [`tags`](#parameter-appgatewaydefinitiontags) | object | Resource tags. |
| [`trustedClientCertificates`](#parameter-appgatewaydefinitiontrustedclientcertificates) | array | Trusted client certificates. |
| [`trustedRootCertificates`](#parameter-appgatewaydefinitiontrustedrootcertificates) | array | Trusted root certificates. |
| [`urlPathMaps`](#parameter-appgatewaydefinitionurlpathmaps) | array | URL path maps. |

### Parameter: `appGatewayDefinition.name`

Name of the Application Gateway.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.firewallPolicyResourceId`

Resource ID of the associated firewall policy. Required if SKU is WAF_v2.

- Required: No
- Type: string

### Parameter: `appGatewayDefinition.authenticationCertificates`

Authentication certificates of the Application Gateway.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.autoscaleMaxCapacity`

Maximum autoscale capacity.

- Required: No
- Type: int

### Parameter: `appGatewayDefinition.autoscaleMinCapacity`

Minimum autoscale capacity.

- Required: No
- Type: int

### Parameter: `appGatewayDefinition.availabilityZones`

Availability zones used by the gateway.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.backendAddressPools`

Backend address pools of the Application Gateway.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.backendHttpSettingsCollection`

Backend HTTP settings.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.backendSettingsCollection`

Backend settings collection (see limits).

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.capacity`

Static instance capacity. Default is 2.

- Required: No
- Type: int

### Parameter: `appGatewayDefinition.customErrorConfigurations`

Custom error configurations.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.diagnosticSettings`

Diagnostic settings for the Application Gateway.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.enableFips`

Whether FIPS is enabled.

- Required: No
- Type: bool

### Parameter: `appGatewayDefinition.enableHttp2`

Whether HTTP/2 is enabled.

- Required: No
- Type: bool

### Parameter: `appGatewayDefinition.enableRequestBuffering`

Enable request buffering.

- Required: No
- Type: bool

### Parameter: `appGatewayDefinition.enableResponseBuffering`

Enable response buffering.

- Required: No
- Type: bool

### Parameter: `appGatewayDefinition.enableTelemetry`

Enable or disable telemetry (default true).

- Required: No
- Type: bool

### Parameter: `appGatewayDefinition.frontendIPConfigurations`

Frontend IP configurations.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.frontendPorts`

Frontend ports.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.gatewayIPConfigurations`

Gateway IP configurations (subnets).

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.httpListeners`

HTTP listeners.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.listeners`

Listeners (see limits).

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.loadDistributionPolicies`

Load distribution policies.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.location`

Location of the Application Gateway.

- Required: No
- Type: string

### Parameter: `appGatewayDefinition.lock`

Lock settings.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-appgatewaydefinitionlockkind) | string | Lock type. |
| [`name`](#parameter-appgatewaydefinitionlockname) | string | Lock name. |
| [`notes`](#parameter-appgatewaydefinitionlocknotes) | string | Lock notes. |

### Parameter: `appGatewayDefinition.lock.kind`

Lock type.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `appGatewayDefinition.lock.name`

Lock name.

- Required: No
- Type: string

### Parameter: `appGatewayDefinition.lock.notes`

Lock notes.

- Required: No
- Type: string

### Parameter: `appGatewayDefinition.managedIdentities`

Managed identities for the Application Gateway.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`userAssignedResourceIds`](#parameter-appgatewaydefinitionmanagedidentitiesuserassignedresourceids) | array | User-assigned managed identity resource IDs. |

### Parameter: `appGatewayDefinition.managedIdentities.userAssignedResourceIds`

User-assigned managed identity resource IDs.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.privateEndpoints`

Private endpoints configuration.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.privateLinkConfigurations`

Private link configurations.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.probes`

Probes for backend health monitoring.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.redirectConfigurations`

Redirect configurations.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.requestRoutingRules`

Request routing rules.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.rewriteRuleSets`

Rewrite rule sets.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.roleAssignments`

Role assignments for the Application Gateway.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.routingRules`

Routing rules.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.sku`

SKU of the Application Gateway. Default is WAF_v2.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Basic'
    'Standard_v2'
    'WAF_v2'
  ]
  ```

### Parameter: `appGatewayDefinition.sslCertificates`

SSL certificates.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.sslPolicyCipherSuites`

SSL policy cipher suites.

- Required: No
- Type: array
- Allowed:
  ```Bicep
  [
    'TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA'
    'TLS_DHE_DSS_WITH_AES_128_CBC_SHA'
    'TLS_DHE_DSS_WITH_AES_128_CBC_SHA256'
    'TLS_DHE_DSS_WITH_AES_256_CBC_SHA'
    'TLS_DHE_DSS_WITH_AES_256_CBC_SHA256'
    'TLS_DHE_RSA_WITH_AES_128_CBC_SHA'
    'TLS_DHE_RSA_WITH_AES_128_GCM_SHA256'
    'TLS_DHE_RSA_WITH_AES_256_CBC_SHA'
    'TLS_DHE_RSA_WITH_AES_256_GCM_SHA384'
    'TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA'
    'TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256'
    'TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256'
    'TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA'
    'TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384'
    'TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384'
    'TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA'
    'TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256'
    'TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256'
    'TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA'
    'TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384'
    'TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384'
    'TLS_RSA_WITH_3DES_EDE_CBC_SHA'
    'TLS_RSA_WITH_AES_128_CBC_SHA'
    'TLS_RSA_WITH_AES_128_CBC_SHA256'
    'TLS_RSA_WITH_AES_128_GCM_SHA256'
    'TLS_RSA_WITH_AES_256_CBC_SHA'
    'TLS_RSA_WITH_AES_256_CBC_SHA256'
    'TLS_RSA_WITH_AES_256_GCM_SHA384'
  ]
  ```

### Parameter: `appGatewayDefinition.sslPolicyMinProtocolVersion`

Minimum SSL protocol version.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'TLSv1_0'
    'TLSv1_1'
    'TLSv1_2'
    'TLSv1_3'
  ]
  ```

### Parameter: `appGatewayDefinition.sslPolicyName`

Predefined SSL policy name.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    ''
    'AppGwSslPolicy20150501'
    'AppGwSslPolicy20170401'
    'AppGwSslPolicy20170401S'
    'AppGwSslPolicy20220101'
    'AppGwSslPolicy20220101S'
  ]
  ```

### Parameter: `appGatewayDefinition.sslPolicyType`

SSL policy type.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Custom'
    'CustomV2'
    'Predefined'
  ]
  ```

### Parameter: `appGatewayDefinition.sslProfiles`

SSL profiles.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.tags`

Resource tags.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appgatewaydefinitiontags>any_other_property<) | string | Arbitrary tag keys and values. |

### Parameter: `appGatewayDefinition.tags.>Any_other_property<`

Arbitrary tag keys and values.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.trustedClientCertificates`

Trusted client certificates.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.trustedRootCertificates`

Trusted root certificates.

- Required: No
- Type: array

### Parameter: `appGatewayDefinition.urlPathMaps`

URL path maps.

- Required: No
- Type: array

### Parameter: `appGatewayPublicIpDefinition`

Public IP configuration for the Application Gateway. Required if deployToggles.applicationGateway is true and resourceIds.applicationGatewayResourceId is empty and a public frontend is being created.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-appgatewaypublicipdefinitionname) | string | Name of the Public IP Address. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`availabilityZones`](#parameter-appgatewaypublicipdefinitionavailabilityzones) | array | List of availability zones for the Public IP Address allocation. Allowed values: 1, 2, 3. |
| [`ddosSettings`](#parameter-appgatewaypublicipdefinitionddossettings) | object | DDoS protection settings for the Public IP Address. |
| [`diagnosticSettings`](#parameter-appgatewaypublicipdefinitiondiagnosticsettings) | array | Diagnostic settings for the Public IP Address. |
| [`dnsSettings`](#parameter-appgatewaypublicipdefinitiondnssettings) | object | DNS settings for the Public IP Address. |
| [`enableTelemetry`](#parameter-appgatewaypublicipdefinitionenabletelemetry) | bool | Enable or disable usage telemetry for the module. Default is true. |
| [`idleTimeoutInMinutes`](#parameter-appgatewaypublicipdefinitionidletimeoutinminutes) | int | Idle timeout in minutes for the Public IP Address. Default is 4. |
| [`ipTags`](#parameter-appgatewaypublicipdefinitioniptags) | array | IP tags associated with the Public IP Address. |
| [`location`](#parameter-appgatewaypublicipdefinitionlocation) | string | Location for the resource. Default is resourceGroup().location. |
| [`lock`](#parameter-appgatewaypublicipdefinitionlock) | object | Lock configuration for the Public IP Address. |
| [`publicIPAddressVersion`](#parameter-appgatewaypublicipdefinitionpublicipaddressversion) | string | IP address version. Default is IPv4. Allowed values: IPv4, IPv6. |
| [`publicIPAllocationMethod`](#parameter-appgatewaypublicipdefinitionpublicipallocationmethod) | string | Public IP allocation method. Default is Static. Allowed values: Dynamic, Static. |
| [`publicIpPrefixResourceId`](#parameter-appgatewaypublicipdefinitionpublicipprefixresourceid) | string | Resource ID of the Public IP Prefix to allocate from. |
| [`roleAssignments`](#parameter-appgatewaypublicipdefinitionroleassignments) | array | Role assignments to apply to the Public IP Address. |
| [`skuName`](#parameter-appgatewaypublicipdefinitionskuname) | string | SKU name for the Public IP Address. Default is Standard. Allowed values: Basic, Standard. |
| [`skuTier`](#parameter-appgatewaypublicipdefinitionskutier) | string | SKU tier for the Public IP Address. Default is Regional. Allowed values: Global, Regional. |
| [`tags`](#parameter-appgatewaypublicipdefinitiontags) | object | Tags to apply to the Public IP Address resource. |

### Parameter: `appGatewayPublicIpDefinition.name`

Name of the Public IP Address.

- Required: Yes
- Type: string

### Parameter: `appGatewayPublicIpDefinition.availabilityZones`

List of availability zones for the Public IP Address allocation. Allowed values: 1, 2, 3.

- Required: No
- Type: array
- Allowed:
  ```Bicep
  [
    1
    2
    3
  ]
  ```

### Parameter: `appGatewayPublicIpDefinition.ddosSettings`

DDoS protection settings for the Public IP Address.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`protectionMode`](#parameter-appgatewaypublicipdefinitionddossettingsprotectionmode) | string | DDoS protection mode. Allowed value: Enabled. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`ddosProtectionPlan`](#parameter-appgatewaypublicipdefinitionddossettingsddosprotectionplan) | object | Associated DDoS protection plan. |

### Parameter: `appGatewayPublicIpDefinition.ddosSettings.protectionMode`

DDoS protection mode. Allowed value: Enabled.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Enabled'
  ]
  ```

### Parameter: `appGatewayPublicIpDefinition.ddosSettings.ddosProtectionPlan`

Associated DDoS protection plan.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`id`](#parameter-appgatewaypublicipdefinitionddossettingsddosprotectionplanid) | string | Resource ID of the DDoS protection plan. |

### Parameter: `appGatewayPublicIpDefinition.ddosSettings.ddosProtectionPlan.id`

Resource ID of the DDoS protection plan.

- Required: Yes
- Type: string

### Parameter: `appGatewayPublicIpDefinition.diagnosticSettings`

Diagnostic settings for the Public IP Address.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`eventHubAuthorizationRuleResourceId`](#parameter-appgatewaypublicipdefinitiondiagnosticsettingseventhubauthorizationruleresourceid) | string | Resource ID of the diagnostic Event Hub authorization rule. |
| [`eventHubName`](#parameter-appgatewaypublicipdefinitiondiagnosticsettingseventhubname) | string | Name of the diagnostic Event Hub. |
| [`logAnalyticsDestinationType`](#parameter-appgatewaypublicipdefinitiondiagnosticsettingsloganalyticsdestinationtype) | string | Log Analytics destination type. Allowed values: AzureDiagnostics, Dedicated. |
| [`logCategoriesAndGroups`](#parameter-appgatewaypublicipdefinitiondiagnosticsettingslogcategoriesandgroups) | array | Log categories and groups to collect. Set to [] to disable log collection. |
| [`marketplacePartnerResourceId`](#parameter-appgatewaypublicipdefinitiondiagnosticsettingsmarketplacepartnerresourceid) | string | Marketplace partner resource ID. |
| [`metricCategories`](#parameter-appgatewaypublicipdefinitiondiagnosticsettingsmetriccategories) | array | Metric categories to collect. Set to [] to disable metric collection. |
| [`name`](#parameter-appgatewaypublicipdefinitiondiagnosticsettingsname) | string | Name of the diagnostic setting. |
| [`storageAccountResourceId`](#parameter-appgatewaypublicipdefinitiondiagnosticsettingsstorageaccountresourceid) | string | Resource ID of the diagnostic storage account. |
| [`workspaceResourceId`](#parameter-appgatewaypublicipdefinitiondiagnosticsettingsworkspaceresourceid) | string | Resource ID of the diagnostic Log Analytics workspace. |

### Parameter: `appGatewayPublicIpDefinition.diagnosticSettings.eventHubAuthorizationRuleResourceId`

Resource ID of the diagnostic Event Hub authorization rule.

- Required: No
- Type: string

### Parameter: `appGatewayPublicIpDefinition.diagnosticSettings.eventHubName`

Name of the diagnostic Event Hub.

- Required: No
- Type: string

### Parameter: `appGatewayPublicIpDefinition.diagnosticSettings.logAnalyticsDestinationType`

Log Analytics destination type. Allowed values: AzureDiagnostics, Dedicated.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'AzureDiagnostics'
    'Dedicated'
  ]
  ```

### Parameter: `appGatewayPublicIpDefinition.diagnosticSettings.logCategoriesAndGroups`

Log categories and groups to collect. Set to [] to disable log collection.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-appgatewaypublicipdefinitiondiagnosticsettingslogcategoriesandgroupscategory) | string | Name of a diagnostic log category. |
| [`categoryGroup`](#parameter-appgatewaypublicipdefinitiondiagnosticsettingslogcategoriesandgroupscategorygroup) | string | Name of a diagnostic log category group. Use allLogs to collect all logs. |
| [`enabled`](#parameter-appgatewaypublicipdefinitiondiagnosticsettingslogcategoriesandgroupsenabled) | bool | Enable or disable the log category. Default is true. |

### Parameter: `appGatewayPublicIpDefinition.diagnosticSettings.logCategoriesAndGroups.category`

Name of a diagnostic log category.

- Required: No
- Type: string

### Parameter: `appGatewayPublicIpDefinition.diagnosticSettings.logCategoriesAndGroups.categoryGroup`

Name of a diagnostic log category group. Use allLogs to collect all logs.

- Required: No
- Type: string

### Parameter: `appGatewayPublicIpDefinition.diagnosticSettings.logCategoriesAndGroups.enabled`

Enable or disable the log category. Default is true.

- Required: No
- Type: bool

### Parameter: `appGatewayPublicIpDefinition.diagnosticSettings.marketplacePartnerResourceId`

Marketplace partner resource ID.

- Required: No
- Type: string

### Parameter: `appGatewayPublicIpDefinition.diagnosticSettings.metricCategories`

Metric categories to collect. Set to [] to disable metric collection.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-appgatewaypublicipdefinitiondiagnosticsettingsmetriccategoriescategory) | string | Name of a diagnostic metric category. Use AllMetrics to collect all metrics. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enabled`](#parameter-appgatewaypublicipdefinitiondiagnosticsettingsmetriccategoriesenabled) | bool | Enable or disable the metric category. Default is true. |

### Parameter: `appGatewayPublicIpDefinition.diagnosticSettings.metricCategories.category`

Name of a diagnostic metric category. Use AllMetrics to collect all metrics.

- Required: Yes
- Type: string

### Parameter: `appGatewayPublicIpDefinition.diagnosticSettings.metricCategories.enabled`

Enable or disable the metric category. Default is true.

- Required: No
- Type: bool

### Parameter: `appGatewayPublicIpDefinition.diagnosticSettings.name`

Name of the diagnostic setting.

- Required: No
- Type: string

### Parameter: `appGatewayPublicIpDefinition.diagnosticSettings.storageAccountResourceId`

Resource ID of the diagnostic storage account.

- Required: No
- Type: string

### Parameter: `appGatewayPublicIpDefinition.diagnosticSettings.workspaceResourceId`

Resource ID of the diagnostic Log Analytics workspace.

- Required: No
- Type: string

### Parameter: `appGatewayPublicIpDefinition.dnsSettings`

DNS settings for the Public IP Address.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`domainNameLabel`](#parameter-appgatewaypublicipdefinitiondnssettingsdomainnamelabel) | string | Domain name label used to create an A DNS record in Azure DNS. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`domainNameLabelScope`](#parameter-appgatewaypublicipdefinitiondnssettingsdomainnamelabelscope) | string | Domain name label scope. Allowed values: NoReuse, ResourceGroupReuse, SubscriptionReuse, TenantReuse. |
| [`fqdn`](#parameter-appgatewaypublicipdefinitiondnssettingsfqdn) | string | Fully qualified domain name (FQDN) associated with the Public IP. |
| [`reverseFqdn`](#parameter-appgatewaypublicipdefinitiondnssettingsreversefqdn) | string | Reverse FQDN used for PTR records. |

### Parameter: `appGatewayPublicIpDefinition.dnsSettings.domainNameLabel`

Domain name label used to create an A DNS record in Azure DNS.

- Required: Yes
- Type: string

### Parameter: `appGatewayPublicIpDefinition.dnsSettings.domainNameLabelScope`

Domain name label scope. Allowed values: NoReuse, ResourceGroupReuse, SubscriptionReuse, TenantReuse.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'NoReuse'
    'ResourceGroupReuse'
    'SubscriptionReuse'
    'TenantReuse'
  ]
  ```

### Parameter: `appGatewayPublicIpDefinition.dnsSettings.fqdn`

Fully qualified domain name (FQDN) associated with the Public IP.

- Required: No
- Type: string

### Parameter: `appGatewayPublicIpDefinition.dnsSettings.reverseFqdn`

Reverse FQDN used for PTR records.

- Required: No
- Type: string

### Parameter: `appGatewayPublicIpDefinition.enableTelemetry`

Enable or disable usage telemetry for the module. Default is true.

- Required: No
- Type: bool

### Parameter: `appGatewayPublicIpDefinition.idleTimeoutInMinutes`

Idle timeout in minutes for the Public IP Address. Default is 4.

- Required: No
- Type: int

### Parameter: `appGatewayPublicIpDefinition.ipTags`

IP tags associated with the Public IP Address.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`ipTagType`](#parameter-appgatewaypublicipdefinitioniptagsiptagtype) | string | IP tag type. |
| [`tag`](#parameter-appgatewaypublicipdefinitioniptagstag) | string | IP tag value. |

### Parameter: `appGatewayPublicIpDefinition.ipTags.ipTagType`

IP tag type.

- Required: Yes
- Type: string

### Parameter: `appGatewayPublicIpDefinition.ipTags.tag`

IP tag value.

- Required: Yes
- Type: string

### Parameter: `appGatewayPublicIpDefinition.location`

Location for the resource. Default is resourceGroup().location.

- Required: No
- Type: string

### Parameter: `appGatewayPublicIpDefinition.lock`

Lock configuration for the Public IP Address.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-appgatewaypublicipdefinitionlockkind) | string | Lock type. Allowed values: CanNotDelete, None, ReadOnly. |
| [`name`](#parameter-appgatewaypublicipdefinitionlockname) | string | Lock name. |
| [`notes`](#parameter-appgatewaypublicipdefinitionlocknotes) | string | Lock notes. |

### Parameter: `appGatewayPublicIpDefinition.lock.kind`

Lock type. Allowed values: CanNotDelete, None, ReadOnly.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `appGatewayPublicIpDefinition.lock.name`

Lock name.

- Required: No
- Type: string

### Parameter: `appGatewayPublicIpDefinition.lock.notes`

Lock notes.

- Required: No
- Type: string

### Parameter: `appGatewayPublicIpDefinition.publicIPAddressVersion`

IP address version. Default is IPv4. Allowed values: IPv4, IPv6.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'IPv4'
    'IPv6'
  ]
  ```

### Parameter: `appGatewayPublicIpDefinition.publicIPAllocationMethod`

Public IP allocation method. Default is Static. Allowed values: Dynamic, Static.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Dynamic'
    'Static'
  ]
  ```

### Parameter: `appGatewayPublicIpDefinition.publicIpPrefixResourceId`

Resource ID of the Public IP Prefix to allocate from.

- Required: No
- Type: string

### Parameter: `appGatewayPublicIpDefinition.roleAssignments`

Role assignments to apply to the Public IP Address.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-appgatewaypublicipdefinitionroleassignmentsprincipalid) | string | Principal ID of the identity being assigned. |
| [`roleDefinitionIdOrName`](#parameter-appgatewaypublicipdefinitionroleassignmentsroledefinitionidorname) | string | Role to assign (display name, GUID, or full resource ID). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-appgatewaypublicipdefinitionroleassignmentscondition) | string | Condition for the role assignment. |
| [`conditionVersion`](#parameter-appgatewaypublicipdefinitionroleassignmentsconditionversion) | string | Condition version. Allowed value: 2.0. |
| [`delegatedManagedIdentityResourceId`](#parameter-appgatewaypublicipdefinitionroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID. |
| [`description`](#parameter-appgatewaypublicipdefinitionroleassignmentsdescription) | string | Description of the role assignment. |
| [`name`](#parameter-appgatewaypublicipdefinitionroleassignmentsname) | string | Role assignment name (GUID). If omitted, a GUID is generated. |
| [`principalType`](#parameter-appgatewaypublicipdefinitionroleassignmentsprincipaltype) | string | Principal type of the assigned identity. Allowed values: Device, ForeignGroup, Group, ServicePrincipal, User. |

### Parameter: `appGatewayPublicIpDefinition.roleAssignments.principalId`

Principal ID of the identity being assigned.

- Required: Yes
- Type: string

### Parameter: `appGatewayPublicIpDefinition.roleAssignments.roleDefinitionIdOrName`

Role to assign (display name, GUID, or full resource ID).

- Required: Yes
- Type: string

### Parameter: `appGatewayPublicIpDefinition.roleAssignments.condition`

Condition for the role assignment.

- Required: No
- Type: string

### Parameter: `appGatewayPublicIpDefinition.roleAssignments.conditionVersion`

Condition version. Allowed value: 2.0.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `appGatewayPublicIpDefinition.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID.

- Required: No
- Type: string

### Parameter: `appGatewayPublicIpDefinition.roleAssignments.description`

Description of the role assignment.

- Required: No
- Type: string

### Parameter: `appGatewayPublicIpDefinition.roleAssignments.name`

Role assignment name (GUID). If omitted, a GUID is generated.

- Required: No
- Type: string

### Parameter: `appGatewayPublicIpDefinition.roleAssignments.principalType`

Principal type of the assigned identity. Allowed values: Device, ForeignGroup, Group, ServicePrincipal, User.

- Required: No
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

### Parameter: `appGatewayPublicIpDefinition.skuName`

SKU name for the Public IP Address. Default is Standard. Allowed values: Basic, Standard.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Basic'
    'Standard'
  ]
  ```

### Parameter: `appGatewayPublicIpDefinition.skuTier`

SKU tier for the Public IP Address. Default is Regional. Allowed values: Global, Regional.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Global'
    'Regional'
  ]
  ```

### Parameter: `appGatewayPublicIpDefinition.tags`

Tags to apply to the Public IP Address resource.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appgatewaypublicipdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `appGatewayPublicIpDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `appInsightsDefinition`

Application Insights configuration. Required if deployToggles.appInsights is true and resourceIds.appInsightsResourceId is empty; a Log Analytics workspace must exist or be deployed.

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      name: ''
      workspaceResourceId: ''
  }
  ```

### Parameter: `buildVmDefinition`

Build VM configuration to support CI/CD workers (Linux). Required if deployToggles.buildVm is true and you intend to deploy the Build VM.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`adminUsername`](#parameter-buildvmdefinitionadminusername) | string | Admin username to create (e.g., azureuser). |
| [`name`](#parameter-buildvmdefinitionname) | string | VM name. |
| [`runner`](#parameter-buildvmdefinitionrunner) | string | Which agent to install. |
| [`sku`](#parameter-buildvmdefinitionsku) | string | VM size SKU (e.g., Standard_B2s). |
| [`sshPublicKey`](#parameter-buildvmdefinitionsshpublickey) | string | SSH public key for the admin user. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`azdo`](#parameter-buildvmdefinitionazdo) | object | Azure DevOps settings (required when runner = azdo). |
| [`github`](#parameter-buildvmdefinitiongithub) | object | GitHub settings (required when runner = github). |
| [`imageReference`](#parameter-buildvmdefinitionimagereference) | object | Marketplace image reference for the VM. |
| [`osType`](#parameter-buildvmdefinitionostype) | string | OS type for the VM. |
| [`tags`](#parameter-buildvmdefinitiontags) | object | Tags to apply to the Build VM resource. |

### Parameter: `buildVmDefinition.adminUsername`

Admin username to create (e.g., azureuser).

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.name`

VM name.

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.runner`

Which agent to install.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'azdo'
    'github'
  ]
  ```

### Parameter: `buildVmDefinition.sku`

VM size SKU (e.g., Standard_B2s).

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.sshPublicKey`

SSH public key for the admin user.

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.azdo`

Azure DevOps settings (required when runner = azdo).

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`orgUrl`](#parameter-buildvmdefinitionazdoorgurl) | string | Azure DevOps organization URL (e.g., https://dev.azure.com/contoso). |
| [`pool`](#parameter-buildvmdefinitionazdopool) | string | Agent pool name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`agentName`](#parameter-buildvmdefinitionazdoagentname) | string | Agent name. |
| [`workFolder`](#parameter-buildvmdefinitionazdoworkfolder) | string | Working folder. |

### Parameter: `buildVmDefinition.azdo.orgUrl`

Azure DevOps organization URL (e.g., https://dev.azure.com/contoso).

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.azdo.pool`

Agent pool name.

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.azdo.agentName`

Agent name.

- Required: No
- Type: string

### Parameter: `buildVmDefinition.azdo.workFolder`

Working folder.

- Required: No
- Type: string

### Parameter: `buildVmDefinition.github`

GitHub settings (required when runner = github).

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`owner`](#parameter-buildvmdefinitiongithubowner) | string | GitHub owner (org or user). |
| [`repo`](#parameter-buildvmdefinitiongithubrepo) | string | Repository name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`agentName`](#parameter-buildvmdefinitiongithubagentname) | string | Runner name. |
| [`labels`](#parameter-buildvmdefinitiongithublabels) | string | Runner labels (comma-separated). |
| [`workFolder`](#parameter-buildvmdefinitiongithubworkfolder) | string | Working folder. |

### Parameter: `buildVmDefinition.github.owner`

GitHub owner (org or user).

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.github.repo`

Repository name.

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.github.agentName`

Runner name.

- Required: No
- Type: string

### Parameter: `buildVmDefinition.github.labels`

Runner labels (comma-separated).

- Required: No
- Type: string

### Parameter: `buildVmDefinition.github.workFolder`

Working folder.

- Required: No
- Type: string

### Parameter: `buildVmDefinition.imageReference`

Marketplace image reference for the VM.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`offer`](#parameter-buildvmdefinitionimagereferenceoffer) | string | Offer name. |
| [`publisher`](#parameter-buildvmdefinitionimagereferencepublisher) | string | Publisher name. |
| [`sku`](#parameter-buildvmdefinitionimagereferencesku) | string | SKU name. |
| [`version`](#parameter-buildvmdefinitionimagereferenceversion) | string | Image version (e.g., latest). |

### Parameter: `buildVmDefinition.imageReference.offer`

Offer name.

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.imageReference.publisher`

Publisher name.

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.imageReference.sku`

SKU name.

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.imageReference.version`

Image version (e.g., latest).

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.osType`

OS type for the VM.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Linux'
    'Windows'
  ]
  ```

### Parameter: `buildVmDefinition.tags`

Tags to apply to the Build VM resource.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-buildvmdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `buildVmDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `buildVmMaintenanceDefinition`

Jump (bastion) VM Maintenance Definition (Windows). Required if deployToggles.jumpVm is true.

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      name: ''
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-buildvmmaintenancedefinitionname) | string | Name of the Maintenance Configuration. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enableTelemetry`](#parameter-buildvmmaintenancedefinitionenabletelemetry) | bool | Enable or disable usage telemetry for the module. Default is true. |
| [`extensionProperties`](#parameter-buildvmmaintenancedefinitionextensionproperties) | object | Extension properties of the Maintenance Configuration. |
| [`installPatches`](#parameter-buildvmmaintenancedefinitioninstallpatches) | object | Configuration settings for VM guest patching with Azure Update Manager. |
| [`location`](#parameter-buildvmmaintenancedefinitionlocation) | string | Resource location. Defaults to the resource group location. |
| [`lock`](#parameter-buildvmmaintenancedefinitionlock) | object | Lock configuration for the Maintenance Configuration. |
| [`maintenanceScope`](#parameter-buildvmmaintenancedefinitionmaintenancescope) | string | Maintenance scope of the configuration. Default is Host. |
| [`maintenanceWindow`](#parameter-buildvmmaintenancedefinitionmaintenancewindow) | object | Definition of the Maintenance Window. |
| [`namespace`](#parameter-buildvmmaintenancedefinitionnamespace) | string | Namespace of the resource. |
| [`roleAssignments`](#parameter-buildvmmaintenancedefinitionroleassignments) | array | Role assignments to apply to the Maintenance Configuration. |
| [`tags`](#parameter-buildvmmaintenancedefinitiontags) | object | Tags to apply to the Maintenance Configuration resource. |
| [`visibility`](#parameter-buildvmmaintenancedefinitionvisibility) | string | Visibility of the configuration. Default is Custom. |

### Parameter: `buildVmMaintenanceDefinition.name`

Name of the Maintenance Configuration.

- Required: Yes
- Type: string

### Parameter: `buildVmMaintenanceDefinition.enableTelemetry`

Enable or disable usage telemetry for the module. Default is true.

- Required: No
- Type: bool

### Parameter: `buildVmMaintenanceDefinition.extensionProperties`

Extension properties of the Maintenance Configuration.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-buildvmmaintenancedefinitionextensionproperties>any_other_property<) | string | Arbitrary key for each extension property. |

### Parameter: `buildVmMaintenanceDefinition.extensionProperties.>Any_other_property<`

Arbitrary key for each extension property.

- Required: Yes
- Type: string

### Parameter: `buildVmMaintenanceDefinition.installPatches`

Configuration settings for VM guest patching with Azure Update Manager.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-buildvmmaintenancedefinitioninstallpatches>any_other_property<) | string | Arbitrary key for each patch configuration property. |

### Parameter: `buildVmMaintenanceDefinition.installPatches.>Any_other_property<`

Arbitrary key for each patch configuration property.

- Required: Yes
- Type: string

### Parameter: `buildVmMaintenanceDefinition.location`

Resource location. Defaults to the resource group location.

- Required: No
- Type: string

### Parameter: `buildVmMaintenanceDefinition.lock`

Lock configuration for the Maintenance Configuration.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-buildvmmaintenancedefinitionlockkind) | string | Lock type. |
| [`name`](#parameter-buildvmmaintenancedefinitionlockname) | string | Lock name. |
| [`notes`](#parameter-buildvmmaintenancedefinitionlocknotes) | string | Lock notes. |

### Parameter: `buildVmMaintenanceDefinition.lock.kind`

Lock type.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `buildVmMaintenanceDefinition.lock.name`

Lock name.

- Required: No
- Type: string

### Parameter: `buildVmMaintenanceDefinition.lock.notes`

Lock notes.

- Required: No
- Type: string

### Parameter: `buildVmMaintenanceDefinition.maintenanceScope`

Maintenance scope of the configuration. Default is Host.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Extension'
    'Host'
    'InGuestPatch'
    'OSImage'
    'SQLDB'
    'SQLManagedInstance'
  ]
  ```

### Parameter: `buildVmMaintenanceDefinition.maintenanceWindow`

Definition of the Maintenance Window.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-buildvmmaintenancedefinitionmaintenancewindow>any_other_property<) | string | Arbitrary key for each maintenance window property. |

### Parameter: `buildVmMaintenanceDefinition.maintenanceWindow.>Any_other_property<`

Arbitrary key for each maintenance window property.

- Required: Yes
- Type: string

### Parameter: `buildVmMaintenanceDefinition.namespace`

Namespace of the resource.

- Required: No
- Type: string

### Parameter: `buildVmMaintenanceDefinition.roleAssignments`

Role assignments to apply to the Maintenance Configuration.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-buildvmmaintenancedefinitionroleassignmentsprincipalid) | string | Principal ID of the identity being assigned. |
| [`roleDefinitionIdOrName`](#parameter-buildvmmaintenancedefinitionroleassignmentsroledefinitionidorname) | string | Role to assign (display name, GUID, or full resource ID). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-buildvmmaintenancedefinitionroleassignmentscondition) | string | Condition for the role assignment. |
| [`conditionVersion`](#parameter-buildvmmaintenancedefinitionroleassignmentsconditionversion) | string | Condition version. |
| [`delegatedManagedIdentityResourceId`](#parameter-buildvmmaintenancedefinitionroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID. |
| [`description`](#parameter-buildvmmaintenancedefinitionroleassignmentsdescription) | string | Description of the role assignment. |
| [`name`](#parameter-buildvmmaintenancedefinitionroleassignmentsname) | string | Role assignment name (GUID). If omitted, a GUID is generated. |
| [`principalType`](#parameter-buildvmmaintenancedefinitionroleassignmentsprincipaltype) | string | Principal type of the assigned identity. |

### Parameter: `buildVmMaintenanceDefinition.roleAssignments.principalId`

Principal ID of the identity being assigned.

- Required: Yes
- Type: string

### Parameter: `buildVmMaintenanceDefinition.roleAssignments.roleDefinitionIdOrName`

Role to assign (display name, GUID, or full resource ID).

- Required: Yes
- Type: string

### Parameter: `buildVmMaintenanceDefinition.roleAssignments.condition`

Condition for the role assignment.

- Required: No
- Type: string

### Parameter: `buildVmMaintenanceDefinition.roleAssignments.conditionVersion`

Condition version.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `buildVmMaintenanceDefinition.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID.

- Required: No
- Type: string

### Parameter: `buildVmMaintenanceDefinition.roleAssignments.description`

Description of the role assignment.

- Required: No
- Type: string

### Parameter: `buildVmMaintenanceDefinition.roleAssignments.name`

Role assignment name (GUID). If omitted, a GUID is generated.

- Required: No
- Type: string

### Parameter: `buildVmMaintenanceDefinition.roleAssignments.principalType`

Principal type of the assigned identity.

- Required: No
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

### Parameter: `buildVmMaintenanceDefinition.tags`

Tags to apply to the Maintenance Configuration resource.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-buildvmmaintenancedefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `buildVmMaintenanceDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `buildVmMaintenanceDefinition.visibility`

Visibility of the configuration. Default is Custom.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    ''
    'Custom'
    'Public'
  ]
  ```

### Parameter: `containerAppEnvDefinition`

Container Apps Environment configuration. Required if deployGenAiAppBackingServices is true, deployToggles.containerEnv is true, and resourceIds.containerEnvResourceId is empty.

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      name: ''
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-containerappenvdefinitionname) | string | Name of the Container Apps Managed Environment. |

**Conditional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`dockerBridgeCidr`](#parameter-containerappenvdefinitiondockerbridgecidr) | string | Docker bridge CIDR range for the environment. Must not overlap with other IP ranges. Required if zoneRedundant is set to true to be WAF compliant. |
| [`infrastructureResourceGroupName`](#parameter-containerappenvdefinitioninfrastructureresourcegroupname) | string | Infrastructure resource group name. Required if zoneRedundant is set to true to be WAF compliant. |
| [`infrastructureSubnetResourceId`](#parameter-containerappenvdefinitioninfrastructuresubnetresourceid) | string | Resource ID of the subnet for infrastructure components. Required if "internal" is true. Required if zoneRedundant is set to true to be WAF compliant. |
| [`internal`](#parameter-containerappenvdefinitioninternal) | bool | Boolean indicating if only internal load balancer is used. Required if zoneRedundant is set to true to be WAF compliant. |
| [`platformReservedCidr`](#parameter-containerappenvdefinitionplatformreservedcidr) | string | Reserved IP range in CIDR notation for infrastructure. Required if zoneRedundant is set to true to be WAF compliant. |
| [`platformReservedDnsIP`](#parameter-containerappenvdefinitionplatformreserveddnsip) | string | Reserved DNS IP within platformReservedCidr for internal DNS. Required if zoneRedundant is set to true to be WAF compliant. |
| [`workloadProfiles`](#parameter-containerappenvdefinitionworkloadprofiles) | array | Workload profiles for the Managed Environment. Required if zoneRedundant is set to true to be WAF compliant. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`appInsightsConnectionString`](#parameter-containerappenvdefinitionappinsightsconnectionstring) | securestring | Application Insights connection string. |
| [`appLogsConfiguration`](#parameter-containerappenvdefinitionapplogsconfiguration) | object | App Logs configuration for the Managed Environment. |
| [`certificate`](#parameter-containerappenvdefinitioncertificate) | object | Managed Environment Certificate configuration. |
| [`certificatePassword`](#parameter-containerappenvdefinitioncertificatepassword) | securestring | Password of the certificate used by the custom domain. |
| [`certificateValue`](#parameter-containerappenvdefinitioncertificatevalue) | securestring | Certificate to use for the custom domain (PFX or PEM). |
| [`daprAIConnectionString`](#parameter-containerappenvdefinitiondapraiconnectionstring) | securestring | Application Insights connection string for Dapr telemetry. |
| [`daprAIInstrumentationKey`](#parameter-containerappenvdefinitiondapraiinstrumentationkey) | securestring | Azure Monitor instrumentation key for Dapr telemetry. |
| [`dnsSuffix`](#parameter-containerappenvdefinitiondnssuffix) | string | DNS suffix for the environment domain. |
| [`enableTelemetry`](#parameter-containerappenvdefinitionenabletelemetry) | bool | Enable or disable telemetry for the module. Default is true. |
| [`location`](#parameter-containerappenvdefinitionlocation) | string | Location for all resources. Default is resourceGroup().location. |
| [`lock`](#parameter-containerappenvdefinitionlock) | object | Lock settings for the Managed Environment. |
| [`managedIdentities`](#parameter-containerappenvdefinitionmanagedidentities) | object | Managed identity configuration for the Managed Environment. |
| [`openTelemetryConfiguration`](#parameter-containerappenvdefinitionopentelemetryconfiguration) | object | Open Telemetry configuration. |
| [`peerTrafficEncryption`](#parameter-containerappenvdefinitionpeertrafficencryption) | bool | Whether peer traffic encryption is enabled. Default is true. |
| [`publicNetworkAccess`](#parameter-containerappenvdefinitionpublicnetworkaccess) | string | Whether to allow or block public network traffic. Allowed values: Disabled, Enabled. |
| [`roleAssignments`](#parameter-containerappenvdefinitionroleassignments) | array | Role assignments to create for the Managed Environment. |
| [`storages`](#parameter-containerappenvdefinitionstorages) | array | List of storages to mount on the environment. |
| [`tags`](#parameter-containerappenvdefinitiontags) | object | Tags to apply to the Managed Environment. |
| [`zoneRedundant`](#parameter-containerappenvdefinitionzoneredundant) | bool | Whether the Managed Environment is zone redundant. Default is true. |

### Parameter: `containerAppEnvDefinition.name`

Name of the Container Apps Managed Environment.

- Required: Yes
- Type: string

### Parameter: `containerAppEnvDefinition.dockerBridgeCidr`

Docker bridge CIDR range for the environment. Must not overlap with other IP ranges. Required if zoneRedundant is set to true to be WAF compliant.

- Required: No
- Type: string

### Parameter: `containerAppEnvDefinition.infrastructureResourceGroupName`

Infrastructure resource group name. Required if zoneRedundant is set to true to be WAF compliant.

- Required: No
- Type: string

### Parameter: `containerAppEnvDefinition.infrastructureSubnetResourceId`

Resource ID of the subnet for infrastructure components. Required if "internal" is true. Required if zoneRedundant is set to true to be WAF compliant.

- Required: No
- Type: string

### Parameter: `containerAppEnvDefinition.internal`

Boolean indicating if only internal load balancer is used. Required if zoneRedundant is set to true to be WAF compliant.

- Required: No
- Type: bool

### Parameter: `containerAppEnvDefinition.platformReservedCidr`

Reserved IP range in CIDR notation for infrastructure. Required if zoneRedundant is set to true to be WAF compliant.

- Required: No
- Type: string

### Parameter: `containerAppEnvDefinition.platformReservedDnsIP`

Reserved DNS IP within platformReservedCidr for internal DNS. Required if zoneRedundant is set to true to be WAF compliant.

- Required: No
- Type: string

### Parameter: `containerAppEnvDefinition.workloadProfiles`

Workload profiles for the Managed Environment. Required if zoneRedundant is set to true to be WAF compliant.

- Required: No
- Type: array

### Parameter: `containerAppEnvDefinition.appInsightsConnectionString`

Application Insights connection string.

- Required: No
- Type: securestring

### Parameter: `containerAppEnvDefinition.appLogsConfiguration`

App Logs configuration for the Managed Environment.

- Required: No
- Type: object

**Conditional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`logAnalyticsConfiguration`](#parameter-containerappenvdefinitionapplogsconfigurationloganalyticsconfiguration) | object | Log Analytics configuration. Required if destination is log-analytics. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`destination`](#parameter-containerappenvdefinitionapplogsconfigurationdestination) | string | Destination of the logs. Allowed values: azure-monitor, log-analytics, none. |

### Parameter: `containerAppEnvDefinition.appLogsConfiguration.logAnalyticsConfiguration`

Log Analytics configuration. Required if destination is log-analytics.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`customerId`](#parameter-containerappenvdefinitionapplogsconfigurationloganalyticsconfigurationcustomerid) | string | Log Analytics Workspace ID. |
| [`sharedKey`](#parameter-containerappenvdefinitionapplogsconfigurationloganalyticsconfigurationsharedkey) | securestring | Shared key of the Log Analytics workspace. |

### Parameter: `containerAppEnvDefinition.appLogsConfiguration.logAnalyticsConfiguration.customerId`

Log Analytics Workspace ID.

- Required: Yes
- Type: string

### Parameter: `containerAppEnvDefinition.appLogsConfiguration.logAnalyticsConfiguration.sharedKey`

Shared key of the Log Analytics workspace.

- Required: Yes
- Type: securestring

### Parameter: `containerAppEnvDefinition.appLogsConfiguration.destination`

Destination of the logs. Allowed values: azure-monitor, log-analytics, none.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'azure-monitor'
    'log-analytics'
    'none'
  ]
  ```

### Parameter: `containerAppEnvDefinition.certificate`

Managed Environment Certificate configuration.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`certificateKeyVaultProperties`](#parameter-containerappenvdefinitioncertificatecertificatekeyvaultproperties) | object | Key Vault reference for certificate. |
| [`certificatePassword`](#parameter-containerappenvdefinitioncertificatecertificatepassword) | string | Certificate password. |
| [`certificateType`](#parameter-containerappenvdefinitioncertificatecertificatetype) | string | Certificate type. Allowed values: ImagePullTrustedCA, ServerSSLCertificate. |
| [`certificateValue`](#parameter-containerappenvdefinitioncertificatecertificatevalue) | string | Certificate value (PFX or PEM). |
| [`name`](#parameter-containerappenvdefinitioncertificatename) | string | Certificate name. |

### Parameter: `containerAppEnvDefinition.certificate.certificateKeyVaultProperties`

Key Vault reference for certificate.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`identityResourceId`](#parameter-containerappenvdefinitioncertificatecertificatekeyvaultpropertiesidentityresourceid) | string | Identity resource ID used to access Key Vault. |
| [`keyVaultUrl`](#parameter-containerappenvdefinitioncertificatecertificatekeyvaultpropertieskeyvaulturl) | string | Key Vault URL referencing the certificate. |

### Parameter: `containerAppEnvDefinition.certificate.certificateKeyVaultProperties.identityResourceId`

Identity resource ID used to access Key Vault.

- Required: Yes
- Type: string

### Parameter: `containerAppEnvDefinition.certificate.certificateKeyVaultProperties.keyVaultUrl`

Key Vault URL referencing the certificate.

- Required: Yes
- Type: string

### Parameter: `containerAppEnvDefinition.certificate.certificatePassword`

Certificate password.

- Required: No
- Type: string

### Parameter: `containerAppEnvDefinition.certificate.certificateType`

Certificate type. Allowed values: ImagePullTrustedCA, ServerSSLCertificate.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'ImagePullTrustedCA'
    'ServerSSLCertificate'
  ]
  ```

### Parameter: `containerAppEnvDefinition.certificate.certificateValue`

Certificate value (PFX or PEM).

- Required: No
- Type: string

### Parameter: `containerAppEnvDefinition.certificate.name`

Certificate name.

- Required: No
- Type: string

### Parameter: `containerAppEnvDefinition.certificatePassword`

Password of the certificate used by the custom domain.

- Required: No
- Type: securestring

### Parameter: `containerAppEnvDefinition.certificateValue`

Certificate to use for the custom domain (PFX or PEM).

- Required: No
- Type: securestring

### Parameter: `containerAppEnvDefinition.daprAIConnectionString`

Application Insights connection string for Dapr telemetry.

- Required: No
- Type: securestring

### Parameter: `containerAppEnvDefinition.daprAIInstrumentationKey`

Azure Monitor instrumentation key for Dapr telemetry.

- Required: No
- Type: securestring

### Parameter: `containerAppEnvDefinition.dnsSuffix`

DNS suffix for the environment domain.

- Required: No
- Type: string

### Parameter: `containerAppEnvDefinition.enableTelemetry`

Enable or disable telemetry for the module. Default is true.

- Required: No
- Type: bool

### Parameter: `containerAppEnvDefinition.location`

Location for all resources. Default is resourceGroup().location.

- Required: No
- Type: string

### Parameter: `containerAppEnvDefinition.lock`

Lock settings for the Managed Environment.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-containerappenvdefinitionlockkind) | string | Lock type. Allowed values: CanNotDelete, None, ReadOnly. |
| [`name`](#parameter-containerappenvdefinitionlockname) | string | Lock name. |
| [`notes`](#parameter-containerappenvdefinitionlocknotes) | string | Lock notes. |

### Parameter: `containerAppEnvDefinition.lock.kind`

Lock type. Allowed values: CanNotDelete, None, ReadOnly.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `containerAppEnvDefinition.lock.name`

Lock name.

- Required: No
- Type: string

### Parameter: `containerAppEnvDefinition.lock.notes`

Lock notes.

- Required: No
- Type: string

### Parameter: `containerAppEnvDefinition.managedIdentities`

Managed identity configuration for the Managed Environment.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`systemAssigned`](#parameter-containerappenvdefinitionmanagedidentitiessystemassigned) | bool | Enable system-assigned managed identity. |
| [`userAssignedResourceIds`](#parameter-containerappenvdefinitionmanagedidentitiesuserassignedresourceids) | array | User-assigned identity resource IDs. Required if user-assigned identity is used for encryption. |

### Parameter: `containerAppEnvDefinition.managedIdentities.systemAssigned`

Enable system-assigned managed identity.

- Required: No
- Type: bool

### Parameter: `containerAppEnvDefinition.managedIdentities.userAssignedResourceIds`

User-assigned identity resource IDs. Required if user-assigned identity is used for encryption.

- Required: No
- Type: array

### Parameter: `containerAppEnvDefinition.openTelemetryConfiguration`

Open Telemetry configuration.

- Required: No
- Type: object

### Parameter: `containerAppEnvDefinition.peerTrafficEncryption`

Whether peer traffic encryption is enabled. Default is true.

- Required: No
- Type: bool

### Parameter: `containerAppEnvDefinition.publicNetworkAccess`

Whether to allow or block public network traffic. Allowed values: Disabled, Enabled.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Disabled'
    'Enabled'
  ]
  ```

### Parameter: `containerAppEnvDefinition.roleAssignments`

Role assignments to create for the Managed Environment.

- Required: No
- Type: array

### Parameter: `containerAppEnvDefinition.storages`

List of storages to mount on the environment.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`accessMode`](#parameter-containerappenvdefinitionstoragesaccessmode) | string | Access mode for storage. Allowed values: ReadOnly, ReadWrite. |
| [`kind`](#parameter-containerappenvdefinitionstorageskind) | string | Type of storage. Allowed values: NFS, SMB. |
| [`shareName`](#parameter-containerappenvdefinitionstoragessharename) | string | File share name. |
| [`storageAccountName`](#parameter-containerappenvdefinitionstoragesstorageaccountname) | string | Storage account name. |

### Parameter: `containerAppEnvDefinition.storages.accessMode`

Access mode for storage. Allowed values: ReadOnly, ReadWrite.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'ReadOnly'
    'ReadWrite'
  ]
  ```

### Parameter: `containerAppEnvDefinition.storages.kind`

Type of storage. Allowed values: NFS, SMB.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'NFS'
    'SMB'
  ]
  ```

### Parameter: `containerAppEnvDefinition.storages.shareName`

File share name.

- Required: Yes
- Type: string

### Parameter: `containerAppEnvDefinition.storages.storageAccountName`

Storage account name.

- Required: Yes
- Type: string

### Parameter: `containerAppEnvDefinition.tags`

Tags to apply to the Managed Environment.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-containerappenvdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `containerAppEnvDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `containerAppEnvDefinition.zoneRedundant`

Whether the Managed Environment is zone redundant. Default is true.

- Required: No
- Type: bool

### Parameter: `containerRegistryDefinition`

Container Registry configuration. Required if deployGenAiAppBackingServices is true, deployToggles.containerRegistry is true, and resourceIds.containerRegistryResourceId is empty.

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      name: ''
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-containerregistrydefinitionname) | string | Name of your Azure Container Registry. |

**Conditional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`dataEndpointEnabled`](#parameter-containerregistrydefinitiondataendpointenabled) | bool | Enable a single data endpoint per region (Premium only). Default is false. Required if acrSku is Premium. |
| [`networkRuleSetIpRules`](#parameter-containerregistrydefinitionnetworkrulesetiprules) | array | IP ACL rules (Premium only). Required if acrSku is Premium. |
| [`privateEndpoints`](#parameter-containerregistrydefinitionprivateendpoints) | array | Private endpoint configuration (Premium only). Required if acrSku is Premium. |
| [`publicNetworkAccess`](#parameter-containerregistrydefinitionpublicnetworkaccess) | string | Public network access (Premium only). Disabled by default if private endpoints are set and no IP rules). Required if acrSku is Premium. |
| [`quarantinePolicyStatus`](#parameter-containerregistrydefinitionquarantinepolicystatus) | string | Quarantine policy status (Premium only). Default is disabled. Required if acrSku is Premium. |
| [`trustPolicyStatus`](#parameter-containerregistrydefinitiontrustpolicystatus) | string | Trust policy status (Premium only). Default is disabled. Required if acrSku is Premium. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`acrAdminUserEnabled`](#parameter-containerregistrydefinitionacradminuserenabled) | bool | Enable admin user that has push/pull permission to the registry. Default is false. |
| [`acrSku`](#parameter-containerregistrydefinitionacrsku) | string | Tier of your Azure Container Registry. Default is Premium. |
| [`anonymousPullEnabled`](#parameter-containerregistrydefinitionanonymouspullenabled) | bool | Enables registry-wide pull from unauthenticated clients (preview, Standard/Premium only). Default is false. |
| [`azureADAuthenticationAsArmPolicyStatus`](#parameter-containerregistrydefinitionazureadauthenticationasarmpolicystatus) | string | Indicates whether the policy for using ARM audience token is enabled. Default is enabled. |
| [`cacheRules`](#parameter-containerregistrydefinitioncacherules) | array | Array of Cache Rules. |
| [`credentialSets`](#parameter-containerregistrydefinitioncredentialsets) | array | Array of Credential Sets. |
| [`customerManagedKey`](#parameter-containerregistrydefinitioncustomermanagedkey) | object | Customer managed key definition. |
| [`diagnosticSettings`](#parameter-containerregistrydefinitiondiagnosticsettings) | array | Diagnostic settings for the service. |
| [`enableTelemetry`](#parameter-containerregistrydefinitionenabletelemetry) | bool | Enable or disable telemetry for the module. Default is true. |
| [`exportPolicyStatus`](#parameter-containerregistrydefinitionexportpolicystatus) | string | Export policy status. Default is disabled. |
| [`location`](#parameter-containerregistrydefinitionlocation) | string | Location for all resources. Default is resourceGroup().location. |
| [`lock`](#parameter-containerregistrydefinitionlock) | object | Lock settings. |
| [`managedIdentities`](#parameter-containerregistrydefinitionmanagedidentities) | object | Managed identity definition for the registry. |
| [`networkRuleBypassOptions`](#parameter-containerregistrydefinitionnetworkrulebypassoptions) | string | Network rule bypass options. Default is AzureServices. |
| [`networkRuleSetDefaultAction`](#parameter-containerregistrydefinitionnetworkrulesetdefaultaction) | string | Default action when no network rule matches. Default is Deny. |
| [`replications`](#parameter-containerregistrydefinitionreplications) | array | Replications to create. |
| [`retentionPolicyDays`](#parameter-containerregistrydefinitionretentionpolicydays) | int | Number of days to retain untagged manifests. Default is 15. |
| [`retentionPolicyStatus`](#parameter-containerregistrydefinitionretentionpolicystatus) | string | Retention policy status. Default is enabled. |
| [`roleAssignments`](#parameter-containerregistrydefinitionroleassignments) | array | Role assignments for this registry. |
| [`scopeMaps`](#parameter-containerregistrydefinitionscopemaps) | array | Scope maps configuration. |
| [`softDeletePolicyDays`](#parameter-containerregistrydefinitionsoftdeletepolicydays) | int | Number of days after which soft-deleted items are permanently deleted. Default is 7. |
| [`softDeletePolicyStatus`](#parameter-containerregistrydefinitionsoftdeletepolicystatus) | string | Soft delete policy status. Default is disabled. |
| [`tags`](#parameter-containerregistrydefinitiontags) | object | Resource tags. |
| [`webhooks`](#parameter-containerregistrydefinitionwebhooks) | array | Webhooks to create. |
| [`zoneRedundancy`](#parameter-containerregistrydefinitionzoneredundancy) | string | Zone redundancy setting. Default is Enabled. Conditional: requires acrSku=Premium. |

### Parameter: `containerRegistryDefinition.name`

Name of your Azure Container Registry.

- Required: Yes
- Type: string

### Parameter: `containerRegistryDefinition.dataEndpointEnabled`

Enable a single data endpoint per region (Premium only). Default is false. Required if acrSku is Premium.

- Required: No
- Type: bool

### Parameter: `containerRegistryDefinition.networkRuleSetIpRules`

IP ACL rules (Premium only). Required if acrSku is Premium.

- Required: No
- Type: array

### Parameter: `containerRegistryDefinition.privateEndpoints`

Private endpoint configuration (Premium only). Required if acrSku is Premium.

- Required: No
- Type: array

### Parameter: `containerRegistryDefinition.publicNetworkAccess`

Public network access (Premium only). Disabled by default if private endpoints are set and no IP rules). Required if acrSku is Premium.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Disabled'
    'Enabled'
  ]
  ```

### Parameter: `containerRegistryDefinition.quarantinePolicyStatus`

Quarantine policy status (Premium only). Default is disabled. Required if acrSku is Premium.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'disabled'
    'enabled'
  ]
  ```

### Parameter: `containerRegistryDefinition.trustPolicyStatus`

Trust policy status (Premium only). Default is disabled. Required if acrSku is Premium.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'disabled'
    'enabled'
  ]
  ```

### Parameter: `containerRegistryDefinition.acrAdminUserEnabled`

Enable admin user that has push/pull permission to the registry. Default is false.

- Required: No
- Type: bool

### Parameter: `containerRegistryDefinition.acrSku`

Tier of your Azure Container Registry. Default is Premium.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Basic'
    'Premium'
    'Standard'
  ]
  ```

### Parameter: `containerRegistryDefinition.anonymousPullEnabled`

Enables registry-wide pull from unauthenticated clients (preview, Standard/Premium only). Default is false.

- Required: No
- Type: bool

### Parameter: `containerRegistryDefinition.azureADAuthenticationAsArmPolicyStatus`

Indicates whether the policy for using ARM audience token is enabled. Default is enabled.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'disabled'
    'enabled'
  ]
  ```

### Parameter: `containerRegistryDefinition.cacheRules`

Array of Cache Rules.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`sourceRepository`](#parameter-containerregistrydefinitioncacherulessourcerepository) | string | Source repository pulled from upstream. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`credentialSetResourceId`](#parameter-containerregistrydefinitioncacherulescredentialsetresourceid) | string | Resource ID of the credential store associated with the cache rule. |
| [`name`](#parameter-containerregistrydefinitioncacherulesname) | string | Name of the cache rule. Defaults to the source repository name if not set. |
| [`targetRepository`](#parameter-containerregistrydefinitioncacherulestargetrepository) | string | Target repository specified in docker pull command. |

### Parameter: `containerRegistryDefinition.cacheRules.sourceRepository`

Source repository pulled from upstream.

- Required: Yes
- Type: string

### Parameter: `containerRegistryDefinition.cacheRules.credentialSetResourceId`

Resource ID of the credential store associated with the cache rule.

- Required: No
- Type: string

### Parameter: `containerRegistryDefinition.cacheRules.name`

Name of the cache rule. Defaults to the source repository name if not set.

- Required: No
- Type: string

### Parameter: `containerRegistryDefinition.cacheRules.targetRepository`

Target repository specified in docker pull command.

- Required: No
- Type: string

### Parameter: `containerRegistryDefinition.credentialSets`

Array of Credential Sets.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`authCredentials`](#parameter-containerregistrydefinitioncredentialsetsauthcredentials) | array | List of authentication credentials (primary and optional secondary). |
| [`loginServer`](#parameter-containerregistrydefinitioncredentialsetsloginserver) | string | Login server for which the credentials are stored. |
| [`name`](#parameter-containerregistrydefinitioncredentialsetsname) | string | Name of the credential set. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`managedIdentities`](#parameter-containerregistrydefinitioncredentialsetsmanagedidentities) | object | Managed identity definition for this credential set. |

### Parameter: `containerRegistryDefinition.credentialSets.authCredentials`

List of authentication credentials (primary and optional secondary).

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-containerregistrydefinitioncredentialsetsauthcredentialsname) | string | Name of the credential. |
| [`passwordSecretIdentifier`](#parameter-containerregistrydefinitioncredentialsetsauthcredentialspasswordsecretidentifier) | string | KeyVault Secret URI for the password. |
| [`usernameSecretIdentifier`](#parameter-containerregistrydefinitioncredentialsetsauthcredentialsusernamesecretidentifier) | string | KeyVault Secret URI for the username. |

### Parameter: `containerRegistryDefinition.credentialSets.authCredentials.name`

Name of the credential.

- Required: Yes
- Type: string

### Parameter: `containerRegistryDefinition.credentialSets.authCredentials.passwordSecretIdentifier`

KeyVault Secret URI for the password.

- Required: Yes
- Type: string

### Parameter: `containerRegistryDefinition.credentialSets.authCredentials.usernameSecretIdentifier`

KeyVault Secret URI for the username.

- Required: Yes
- Type: string

### Parameter: `containerRegistryDefinition.credentialSets.loginServer`

Login server for which the credentials are stored.

- Required: Yes
- Type: string

### Parameter: `containerRegistryDefinition.credentialSets.name`

Name of the credential set.

- Required: Yes
- Type: string

### Parameter: `containerRegistryDefinition.credentialSets.managedIdentities`

Managed identity definition for this credential set.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`systemAssigned`](#parameter-containerregistrydefinitioncredentialsetsmanagedidentitiessystemassigned) | bool | Enables system-assigned managed identity. |

### Parameter: `containerRegistryDefinition.credentialSets.managedIdentities.systemAssigned`

Enables system-assigned managed identity.

- Required: No
- Type: bool

### Parameter: `containerRegistryDefinition.customerManagedKey`

Customer managed key definition.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`keyName`](#parameter-containerregistrydefinitioncustomermanagedkeykeyname) | string | Name of the key. |
| [`keyVaultResourceId`](#parameter-containerregistrydefinitioncustomermanagedkeykeyvaultresourceid) | string | Resource ID of the Key Vault. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`autoRotationEnabled`](#parameter-containerregistrydefinitioncustomermanagedkeyautorotationenabled) | bool | Enable or disable auto-rotation to the latest version. Default is true. |
| [`keyVersion`](#parameter-containerregistrydefinitioncustomermanagedkeykeyversion) | string | Key version. Used if autoRotationEnabled=false. |
| [`userAssignedIdentityResourceId`](#parameter-containerregistrydefinitioncustomermanagedkeyuserassignedidentityresourceid) | string | User-assigned identity for fetching the key. Required if no system-assigned identity. |

### Parameter: `containerRegistryDefinition.customerManagedKey.keyName`

Name of the key.

- Required: Yes
- Type: string

### Parameter: `containerRegistryDefinition.customerManagedKey.keyVaultResourceId`

Resource ID of the Key Vault.

- Required: Yes
- Type: string

### Parameter: `containerRegistryDefinition.customerManagedKey.autoRotationEnabled`

Enable or disable auto-rotation to the latest version. Default is true.

- Required: No
- Type: bool

### Parameter: `containerRegistryDefinition.customerManagedKey.keyVersion`

Key version. Used if autoRotationEnabled=false.

- Required: No
- Type: string

### Parameter: `containerRegistryDefinition.customerManagedKey.userAssignedIdentityResourceId`

User-assigned identity for fetching the key. Required if no system-assigned identity.

- Required: No
- Type: string

### Parameter: `containerRegistryDefinition.diagnosticSettings`

Diagnostic settings for the service.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`eventHubAuthorizationRuleResourceId`](#parameter-containerregistrydefinitiondiagnosticsettingseventhubauthorizationruleresourceid) | string | Event Hub authorization rule resource ID. |
| [`eventHubName`](#parameter-containerregistrydefinitiondiagnosticsettingseventhubname) | string | Event Hub name for logs. |
| [`logAnalyticsDestinationType`](#parameter-containerregistrydefinitiondiagnosticsettingsloganalyticsdestinationtype) | string | Destination type for Log Analytics (AzureDiagnostics or Dedicated). |
| [`logCategoriesAndGroups`](#parameter-containerregistrydefinitiondiagnosticsettingslogcategoriesandgroups) | array | Log categories and groups. |
| [`marketplacePartnerResourceId`](#parameter-containerregistrydefinitiondiagnosticsettingsmarketplacepartnerresourceid) | string | Marketplace partner resource ID. |
| [`metricCategories`](#parameter-containerregistrydefinitiondiagnosticsettingsmetriccategories) | array | Metric categories. |
| [`name`](#parameter-containerregistrydefinitiondiagnosticsettingsname) | string | Name of the diagnostic setting. |
| [`storageAccountResourceId`](#parameter-containerregistrydefinitiondiagnosticsettingsstorageaccountresourceid) | string | Storage account resource ID. |
| [`workspaceResourceId`](#parameter-containerregistrydefinitiondiagnosticsettingsworkspaceresourceid) | string | Log Analytics workspace resource ID. |

### Parameter: `containerRegistryDefinition.diagnosticSettings.eventHubAuthorizationRuleResourceId`

Event Hub authorization rule resource ID.

- Required: No
- Type: string

### Parameter: `containerRegistryDefinition.diagnosticSettings.eventHubName`

Event Hub name for logs.

- Required: No
- Type: string

### Parameter: `containerRegistryDefinition.diagnosticSettings.logAnalyticsDestinationType`

Destination type for Log Analytics (AzureDiagnostics or Dedicated).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'AzureDiagnostics'
    'Dedicated'
  ]
  ```

### Parameter: `containerRegistryDefinition.diagnosticSettings.logCategoriesAndGroups`

Log categories and groups.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-containerregistrydefinitiondiagnosticsettingslogcategoriesandgroupscategory) | string | Diagnostic log category. |
| [`categoryGroup`](#parameter-containerregistrydefinitiondiagnosticsettingslogcategoriesandgroupscategorygroup) | string | Diagnostic log category group. |
| [`enabled`](#parameter-containerregistrydefinitiondiagnosticsettingslogcategoriesandgroupsenabled) | bool | Enable or disable this category. Default is true. |

### Parameter: `containerRegistryDefinition.diagnosticSettings.logCategoriesAndGroups.category`

Diagnostic log category.

- Required: No
- Type: string

### Parameter: `containerRegistryDefinition.diagnosticSettings.logCategoriesAndGroups.categoryGroup`

Diagnostic log category group.

- Required: No
- Type: string

### Parameter: `containerRegistryDefinition.diagnosticSettings.logCategoriesAndGroups.enabled`

Enable or disable this category. Default is true.

- Required: No
- Type: bool

### Parameter: `containerRegistryDefinition.diagnosticSettings.marketplacePartnerResourceId`

Marketplace partner resource ID.

- Required: No
- Type: string

### Parameter: `containerRegistryDefinition.diagnosticSettings.metricCategories`

Metric categories.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-containerregistrydefinitiondiagnosticsettingsmetriccategoriescategory) | string | Diagnostic metric category. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enabled`](#parameter-containerregistrydefinitiondiagnosticsettingsmetriccategoriesenabled) | bool | Enable or disable this metric. Default is true. |

### Parameter: `containerRegistryDefinition.diagnosticSettings.metricCategories.category`

Diagnostic metric category.

- Required: Yes
- Type: string

### Parameter: `containerRegistryDefinition.diagnosticSettings.metricCategories.enabled`

Enable or disable this metric. Default is true.

- Required: No
- Type: bool

### Parameter: `containerRegistryDefinition.diagnosticSettings.name`

Name of the diagnostic setting.

- Required: No
- Type: string

### Parameter: `containerRegistryDefinition.diagnosticSettings.storageAccountResourceId`

Storage account resource ID.

- Required: No
- Type: string

### Parameter: `containerRegistryDefinition.diagnosticSettings.workspaceResourceId`

Log Analytics workspace resource ID.

- Required: No
- Type: string

### Parameter: `containerRegistryDefinition.enableTelemetry`

Enable or disable telemetry for the module. Default is true.

- Required: No
- Type: bool

### Parameter: `containerRegistryDefinition.exportPolicyStatus`

Export policy status. Default is disabled.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'disabled'
    'enabled'
  ]
  ```

### Parameter: `containerRegistryDefinition.location`

Location for all resources. Default is resourceGroup().location.

- Required: No
- Type: string

### Parameter: `containerRegistryDefinition.lock`

Lock settings.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-containerregistrydefinitionlockkind) | string | Type of lock (CanNotDelete, None, ReadOnly). |
| [`name`](#parameter-containerregistrydefinitionlockname) | string | Name of the lock. |
| [`notes`](#parameter-containerregistrydefinitionlocknotes) | string | Notes for the lock. |

### Parameter: `containerRegistryDefinition.lock.kind`

Type of lock (CanNotDelete, None, ReadOnly).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `containerRegistryDefinition.lock.name`

Name of the lock.

- Required: No
- Type: string

### Parameter: `containerRegistryDefinition.lock.notes`

Notes for the lock.

- Required: No
- Type: string

### Parameter: `containerRegistryDefinition.managedIdentities`

Managed identity definition for the registry.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`systemAssigned`](#parameter-containerregistrydefinitionmanagedidentitiessystemassigned) | bool | Enable system-assigned managed identity. |
| [`userAssignedResourceIds`](#parameter-containerregistrydefinitionmanagedidentitiesuserassignedresourceids) | array | User-assigned identity resource IDs. Required if user-assigned identity is used for encryption. |

### Parameter: `containerRegistryDefinition.managedIdentities.systemAssigned`

Enable system-assigned managed identity.

- Required: No
- Type: bool

### Parameter: `containerRegistryDefinition.managedIdentities.userAssignedResourceIds`

User-assigned identity resource IDs. Required if user-assigned identity is used for encryption.

- Required: No
- Type: array

### Parameter: `containerRegistryDefinition.networkRuleBypassOptions`

Network rule bypass options. Default is AzureServices.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'AzureServices'
    'None'
  ]
  ```

### Parameter: `containerRegistryDefinition.networkRuleSetDefaultAction`

Default action when no network rule matches. Default is Deny.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Allow'
    'Deny'
  ]
  ```

### Parameter: `containerRegistryDefinition.replications`

Replications to create.

- Required: No
- Type: array

### Parameter: `containerRegistryDefinition.retentionPolicyDays`

Number of days to retain untagged manifests. Default is 15.

- Required: No
- Type: int

### Parameter: `containerRegistryDefinition.retentionPolicyStatus`

Retention policy status. Default is enabled.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'disabled'
    'enabled'
  ]
  ```

### Parameter: `containerRegistryDefinition.roleAssignments`

Role assignments for this registry.

- Required: No
- Type: array

### Parameter: `containerRegistryDefinition.scopeMaps`

Scope maps configuration.

- Required: No
- Type: array

### Parameter: `containerRegistryDefinition.softDeletePolicyDays`

Number of days after which soft-deleted items are permanently deleted. Default is 7.

- Required: No
- Type: int

### Parameter: `containerRegistryDefinition.softDeletePolicyStatus`

Soft delete policy status. Default is disabled.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'disabled'
    'enabled'
  ]
  ```

### Parameter: `containerRegistryDefinition.tags`

Resource tags.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-containerregistrydefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `containerRegistryDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `containerRegistryDefinition.webhooks`

Webhooks to create.

- Required: No
- Type: array

### Parameter: `containerRegistryDefinition.zoneRedundancy`

Zone redundancy setting. Default is Enabled. Conditional: requires acrSku=Premium.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Disabled'
    'Enabled'
  ]
  ```

### Parameter: `cosmosDbDefinition`

Cosmos DB account configuration for the GenAI app. Required if deployGenAiAppBackingServices is true, deployToggles.cosmosDb is true, and resourceIds.dbAccountResourceId is empty.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-cosmosdbdefinitionname) | string | The name of the account. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`automaticFailover`](#parameter-cosmosdbdefinitionautomaticfailover) | bool | Enable automatic failover for regions. Defaults to true. |
| [`backupIntervalInMinutes`](#parameter-cosmosdbdefinitionbackupintervalinminutes) | int | Interval in minutes between two backups (periodic only). Defaults to 240. Range: 60–1440. |
| [`backupPolicyContinuousTier`](#parameter-cosmosdbdefinitionbackuppolicycontinuoustier) | string | Retention period for continuous mode backup. Default is Continuous30Days. Allowed values: Continuous30Days, Continuous7Days. |
| [`backupPolicyType`](#parameter-cosmosdbdefinitionbackuppolicytype) | string | Backup mode. Periodic must be used if multiple write locations are enabled. Default is Continuous. Allowed values: Continuous, Periodic. |
| [`backupRetentionIntervalInHours`](#parameter-cosmosdbdefinitionbackupretentionintervalinhours) | int | Time (hours) each backup is retained (periodic only). Default is 8. Range: 2–720. |
| [`backupStorageRedundancy`](#parameter-cosmosdbdefinitionbackupstorageredundancy) | string | Type of backup residency (periodic only). Default is Local. Allowed values: Geo, Local, Zone. |
| [`capabilitiesToAdd`](#parameter-cosmosdbdefinitioncapabilitiestoadd) | array | List of Cosmos DB specific capabilities to enable. |
| [`databaseAccountOfferType`](#parameter-cosmosdbdefinitiondatabaseaccountoffertype) | string | The offer type for the account. Default is Standard. Allowed value: Standard. |
| [`dataPlaneRoleAssignments`](#parameter-cosmosdbdefinitiondataplaneroleassignments) | array | Cosmos DB for NoSQL native role-based access control assignments. |
| [`dataPlaneRoleDefinitions`](#parameter-cosmosdbdefinitiondataplaneroledefinitions) | array | Cosmos DB for NoSQL native role-based access control definitions. |
| [`defaultConsistencyLevel`](#parameter-cosmosdbdefinitiondefaultconsistencylevel) | string | Default consistency level. Default is Session. Allowed values: BoundedStaleness, ConsistentPrefix, Eventual, Session, Strong. |
| [`diagnosticSettings`](#parameter-cosmosdbdefinitiondiagnosticsettings) | array | Diagnostic settings for the Cosmos DB account. |
| [`disableKeyBasedMetadataWriteAccess`](#parameter-cosmosdbdefinitiondisablekeybasedmetadatawriteaccess) | bool | Disable write operations on metadata resources via account keys. Default is true. |
| [`disableLocalAuthentication`](#parameter-cosmosdbdefinitiondisablelocalauthentication) | bool | Opt-out of local authentication, enforcing Microsoft Entra-only auth. Default is true. |
| [`enableAnalyticalStorage`](#parameter-cosmosdbdefinitionenableanalyticalstorage) | bool | Enable analytical storage. Default is false. |
| [`enableFreeTier`](#parameter-cosmosdbdefinitionenablefreetier) | bool | Enable Free Tier. Default is false. |
| [`enableMultipleWriteLocations`](#parameter-cosmosdbdefinitionenablemultiplewritelocations) | bool | Enable multiple write locations. Requires periodic backup. Default is false. |
| [`enableTelemetry`](#parameter-cosmosdbdefinitionenabletelemetry) | bool | Enable/Disable usage telemetry. Default is true. |
| [`failoverLocations`](#parameter-cosmosdbdefinitionfailoverlocations) | array | Failover locations configuration. |
| [`gremlinDatabases`](#parameter-cosmosdbdefinitiongremlindatabases) | array | Gremlin database configurations. |
| [`location`](#parameter-cosmosdbdefinitionlocation) | string | Location for the account. Defaults to resourceGroup().location. |
| [`lock`](#parameter-cosmosdbdefinitionlock) | object | Lock settings for the Cosmos DB account. |
| [`managedIdentities`](#parameter-cosmosdbdefinitionmanagedidentities) | object | Managed identity configuration. |
| [`maxIntervalInSeconds`](#parameter-cosmosdbdefinitionmaxintervalinseconds) | int | Maximum lag time in seconds (BoundedStaleness). Defaults to 300. |
| [`maxStalenessPrefix`](#parameter-cosmosdbdefinitionmaxstalenessprefix) | int | Maximum stale requests (BoundedStaleness). Defaults to 100000. |
| [`minimumTlsVersion`](#parameter-cosmosdbdefinitionminimumtlsversion) | string | Minimum allowed TLS version. Default is Tls12. |
| [`mongodbDatabases`](#parameter-cosmosdbdefinitionmongodbdatabases) | array | MongoDB database configurations. |
| [`networkRestrictions`](#parameter-cosmosdbdefinitionnetworkrestrictions) | object | Network restrictions for the Cosmos DB account. |
| [`privateEndpoints`](#parameter-cosmosdbdefinitionprivateendpoints) | array | Private endpoint configurations for secure connectivity. |
| [`roleAssignments`](#parameter-cosmosdbdefinitionroleassignments) | array | Control plane Azure role assignments for Cosmos DB. |
| [`serverVersion`](#parameter-cosmosdbdefinitionserverversion) | string | MongoDB server version (if using MongoDB API). Default is 4.2. |
| [`sqlDatabases`](#parameter-cosmosdbdefinitionsqldatabases) | array | SQL (NoSQL) database configurations. |
| [`tables`](#parameter-cosmosdbdefinitiontables) | array | Table API database configurations. |
| [`tags`](#parameter-cosmosdbdefinitiontags) | object | Tags to apply to the Cosmos DB account. |
| [`totalThroughputLimit`](#parameter-cosmosdbdefinitiontotalthroughputlimit) | int | Total throughput limit in RU/s. Default is unlimited (-1). |
| [`zoneRedundant`](#parameter-cosmosdbdefinitionzoneredundant) | bool | Zone redundancy for single-region accounts. Default is true. |

### Parameter: `cosmosDbDefinition.name`

The name of the account.

- Required: Yes
- Type: string

### Parameter: `cosmosDbDefinition.automaticFailover`

Enable automatic failover for regions. Defaults to true.

- Required: No
- Type: bool

### Parameter: `cosmosDbDefinition.backupIntervalInMinutes`

Interval in minutes between two backups (periodic only). Defaults to 240. Range: 60–1440.

- Required: No
- Type: int

### Parameter: `cosmosDbDefinition.backupPolicyContinuousTier`

Retention period for continuous mode backup. Default is Continuous30Days. Allowed values: Continuous30Days, Continuous7Days.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Continuous30Days'
    'Continuous7Days'
  ]
  ```

### Parameter: `cosmosDbDefinition.backupPolicyType`

Backup mode. Periodic must be used if multiple write locations are enabled. Default is Continuous. Allowed values: Continuous, Periodic.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Continuous'
    'Periodic'
  ]
  ```

### Parameter: `cosmosDbDefinition.backupRetentionIntervalInHours`

Time (hours) each backup is retained (periodic only). Default is 8. Range: 2–720.

- Required: No
- Type: int

### Parameter: `cosmosDbDefinition.backupStorageRedundancy`

Type of backup residency (periodic only). Default is Local. Allowed values: Geo, Local, Zone.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Geo'
    'Local'
    'Zone'
  ]
  ```

### Parameter: `cosmosDbDefinition.capabilitiesToAdd`

List of Cosmos DB specific capabilities to enable.

- Required: No
- Type: array
- Allowed:
  ```Bicep
  [
    'DeleteAllItemsByPartitionKey'
    'DisableRateLimitingResponses'
    'EnableCassandra'
    'EnableGremlin'
    'EnableMaterializedViews'
    'EnableMongo'
    'EnableNoSQLFullTextSearch'
    'EnableNoSQLVectorSearch'
    'EnableServerless'
    'EnableTable'
  ]
  ```

### Parameter: `cosmosDbDefinition.databaseAccountOfferType`

The offer type for the account. Default is Standard. Allowed value: Standard.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Standard'
  ]
  ```

### Parameter: `cosmosDbDefinition.dataPlaneRoleAssignments`

Cosmos DB for NoSQL native role-based access control assignments.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-cosmosdbdefinitiondataplaneroleassignmentsprincipalid) | string | The Microsoft Entra principal ID granted access by this assignment. |
| [`roleDefinitionId`](#parameter-cosmosdbdefinitiondataplaneroleassignmentsroledefinitionid) | string | The unique identifier of the NoSQL native role definition. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-cosmosdbdefinitiondataplaneroleassignmentsname) | string | Unique name of the role assignment. |

### Parameter: `cosmosDbDefinition.dataPlaneRoleAssignments.principalId`

The Microsoft Entra principal ID granted access by this assignment.

- Required: Yes
- Type: string

### Parameter: `cosmosDbDefinition.dataPlaneRoleAssignments.roleDefinitionId`

The unique identifier of the NoSQL native role definition.

- Required: Yes
- Type: string

### Parameter: `cosmosDbDefinition.dataPlaneRoleAssignments.name`

Unique name of the role assignment.

- Required: No
- Type: string

### Parameter: `cosmosDbDefinition.dataPlaneRoleDefinitions`

Cosmos DB for NoSQL native role-based access control definitions.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`roleName`](#parameter-cosmosdbdefinitiondataplaneroledefinitionsrolename) | string | A user-friendly unique name for the role definition. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`assignableScopes`](#parameter-cosmosdbdefinitiondataplaneroledefinitionsassignablescopes) | array | Assignable scopes for the definition. |
| [`assignments`](#parameter-cosmosdbdefinitiondataplaneroledefinitionsassignments) | array | Assignments associated with this role definition. |
| [`dataActions`](#parameter-cosmosdbdefinitiondataplaneroledefinitionsdataactions) | array | Array of allowed data actions. |
| [`name`](#parameter-cosmosdbdefinitiondataplaneroledefinitionsname) | string | Unique identifier for the role definition. |

### Parameter: `cosmosDbDefinition.dataPlaneRoleDefinitions.roleName`

A user-friendly unique name for the role definition.

- Required: Yes
- Type: string

### Parameter: `cosmosDbDefinition.dataPlaneRoleDefinitions.assignableScopes`

Assignable scopes for the definition.

- Required: No
- Type: array

### Parameter: `cosmosDbDefinition.dataPlaneRoleDefinitions.assignments`

Assignments associated with this role definition.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-cosmosdbdefinitiondataplaneroledefinitionsassignmentsprincipalid) | string | The Microsoft Entra principal ID granted access by this role assignment. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-cosmosdbdefinitiondataplaneroledefinitionsassignmentsname) | string | Unique identifier name for the role assignment. |

### Parameter: `cosmosDbDefinition.dataPlaneRoleDefinitions.assignments.principalId`

The Microsoft Entra principal ID granted access by this role assignment.

- Required: Yes
- Type: string

### Parameter: `cosmosDbDefinition.dataPlaneRoleDefinitions.assignments.name`

Unique identifier name for the role assignment.

- Required: No
- Type: string

### Parameter: `cosmosDbDefinition.dataPlaneRoleDefinitions.dataActions`

Array of allowed data actions.

- Required: No
- Type: array

### Parameter: `cosmosDbDefinition.dataPlaneRoleDefinitions.name`

Unique identifier for the role definition.

- Required: No
- Type: string

### Parameter: `cosmosDbDefinition.defaultConsistencyLevel`

Default consistency level. Default is Session. Allowed values: BoundedStaleness, ConsistentPrefix, Eventual, Session, Strong.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'BoundedStaleness'
    'ConsistentPrefix'
    'Eventual'
    'Session'
    'Strong'
  ]
  ```

### Parameter: `cosmosDbDefinition.diagnosticSettings`

Diagnostic settings for the Cosmos DB account.

- Required: No
- Type: array

### Parameter: `cosmosDbDefinition.disableKeyBasedMetadataWriteAccess`

Disable write operations on metadata resources via account keys. Default is true.

- Required: No
- Type: bool

### Parameter: `cosmosDbDefinition.disableLocalAuthentication`

Opt-out of local authentication, enforcing Microsoft Entra-only auth. Default is true.

- Required: No
- Type: bool

### Parameter: `cosmosDbDefinition.enableAnalyticalStorage`

Enable analytical storage. Default is false.

- Required: No
- Type: bool

### Parameter: `cosmosDbDefinition.enableFreeTier`

Enable Free Tier. Default is false.

- Required: No
- Type: bool

### Parameter: `cosmosDbDefinition.enableMultipleWriteLocations`

Enable multiple write locations. Requires periodic backup. Default is false.

- Required: No
- Type: bool

### Parameter: `cosmosDbDefinition.enableTelemetry`

Enable/Disable usage telemetry. Default is true.

- Required: No
- Type: bool

### Parameter: `cosmosDbDefinition.failoverLocations`

Failover locations configuration.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`failoverPriority`](#parameter-cosmosdbdefinitionfailoverlocationsfailoverpriority) | int | Failover priority. 0 = write region. |
| [`locationName`](#parameter-cosmosdbdefinitionfailoverlocationslocationname) | string | Region name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`isZoneRedundant`](#parameter-cosmosdbdefinitionfailoverlocationsiszoneredundant) | bool | Zone redundancy flag for region. Default is true. |

### Parameter: `cosmosDbDefinition.failoverLocations.failoverPriority`

Failover priority. 0 = write region.

- Required: Yes
- Type: int

### Parameter: `cosmosDbDefinition.failoverLocations.locationName`

Region name.

- Required: Yes
- Type: string

### Parameter: `cosmosDbDefinition.failoverLocations.isZoneRedundant`

Zone redundancy flag for region. Default is true.

- Required: No
- Type: bool

### Parameter: `cosmosDbDefinition.gremlinDatabases`

Gremlin database configurations.

- Required: No
- Type: array

### Parameter: `cosmosDbDefinition.location`

Location for the account. Defaults to resourceGroup().location.

- Required: No
- Type: string

### Parameter: `cosmosDbDefinition.lock`

Lock settings for the Cosmos DB account.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-cosmosdbdefinitionlockkind) | string | Lock type. Allowed values: CanNotDelete, None, ReadOnly. |
| [`name`](#parameter-cosmosdbdefinitionlockname) | string | Lock name. |
| [`notes`](#parameter-cosmosdbdefinitionlocknotes) | string | Lock notes. |

### Parameter: `cosmosDbDefinition.lock.kind`

Lock type. Allowed values: CanNotDelete, None, ReadOnly.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `cosmosDbDefinition.lock.name`

Lock name.

- Required: No
- Type: string

### Parameter: `cosmosDbDefinition.lock.notes`

Lock notes.

- Required: No
- Type: string

### Parameter: `cosmosDbDefinition.managedIdentities`

Managed identity configuration.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`systemAssigned`](#parameter-cosmosdbdefinitionmanagedidentitiessystemassigned) | bool | Enables system-assigned identity. |
| [`userAssignedResourceIds`](#parameter-cosmosdbdefinitionmanagedidentitiesuserassignedresourceids) | array | User-assigned identity resource IDs. |

### Parameter: `cosmosDbDefinition.managedIdentities.systemAssigned`

Enables system-assigned identity.

- Required: No
- Type: bool

### Parameter: `cosmosDbDefinition.managedIdentities.userAssignedResourceIds`

User-assigned identity resource IDs.

- Required: No
- Type: array

### Parameter: `cosmosDbDefinition.maxIntervalInSeconds`

Maximum lag time in seconds (BoundedStaleness). Defaults to 300.

- Required: No
- Type: int

### Parameter: `cosmosDbDefinition.maxStalenessPrefix`

Maximum stale requests (BoundedStaleness). Defaults to 100000.

- Required: No
- Type: int

### Parameter: `cosmosDbDefinition.minimumTlsVersion`

Minimum allowed TLS version. Default is Tls12.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Tls12'
  ]
  ```

### Parameter: `cosmosDbDefinition.mongodbDatabases`

MongoDB database configurations.

- Required: No
- Type: array

### Parameter: `cosmosDbDefinition.networkRestrictions`

Network restrictions for the Cosmos DB account.

- Required: No
- Type: object

### Parameter: `cosmosDbDefinition.privateEndpoints`

Private endpoint configurations for secure connectivity.

- Required: No
- Type: array

### Parameter: `cosmosDbDefinition.roleAssignments`

Control plane Azure role assignments for Cosmos DB.

- Required: No
- Type: array

### Parameter: `cosmosDbDefinition.serverVersion`

MongoDB server version (if using MongoDB API). Default is 4.2.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '3.2'
    '3.6'
    '4.0'
    '4.2'
    '5.0'
    '6.0'
    '7.0'
  ]
  ```

### Parameter: `cosmosDbDefinition.sqlDatabases`

SQL (NoSQL) database configurations.

- Required: No
- Type: array

### Parameter: `cosmosDbDefinition.tables`

Table API database configurations.

- Required: No
- Type: array

### Parameter: `cosmosDbDefinition.tags`

Tags to apply to the Cosmos DB account.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-cosmosdbdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `cosmosDbDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `cosmosDbDefinition.totalThroughputLimit`

Total throughput limit in RU/s. Default is unlimited (-1).

- Required: No
- Type: int

### Parameter: `cosmosDbDefinition.zoneRedundant`

Zone redundancy for single-region accounts. Default is true.

- Required: No
- Type: bool

### Parameter: `firewallDefinition`

Azure Firewall configuration. Required if deployToggles.firewall is true and resourceIds.firewallResourceId is empty.

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      name: ''
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-firewalldefinitionname) | string | Name of the Azure Firewall. |

**Conditional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`hubIPAddresses`](#parameter-firewalldefinitionhubipaddresses) | object | IP addresses associated with Azure Firewall. Required if virtualHubId is supplied. |
| [`virtualHubResourceId`](#parameter-firewalldefinitionvirtualhubresourceid) | string | The virtualHub resource ID to which the firewall belongs. Required if virtualNetworkId is empty. |
| [`virtualNetworkResourceId`](#parameter-firewalldefinitionvirtualnetworkresourceid) | string | Shared services Virtual Network resource ID containing AzureFirewallSubnet. Required if virtualHubId is empty. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`additionalPublicIpConfigurations`](#parameter-firewalldefinitionadditionalpublicipconfigurations) | array | Additional Public IP configurations. |
| [`applicationRuleCollections`](#parameter-firewalldefinitionapplicationrulecollections) | array | Application rule collections used by Azure Firewall. |
| [`autoscaleMaxCapacity`](#parameter-firewalldefinitionautoscalemaxcapacity) | int | Maximum number of capacity units for the firewall. |
| [`autoscaleMinCapacity`](#parameter-firewalldefinitionautoscalemincapacity) | int | Minimum number of capacity units for the firewall. |
| [`availabilityZones`](#parameter-firewalldefinitionavailabilityzones) | array | Availability Zones for zone-redundant deployment. |
| [`azureSkuTier`](#parameter-firewalldefinitionazureskutier) | string | Tier of Azure Firewall. Allowed values: Basic, Premium, Standard. |
| [`diagnosticSettings`](#parameter-firewalldefinitiondiagnosticsettings) | array | Diagnostic settings for the firewall. |
| [`enableForcedTunneling`](#parameter-firewalldefinitionenableforcedtunneling) | bool | Enable or disable forced tunneling. |
| [`enableTelemetry`](#parameter-firewalldefinitionenabletelemetry) | bool | Enable or disable usage telemetry. Default is true. |
| [`firewallPolicyId`](#parameter-firewalldefinitionfirewallpolicyid) | string | Resource ID of the Firewall Policy to attach. |
| [`location`](#parameter-firewalldefinitionlocation) | string | Location for all resources. Default is resourceGroup().location. |
| [`lock`](#parameter-firewalldefinitionlock) | object | Lock settings for the firewall. |
| [`managementIPAddressObject`](#parameter-firewalldefinitionmanagementipaddressobject) | object | Properties of the Management Public IP to create and use. |
| [`managementIPResourceID`](#parameter-firewalldefinitionmanagementipresourceid) | string | Management Public IP resource ID for AzureFirewallManagementSubnet. |
| [`natRuleCollections`](#parameter-firewalldefinitionnatrulecollections) | array | NAT rule collections used by Azure Firewall. |
| [`networkRuleCollections`](#parameter-firewalldefinitionnetworkrulecollections) | array | Network rule collections used by Azure Firewall. |
| [`publicIPAddressObject`](#parameter-firewalldefinitionpublicipaddressobject) | object | Properties of the Public IP to create and use if no existing Public IP is provided. |
| [`publicIPResourceID`](#parameter-firewalldefinitionpublicipresourceid) | string | Public IP resource ID for the AzureFirewallSubnet. |
| [`roleAssignments`](#parameter-firewalldefinitionroleassignments) | array | Role assignments for the firewall. |
| [`tags`](#parameter-firewalldefinitiontags) | object | Tags to apply to the Azure Firewall resource. |
| [`threatIntelMode`](#parameter-firewalldefinitionthreatintelmode) | string | Operation mode for Threat Intel. Allowed values: Alert, Deny, Off. |

### Parameter: `firewallDefinition.name`

Name of the Azure Firewall.

- Required: Yes
- Type: string

### Parameter: `firewallDefinition.hubIPAddresses`

IP addresses associated with Azure Firewall. Required if virtualHubId is supplied.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`privateIPAddress`](#parameter-firewalldefinitionhubipaddressesprivateipaddress) | string | Private IP Address associated with Azure Firewall. |
| [`publicIPs`](#parameter-firewalldefinitionhubipaddressespublicips) | object | Public IPs associated with Azure Firewall. |

### Parameter: `firewallDefinition.hubIPAddresses.privateIPAddress`

Private IP Address associated with Azure Firewall.

- Required: No
- Type: string

### Parameter: `firewallDefinition.hubIPAddresses.publicIPs`

Public IPs associated with Azure Firewall.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`addresses`](#parameter-firewalldefinitionhubipaddressespublicipsaddresses) | array | List of public IP addresses or IPs to retain. |
| [`count`](#parameter-firewalldefinitionhubipaddressespublicipscount) | int | Public IP address count. |

### Parameter: `firewallDefinition.hubIPAddresses.publicIPs.addresses`

List of public IP addresses or IPs to retain.

- Required: No
- Type: array

### Parameter: `firewallDefinition.hubIPAddresses.publicIPs.count`

Public IP address count.

- Required: No
- Type: int

### Parameter: `firewallDefinition.virtualHubResourceId`

The virtualHub resource ID to which the firewall belongs. Required if virtualNetworkId is empty.

- Required: No
- Type: string

### Parameter: `firewallDefinition.virtualNetworkResourceId`

Shared services Virtual Network resource ID containing AzureFirewallSubnet. Required if virtualHubId is empty.

- Required: No
- Type: string

### Parameter: `firewallDefinition.additionalPublicIpConfigurations`

Additional Public IP configurations.

- Required: No
- Type: array

### Parameter: `firewallDefinition.applicationRuleCollections`

Application rule collections used by Azure Firewall.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-firewalldefinitionapplicationrulecollectionsname) | string | Name of the application rule collection. |
| [`properties`](#parameter-firewalldefinitionapplicationrulecollectionsproperties) | object | Properties of the application rule collection. |

### Parameter: `firewallDefinition.applicationRuleCollections.name`

Name of the application rule collection.

- Required: Yes
- Type: string

### Parameter: `firewallDefinition.applicationRuleCollections.properties`

Properties of the application rule collection.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`action`](#parameter-firewalldefinitionapplicationrulecollectionspropertiesaction) | object | Action of the rule collection. |
| [`priority`](#parameter-firewalldefinitionapplicationrulecollectionspropertiespriority) | int | Priority of the application rule collection (100-65000). |
| [`rules`](#parameter-firewalldefinitionapplicationrulecollectionspropertiesrules) | array | Application rules in the collection. |

### Parameter: `firewallDefinition.applicationRuleCollections.properties.action`

Action of the rule collection.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`type`](#parameter-firewalldefinitionapplicationrulecollectionspropertiesactiontype) | string | Action type. Allowed values: Allow, Deny. |

### Parameter: `firewallDefinition.applicationRuleCollections.properties.action.type`

Action type. Allowed values: Allow, Deny.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Allow'
    'Deny'
  ]
  ```

### Parameter: `firewallDefinition.applicationRuleCollections.properties.priority`

Priority of the application rule collection (100-65000).

- Required: Yes
- Type: int

### Parameter: `firewallDefinition.applicationRuleCollections.properties.rules`

Application rules in the collection.

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-firewalldefinitionapplicationrulecollectionspropertiesrulesname) | string | Name of the application rule. |
| [`protocols`](#parameter-firewalldefinitionapplicationrulecollectionspropertiesrulesprotocols) | array | Protocols for the application rule. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`description`](#parameter-firewalldefinitionapplicationrulecollectionspropertiesrulesdescription) | string | Description of the rule. |
| [`fqdnTags`](#parameter-firewalldefinitionapplicationrulecollectionspropertiesrulesfqdntags) | array | List of FQDN tags for this rule. |
| [`sourceAddresses`](#parameter-firewalldefinitionapplicationrulecollectionspropertiesrulessourceaddresses) | array | List of source IP addresses for this rule. |
| [`sourceIpGroups`](#parameter-firewalldefinitionapplicationrulecollectionspropertiesrulessourceipgroups) | array | List of source IP groups for this rule. |
| [`targetFqdns`](#parameter-firewalldefinitionapplicationrulecollectionspropertiesrulestargetfqdns) | array | List of target FQDNs for this rule. |

### Parameter: `firewallDefinition.applicationRuleCollections.properties.rules.name`

Name of the application rule.

- Required: Yes
- Type: string

### Parameter: `firewallDefinition.applicationRuleCollections.properties.rules.protocols`

Protocols for the application rule.

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`protocolType`](#parameter-firewalldefinitionapplicationrulecollectionspropertiesrulesprotocolsprotocoltype) | string | Protocol type. Allowed values: Http, Https, Mssql. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`port`](#parameter-firewalldefinitionapplicationrulecollectionspropertiesrulesprotocolsport) | int | Port number for the protocol (≤64000). |

### Parameter: `firewallDefinition.applicationRuleCollections.properties.rules.protocols.protocolType`

Protocol type. Allowed values: Http, Https, Mssql.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Http'
    'Https'
    'Mssql'
  ]
  ```

### Parameter: `firewallDefinition.applicationRuleCollections.properties.rules.protocols.port`

Port number for the protocol (≤64000).

- Required: No
- Type: int

### Parameter: `firewallDefinition.applicationRuleCollections.properties.rules.description`

Description of the rule.

- Required: No
- Type: string

### Parameter: `firewallDefinition.applicationRuleCollections.properties.rules.fqdnTags`

List of FQDN tags for this rule.

- Required: No
- Type: array

### Parameter: `firewallDefinition.applicationRuleCollections.properties.rules.sourceAddresses`

List of source IP addresses for this rule.

- Required: No
- Type: array

### Parameter: `firewallDefinition.applicationRuleCollections.properties.rules.sourceIpGroups`

List of source IP groups for this rule.

- Required: No
- Type: array

### Parameter: `firewallDefinition.applicationRuleCollections.properties.rules.targetFqdns`

List of target FQDNs for this rule.

- Required: No
- Type: array

### Parameter: `firewallDefinition.autoscaleMaxCapacity`

Maximum number of capacity units for the firewall.

- Required: No
- Type: int

### Parameter: `firewallDefinition.autoscaleMinCapacity`

Minimum number of capacity units for the firewall.

- Required: No
- Type: int

### Parameter: `firewallDefinition.availabilityZones`

Availability Zones for zone-redundant deployment.

- Required: No
- Type: array

### Parameter: `firewallDefinition.azureSkuTier`

Tier of Azure Firewall. Allowed values: Basic, Premium, Standard.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Basic'
    'Premium'
    'Standard'
  ]
  ```

### Parameter: `firewallDefinition.diagnosticSettings`

Diagnostic settings for the firewall.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`eventHubAuthorizationRuleResourceId`](#parameter-firewalldefinitiondiagnosticsettingseventhubauthorizationruleresourceid) | string | Event Hub authorization rule resource ID. |
| [`eventHubName`](#parameter-firewalldefinitiondiagnosticsettingseventhubname) | string | Event Hub name for diagnostic logs. |
| [`logAnalyticsDestinationType`](#parameter-firewalldefinitiondiagnosticsettingsloganalyticsdestinationtype) | string | Log Analytics destination type. Allowed values: AzureDiagnostics, Dedicated. |
| [`logCategoriesAndGroups`](#parameter-firewalldefinitiondiagnosticsettingslogcategoriesandgroups) | array | Log categories and groups. |
| [`marketplacePartnerResourceId`](#parameter-firewalldefinitiondiagnosticsettingsmarketplacepartnerresourceid) | string | Marketplace partner resource ID for diagnostic logs. |
| [`metricCategories`](#parameter-firewalldefinitiondiagnosticsettingsmetriccategories) | array | Metric categories for diagnostics. |
| [`name`](#parameter-firewalldefinitiondiagnosticsettingsname) | string | Diagnostic setting name. |
| [`storageAccountResourceId`](#parameter-firewalldefinitiondiagnosticsettingsstorageaccountresourceid) | string | Diagnostic storage account resource ID. |
| [`workspaceResourceId`](#parameter-firewalldefinitiondiagnosticsettingsworkspaceresourceid) | string | Log Analytics workspace resource ID. |

### Parameter: `firewallDefinition.diagnosticSettings.eventHubAuthorizationRuleResourceId`

Event Hub authorization rule resource ID.

- Required: No
- Type: string

### Parameter: `firewallDefinition.diagnosticSettings.eventHubName`

Event Hub name for diagnostic logs.

- Required: No
- Type: string

### Parameter: `firewallDefinition.diagnosticSettings.logAnalyticsDestinationType`

Log Analytics destination type. Allowed values: AzureDiagnostics, Dedicated.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'AzureDiagnostics'
    'Dedicated'
  ]
  ```

### Parameter: `firewallDefinition.diagnosticSettings.logCategoriesAndGroups`

Log categories and groups.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-firewalldefinitiondiagnosticsettingslogcategoriesandgroupscategory) | string | Name of a diagnostic log category. |
| [`categoryGroup`](#parameter-firewalldefinitiondiagnosticsettingslogcategoriesandgroupscategorygroup) | string | Name of a diagnostic log category group. |
| [`enabled`](#parameter-firewalldefinitiondiagnosticsettingslogcategoriesandgroupsenabled) | bool | Enable/disable category. Default is true. |

### Parameter: `firewallDefinition.diagnosticSettings.logCategoriesAndGroups.category`

Name of a diagnostic log category.

- Required: No
- Type: string

### Parameter: `firewallDefinition.diagnosticSettings.logCategoriesAndGroups.categoryGroup`

Name of a diagnostic log category group.

- Required: No
- Type: string

### Parameter: `firewallDefinition.diagnosticSettings.logCategoriesAndGroups.enabled`

Enable/disable category. Default is true.

- Required: No
- Type: bool

### Parameter: `firewallDefinition.diagnosticSettings.marketplacePartnerResourceId`

Marketplace partner resource ID for diagnostic logs.

- Required: No
- Type: string

### Parameter: `firewallDefinition.diagnosticSettings.metricCategories`

Metric categories for diagnostics.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-firewalldefinitiondiagnosticsettingsmetriccategoriescategory) | string | Name of a diagnostic metric category. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enabled`](#parameter-firewalldefinitiondiagnosticsettingsmetriccategoriesenabled) | bool | Enable/disable metric category. Default is true. |

### Parameter: `firewallDefinition.diagnosticSettings.metricCategories.category`

Name of a diagnostic metric category.

- Required: Yes
- Type: string

### Parameter: `firewallDefinition.diagnosticSettings.metricCategories.enabled`

Enable/disable metric category. Default is true.

- Required: No
- Type: bool

### Parameter: `firewallDefinition.diagnosticSettings.name`

Diagnostic setting name.

- Required: No
- Type: string

### Parameter: `firewallDefinition.diagnosticSettings.storageAccountResourceId`

Diagnostic storage account resource ID.

- Required: No
- Type: string

### Parameter: `firewallDefinition.diagnosticSettings.workspaceResourceId`

Log Analytics workspace resource ID.

- Required: No
- Type: string

### Parameter: `firewallDefinition.enableForcedTunneling`

Enable or disable forced tunneling.

- Required: No
- Type: bool

### Parameter: `firewallDefinition.enableTelemetry`

Enable or disable usage telemetry. Default is true.

- Required: No
- Type: bool

### Parameter: `firewallDefinition.firewallPolicyId`

Resource ID of the Firewall Policy to attach.

- Required: No
- Type: string

### Parameter: `firewallDefinition.location`

Location for all resources. Default is resourceGroup().location.

- Required: No
- Type: string

### Parameter: `firewallDefinition.lock`

Lock settings for the firewall.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-firewalldefinitionlockkind) | string | Lock type. Allowed values: CanNotDelete, None, ReadOnly. |
| [`name`](#parameter-firewalldefinitionlockname) | string | Lock name. |
| [`notes`](#parameter-firewalldefinitionlocknotes) | string | Lock notes. |

### Parameter: `firewallDefinition.lock.kind`

Lock type. Allowed values: CanNotDelete, None, ReadOnly.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `firewallDefinition.lock.name`

Lock name.

- Required: No
- Type: string

### Parameter: `firewallDefinition.lock.notes`

Lock notes.

- Required: No
- Type: string

### Parameter: `firewallDefinition.managementIPAddressObject`

Properties of the Management Public IP to create and use.

- Required: No
- Type: object

### Parameter: `firewallDefinition.managementIPResourceID`

Management Public IP resource ID for AzureFirewallManagementSubnet.

- Required: No
- Type: string

### Parameter: `firewallDefinition.natRuleCollections`

NAT rule collections used by Azure Firewall.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-firewalldefinitionnatrulecollectionsname) | string | Name of the NAT rule collection. |
| [`properties`](#parameter-firewalldefinitionnatrulecollectionsproperties) | object | Properties of the NAT rule collection. |

### Parameter: `firewallDefinition.natRuleCollections.name`

Name of the NAT rule collection.

- Required: Yes
- Type: string

### Parameter: `firewallDefinition.natRuleCollections.properties`

Properties of the NAT rule collection.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`action`](#parameter-firewalldefinitionnatrulecollectionspropertiesaction) | object | Action of the NAT rule collection. |
| [`priority`](#parameter-firewalldefinitionnatrulecollectionspropertiespriority) | int | Priority of the NAT rule collection (100–65000). |
| [`rules`](#parameter-firewalldefinitionnatrulecollectionspropertiesrules) | array | NAT rules in the collection. |

### Parameter: `firewallDefinition.natRuleCollections.properties.action`

Action of the NAT rule collection.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`type`](#parameter-firewalldefinitionnatrulecollectionspropertiesactiontype) | string | Action type. Allowed values: Dnat, Snat. |

### Parameter: `firewallDefinition.natRuleCollections.properties.action.type`

Action type. Allowed values: Dnat, Snat.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Dnat'
    'Snat'
  ]
  ```

### Parameter: `firewallDefinition.natRuleCollections.properties.priority`

Priority of the NAT rule collection (100–65000).

- Required: Yes
- Type: int

### Parameter: `firewallDefinition.natRuleCollections.properties.rules`

NAT rules in the collection.

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-firewalldefinitionnatrulecollectionspropertiesrulesname) | string | Name of the NAT rule. |
| [`protocols`](#parameter-firewalldefinitionnatrulecollectionspropertiesrulesprotocols) | array | Protocols for the NAT rule. Allowed values: Any, ICMP, TCP, UDP. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`description`](#parameter-firewalldefinitionnatrulecollectionspropertiesrulesdescription) | string | Description of the NAT rule. |
| [`destinationAddresses`](#parameter-firewalldefinitionnatrulecollectionspropertiesrulesdestinationaddresses) | array | Destination addresses (IP ranges, prefixes, service tags). |
| [`destinationPorts`](#parameter-firewalldefinitionnatrulecollectionspropertiesrulesdestinationports) | array | Destination ports. |
| [`sourceAddresses`](#parameter-firewalldefinitionnatrulecollectionspropertiesrulessourceaddresses) | array | Source addresses. |
| [`sourceIpGroups`](#parameter-firewalldefinitionnatrulecollectionspropertiesrulessourceipgroups) | array | Source IP groups. |
| [`translatedAddress`](#parameter-firewalldefinitionnatrulecollectionspropertiesrulestranslatedaddress) | string | Translated address for the NAT rule. |
| [`translatedFqdn`](#parameter-firewalldefinitionnatrulecollectionspropertiesrulestranslatedfqdn) | string | Translated FQDN for the NAT rule. |
| [`translatedPort`](#parameter-firewalldefinitionnatrulecollectionspropertiesrulestranslatedport) | string | Translated port for the NAT rule. |

### Parameter: `firewallDefinition.natRuleCollections.properties.rules.name`

Name of the NAT rule.

- Required: Yes
- Type: string

### Parameter: `firewallDefinition.natRuleCollections.properties.rules.protocols`

Protocols for the NAT rule. Allowed values: Any, ICMP, TCP, UDP.

- Required: Yes
- Type: array
- Allowed:
  ```Bicep
  [
    'Any'
    'ICMP'
    'TCP'
    'UDP'
  ]
  ```

### Parameter: `firewallDefinition.natRuleCollections.properties.rules.description`

Description of the NAT rule.

- Required: No
- Type: string

### Parameter: `firewallDefinition.natRuleCollections.properties.rules.destinationAddresses`

Destination addresses (IP ranges, prefixes, service tags).

- Required: No
- Type: array

### Parameter: `firewallDefinition.natRuleCollections.properties.rules.destinationPorts`

Destination ports.

- Required: No
- Type: array

### Parameter: `firewallDefinition.natRuleCollections.properties.rules.sourceAddresses`

Source addresses.

- Required: No
- Type: array

### Parameter: `firewallDefinition.natRuleCollections.properties.rules.sourceIpGroups`

Source IP groups.

- Required: No
- Type: array

### Parameter: `firewallDefinition.natRuleCollections.properties.rules.translatedAddress`

Translated address for the NAT rule.

- Required: No
- Type: string

### Parameter: `firewallDefinition.natRuleCollections.properties.rules.translatedFqdn`

Translated FQDN for the NAT rule.

- Required: No
- Type: string

### Parameter: `firewallDefinition.natRuleCollections.properties.rules.translatedPort`

Translated port for the NAT rule.

- Required: No
- Type: string

### Parameter: `firewallDefinition.networkRuleCollections`

Network rule collections used by Azure Firewall.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-firewalldefinitionnetworkrulecollectionsname) | string | Name of the network rule collection. |
| [`properties`](#parameter-firewalldefinitionnetworkrulecollectionsproperties) | object | Properties of the network rule collection. |

### Parameter: `firewallDefinition.networkRuleCollections.name`

Name of the network rule collection.

- Required: Yes
- Type: string

### Parameter: `firewallDefinition.networkRuleCollections.properties`

Properties of the network rule collection.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`action`](#parameter-firewalldefinitionnetworkrulecollectionspropertiesaction) | object | Action of the network rule collection. |
| [`priority`](#parameter-firewalldefinitionnetworkrulecollectionspropertiespriority) | int | Priority of the network rule collection (100–65000). |
| [`rules`](#parameter-firewalldefinitionnetworkrulecollectionspropertiesrules) | array | Network rules in the collection. |

### Parameter: `firewallDefinition.networkRuleCollections.properties.action`

Action of the network rule collection.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`type`](#parameter-firewalldefinitionnetworkrulecollectionspropertiesactiontype) | string | Action type. Allowed values: Allow, Deny. |

### Parameter: `firewallDefinition.networkRuleCollections.properties.action.type`

Action type. Allowed values: Allow, Deny.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Allow'
    'Deny'
  ]
  ```

### Parameter: `firewallDefinition.networkRuleCollections.properties.priority`

Priority of the network rule collection (100–65000).

- Required: Yes
- Type: int

### Parameter: `firewallDefinition.networkRuleCollections.properties.rules`

Network rules in the collection.

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-firewalldefinitionnetworkrulecollectionspropertiesrulesname) | string | Name of the network rule. |
| [`protocols`](#parameter-firewalldefinitionnetworkrulecollectionspropertiesrulesprotocols) | array | Protocols for the network rule. Allowed values: Any, ICMP, TCP, UDP. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`description`](#parameter-firewalldefinitionnetworkrulecollectionspropertiesrulesdescription) | string | Description of the network rule. |
| [`destinationAddresses`](#parameter-firewalldefinitionnetworkrulecollectionspropertiesrulesdestinationaddresses) | array | Destination addresses. |
| [`destinationFqdns`](#parameter-firewalldefinitionnetworkrulecollectionspropertiesrulesdestinationfqdns) | array | Destination FQDNs. |
| [`destinationIpGroups`](#parameter-firewalldefinitionnetworkrulecollectionspropertiesrulesdestinationipgroups) | array | Destination IP groups. |
| [`destinationPorts`](#parameter-firewalldefinitionnetworkrulecollectionspropertiesrulesdestinationports) | array | Destination ports. |
| [`sourceAddresses`](#parameter-firewalldefinitionnetworkrulecollectionspropertiesrulessourceaddresses) | array | Source addresses. |
| [`sourceIpGroups`](#parameter-firewalldefinitionnetworkrulecollectionspropertiesrulessourceipgroups) | array | Source IP groups. |

### Parameter: `firewallDefinition.networkRuleCollections.properties.rules.name`

Name of the network rule.

- Required: Yes
- Type: string

### Parameter: `firewallDefinition.networkRuleCollections.properties.rules.protocols`

Protocols for the network rule. Allowed values: Any, ICMP, TCP, UDP.

- Required: Yes
- Type: array
- Allowed:
  ```Bicep
  [
    'Any'
    'ICMP'
    'TCP'
    'UDP'
  ]
  ```

### Parameter: `firewallDefinition.networkRuleCollections.properties.rules.description`

Description of the network rule.

- Required: No
- Type: string

### Parameter: `firewallDefinition.networkRuleCollections.properties.rules.destinationAddresses`

Destination addresses.

- Required: No
- Type: array

### Parameter: `firewallDefinition.networkRuleCollections.properties.rules.destinationFqdns`

Destination FQDNs.

- Required: No
- Type: array

### Parameter: `firewallDefinition.networkRuleCollections.properties.rules.destinationIpGroups`

Destination IP groups.

- Required: No
- Type: array

### Parameter: `firewallDefinition.networkRuleCollections.properties.rules.destinationPorts`

Destination ports.

- Required: No
- Type: array

### Parameter: `firewallDefinition.networkRuleCollections.properties.rules.sourceAddresses`

Source addresses.

- Required: No
- Type: array

### Parameter: `firewallDefinition.networkRuleCollections.properties.rules.sourceIpGroups`

Source IP groups.

- Required: No
- Type: array

### Parameter: `firewallDefinition.publicIPAddressObject`

Properties of the Public IP to create and use if no existing Public IP is provided.

- Required: No
- Type: object

### Parameter: `firewallDefinition.publicIPResourceID`

Public IP resource ID for the AzureFirewallSubnet.

- Required: No
- Type: string

### Parameter: `firewallDefinition.roleAssignments`

Role assignments for the firewall.

- Required: No
- Type: array

### Parameter: `firewallDefinition.tags`

Tags to apply to the Azure Firewall resource.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-firewalldefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `firewallDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `firewallDefinition.threatIntelMode`

Operation mode for Threat Intel. Allowed values: Alert, Deny, Off.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Alert'
    'Deny'
    'Off'
  ]
  ```

### Parameter: `firewallPolicyDefinition`

Azure Firewall Policy configuration. Required if deployToggles.firewall is true and resourceIds.firewallPolicyResourceId is empty.

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      name: ''
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-firewallpolicydefinitionname) | string | Name of the Firewall Policy. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`allowSqlRedirect`](#parameter-firewallpolicydefinitionallowsqlredirect) | bool | A flag to indicate if SQL Redirect traffic filtering is enabled. Requires no rule using ports 11000–11999. |
| [`basePolicyResourceId`](#parameter-firewallpolicydefinitionbasepolicyresourceid) | string | Resource ID of the base policy. |
| [`certificateName`](#parameter-firewallpolicydefinitioncertificatename) | string | Name of the CA certificate. |
| [`defaultWorkspaceResourceId`](#parameter-firewallpolicydefinitiondefaultworkspaceresourceid) | string | Default Log Analytics Resource ID for Firewall Policy Insights. |
| [`enableProxy`](#parameter-firewallpolicydefinitionenableproxy) | bool | Enable DNS Proxy on Firewalls attached to the Firewall Policy. |
| [`enableTelemetry`](#parameter-firewallpolicydefinitionenabletelemetry) | bool | Enable or disable usage telemetry for the module. Default is true. |
| [`fqdns`](#parameter-firewallpolicydefinitionfqdns) | array | List of FQDNs for the ThreatIntel Allowlist. |
| [`insightsIsEnabled`](#parameter-firewallpolicydefinitioninsightsisenabled) | bool | Flag to indicate if insights are enabled on the policy. |
| [`intrusionDetection`](#parameter-firewallpolicydefinitionintrusiondetection) | object | Intrusion detection configuration. |
| [`ipAddresses`](#parameter-firewallpolicydefinitionipaddresses) | array | List of IP addresses for the ThreatIntel Allowlist. |
| [`keyVaultSecretId`](#parameter-firewallpolicydefinitionkeyvaultsecretid) | string | Key Vault secret ID (base-64 encoded unencrypted PFX or Certificate object). |
| [`location`](#parameter-firewallpolicydefinitionlocation) | string | Location for all resources. Default is resourceGroup().location. |
| [`lock`](#parameter-firewallpolicydefinitionlock) | object | Lock settings for the Firewall Policy. |
| [`managedIdentities`](#parameter-firewallpolicydefinitionmanagedidentities) | object | Managed identity definition for this resource. |
| [`retentionDays`](#parameter-firewallpolicydefinitionretentiondays) | int | Number of days to retain Firewall Policy insights. Default is 365. |
| [`roleAssignments`](#parameter-firewallpolicydefinitionroleassignments) | array | Role assignments to create for the Firewall Policy. |
| [`ruleCollectionGroups`](#parameter-firewallpolicydefinitionrulecollectiongroups) | array | Rule collection groups. |
| [`servers`](#parameter-firewallpolicydefinitionservers) | array | List of custom DNS servers. |
| [`snat`](#parameter-firewallpolicydefinitionsnat) | object | SNAT private IP ranges configuration. |
| [`tags`](#parameter-firewallpolicydefinitiontags) | object | Tags to apply to the Firewall Policy. |
| [`threatIntelMode`](#parameter-firewallpolicydefinitionthreatintelmode) | string | Threat Intelligence mode. Allowed values: Alert, Deny, Off. |
| [`tier`](#parameter-firewallpolicydefinitiontier) | string | Tier of the Firewall Policy. Allowed values: Basic, Premium, Standard. |
| [`workspaces`](#parameter-firewallpolicydefinitionworkspaces) | array | List of workspaces for Firewall Policy Insights. |

### Parameter: `firewallPolicyDefinition.name`

Name of the Firewall Policy.

- Required: Yes
- Type: string

### Parameter: `firewallPolicyDefinition.allowSqlRedirect`

A flag to indicate if SQL Redirect traffic filtering is enabled. Requires no rule using ports 11000–11999.

- Required: No
- Type: bool

### Parameter: `firewallPolicyDefinition.basePolicyResourceId`

Resource ID of the base policy.

- Required: No
- Type: string

### Parameter: `firewallPolicyDefinition.certificateName`

Name of the CA certificate.

- Required: No
- Type: string

### Parameter: `firewallPolicyDefinition.defaultWorkspaceResourceId`

Default Log Analytics Resource ID for Firewall Policy Insights.

- Required: No
- Type: string

### Parameter: `firewallPolicyDefinition.enableProxy`

Enable DNS Proxy on Firewalls attached to the Firewall Policy.

- Required: No
- Type: bool

### Parameter: `firewallPolicyDefinition.enableTelemetry`

Enable or disable usage telemetry for the module. Default is true.

- Required: No
- Type: bool

### Parameter: `firewallPolicyDefinition.fqdns`

List of FQDNs for the ThreatIntel Allowlist.

- Required: No
- Type: array

### Parameter: `firewallPolicyDefinition.insightsIsEnabled`

Flag to indicate if insights are enabled on the policy.

- Required: No
- Type: bool

### Parameter: `firewallPolicyDefinition.intrusionDetection`

Intrusion detection configuration.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`configuration`](#parameter-firewallpolicydefinitionintrusiondetectionconfiguration) | object | Intrusion detection configuration properties. |
| [`mode`](#parameter-firewallpolicydefinitionintrusiondetectionmode) | string | Intrusion detection mode. Allowed values: Alert, Deny, Off. |
| [`profile`](#parameter-firewallpolicydefinitionintrusiondetectionprofile) | string | IDPS profile name. Allowed values: Advanced, Basic, Extended, Standard. |

### Parameter: `firewallPolicyDefinition.intrusionDetection.configuration`

Intrusion detection configuration properties.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`bypassTrafficSettings`](#parameter-firewallpolicydefinitionintrusiondetectionconfigurationbypasstrafficsettings) | array | List of bypass traffic rules. |
| [`privateRanges`](#parameter-firewallpolicydefinitionintrusiondetectionconfigurationprivateranges) | array | List of private IP ranges to consider as internal. |
| [`signatureOverrides`](#parameter-firewallpolicydefinitionintrusiondetectionconfigurationsignatureoverrides) | array | Signature override states. |

### Parameter: `firewallPolicyDefinition.intrusionDetection.configuration.bypassTrafficSettings`

List of bypass traffic rules.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-firewallpolicydefinitionintrusiondetectionconfigurationbypasstrafficsettingsname) | string | Name of the bypass traffic rule. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`description`](#parameter-firewallpolicydefinitionintrusiondetectionconfigurationbypasstrafficsettingsdescription) | string | Description of the bypass traffic rule. |
| [`destinationAddresses`](#parameter-firewallpolicydefinitionintrusiondetectionconfigurationbypasstrafficsettingsdestinationaddresses) | array | Destination IP addresses or ranges. |
| [`destinationIpGroups`](#parameter-firewallpolicydefinitionintrusiondetectionconfigurationbypasstrafficsettingsdestinationipgroups) | array | Destination IP groups. |
| [`destinationPorts`](#parameter-firewallpolicydefinitionintrusiondetectionconfigurationbypasstrafficsettingsdestinationports) | array | Destination ports or ranges. |
| [`protocol`](#parameter-firewallpolicydefinitionintrusiondetectionconfigurationbypasstrafficsettingsprotocol) | string | Protocol for the rule. Allowed values: ANY, ICMP, TCP, UDP. |
| [`sourceAddresses`](#parameter-firewallpolicydefinitionintrusiondetectionconfigurationbypasstrafficsettingssourceaddresses) | array | Source IP addresses or ranges. |
| [`sourceIpGroups`](#parameter-firewallpolicydefinitionintrusiondetectionconfigurationbypasstrafficsettingssourceipgroups) | array | Source IP groups. |

### Parameter: `firewallPolicyDefinition.intrusionDetection.configuration.bypassTrafficSettings.name`

Name of the bypass traffic rule.

- Required: Yes
- Type: string

### Parameter: `firewallPolicyDefinition.intrusionDetection.configuration.bypassTrafficSettings.description`

Description of the bypass traffic rule.

- Required: No
- Type: string

### Parameter: `firewallPolicyDefinition.intrusionDetection.configuration.bypassTrafficSettings.destinationAddresses`

Destination IP addresses or ranges.

- Required: No
- Type: array

### Parameter: `firewallPolicyDefinition.intrusionDetection.configuration.bypassTrafficSettings.destinationIpGroups`

Destination IP groups.

- Required: No
- Type: array

### Parameter: `firewallPolicyDefinition.intrusionDetection.configuration.bypassTrafficSettings.destinationPorts`

Destination ports or ranges.

- Required: No
- Type: array

### Parameter: `firewallPolicyDefinition.intrusionDetection.configuration.bypassTrafficSettings.protocol`

Protocol for the rule. Allowed values: ANY, ICMP, TCP, UDP.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'ANY'
    'ICMP'
    'TCP'
    'UDP'
  ]
  ```

### Parameter: `firewallPolicyDefinition.intrusionDetection.configuration.bypassTrafficSettings.sourceAddresses`

Source IP addresses or ranges.

- Required: No
- Type: array

### Parameter: `firewallPolicyDefinition.intrusionDetection.configuration.bypassTrafficSettings.sourceIpGroups`

Source IP groups.

- Required: No
- Type: array

### Parameter: `firewallPolicyDefinition.intrusionDetection.configuration.privateRanges`

List of private IP ranges to consider as internal.

- Required: No
- Type: array

### Parameter: `firewallPolicyDefinition.intrusionDetection.configuration.signatureOverrides`

Signature override states.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`id`](#parameter-firewallpolicydefinitionintrusiondetectionconfigurationsignatureoverridesid) | string | Signature ID. |
| [`mode`](#parameter-firewallpolicydefinitionintrusiondetectionconfigurationsignatureoverridesmode) | string | Signature state. Allowed values: Alert, Deny, Off. |

### Parameter: `firewallPolicyDefinition.intrusionDetection.configuration.signatureOverrides.id`

Signature ID.

- Required: Yes
- Type: string

### Parameter: `firewallPolicyDefinition.intrusionDetection.configuration.signatureOverrides.mode`

Signature state. Allowed values: Alert, Deny, Off.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Alert'
    'Deny'
    'Off'
  ]
  ```

### Parameter: `firewallPolicyDefinition.intrusionDetection.mode`

Intrusion detection mode. Allowed values: Alert, Deny, Off.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Alert'
    'Deny'
    'Off'
  ]
  ```

### Parameter: `firewallPolicyDefinition.intrusionDetection.profile`

IDPS profile name. Allowed values: Advanced, Basic, Extended, Standard.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Advanced'
    'Basic'
    'Extended'
    'Standard'
  ]
  ```

### Parameter: `firewallPolicyDefinition.ipAddresses`

List of IP addresses for the ThreatIntel Allowlist.

- Required: No
- Type: array

### Parameter: `firewallPolicyDefinition.keyVaultSecretId`

Key Vault secret ID (base-64 encoded unencrypted PFX or Certificate object).

- Required: No
- Type: string

### Parameter: `firewallPolicyDefinition.location`

Location for all resources. Default is resourceGroup().location.

- Required: No
- Type: string

### Parameter: `firewallPolicyDefinition.lock`

Lock settings for the Firewall Policy.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-firewallpolicydefinitionlockkind) | string | Lock type. Allowed values: CanNotDelete, None, ReadOnly. |
| [`name`](#parameter-firewallpolicydefinitionlockname) | string | Lock name. |
| [`notes`](#parameter-firewallpolicydefinitionlocknotes) | string | Lock notes. |

### Parameter: `firewallPolicyDefinition.lock.kind`

Lock type. Allowed values: CanNotDelete, None, ReadOnly.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `firewallPolicyDefinition.lock.name`

Lock name.

- Required: No
- Type: string

### Parameter: `firewallPolicyDefinition.lock.notes`

Lock notes.

- Required: No
- Type: string

### Parameter: `firewallPolicyDefinition.managedIdentities`

Managed identity definition for this resource.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`userAssignedResourceIds`](#parameter-firewallpolicydefinitionmanagedidentitiesuserassignedresourceids) | array | User-assigned identity resource IDs. Required if using a user-assigned identity for encryption. |

### Parameter: `firewallPolicyDefinition.managedIdentities.userAssignedResourceIds`

User-assigned identity resource IDs. Required if using a user-assigned identity for encryption.

- Required: No
- Type: array

### Parameter: `firewallPolicyDefinition.retentionDays`

Number of days to retain Firewall Policy insights. Default is 365.

- Required: No
- Type: int

### Parameter: `firewallPolicyDefinition.roleAssignments`

Role assignments to create for the Firewall Policy.

- Required: No
- Type: array

### Parameter: `firewallPolicyDefinition.ruleCollectionGroups`

Rule collection groups.

- Required: No
- Type: array

### Parameter: `firewallPolicyDefinition.servers`

List of custom DNS servers.

- Required: No
- Type: array

### Parameter: `firewallPolicyDefinition.snat`

SNAT private IP ranges configuration.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`autoLearnPrivateRanges`](#parameter-firewallpolicydefinitionsnatautolearnprivateranges) | string | Mode for automatically learning private ranges. Allowed values: Disabled, Enabled. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`privateRanges`](#parameter-firewallpolicydefinitionsnatprivateranges) | array | List of private IP ranges not to be SNATed. |

### Parameter: `firewallPolicyDefinition.snat.autoLearnPrivateRanges`

Mode for automatically learning private ranges. Allowed values: Disabled, Enabled.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Disabled'
    'Enabled'
  ]
  ```

### Parameter: `firewallPolicyDefinition.snat.privateRanges`

List of private IP ranges not to be SNATed.

- Required: No
- Type: array

### Parameter: `firewallPolicyDefinition.tags`

Tags to apply to the Firewall Policy.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-firewallpolicydefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `firewallPolicyDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `firewallPolicyDefinition.threatIntelMode`

Threat Intelligence mode. Allowed values: Alert, Deny, Off.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Alert'
    'Deny'
    'Off'
  ]
  ```

### Parameter: `firewallPolicyDefinition.tier`

Tier of the Firewall Policy. Allowed values: Basic, Premium, Standard.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Basic'
    'Premium'
    'Standard'
  ]
  ```

### Parameter: `firewallPolicyDefinition.workspaces`

List of workspaces for Firewall Policy Insights.

- Required: No
- Type: array

### Parameter: `groundingWithBingDefinition`

Grounding with Bing configuration. Required if deployToggles.groundingWithBingSearch is true and resourceIds.groundingServiceResourceId is empty.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`sku`](#parameter-groundingwithbingdefinitionsku) | string | Bing Grounding resource SKU. |
| [`tags`](#parameter-groundingwithbingdefinitiontags) | object | Tags to apply to the Bing Grounding resource. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-groundingwithbingdefinitionname) | string | Bing Grounding resource name. |

### Parameter: `groundingWithBingDefinition.sku`

Bing Grounding resource SKU.

- Required: Yes
- Type: string

### Parameter: `groundingWithBingDefinition.tags`

Tags to apply to the Bing Grounding resource.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-groundingwithbingdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `groundingWithBingDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `groundingWithBingDefinition.name`

Bing Grounding resource name.

- Required: No
- Type: string

### Parameter: `hubVnetPeeringDefinition`

Hub VNet peering configuration. Required if you plan to establish hub-spoke peering.

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      allowForwardedTraffic: true
      allowGatewayTransit: false
      allowVirtualNetworkAccess: true
      createReversePeering: true
      firewallIpAddress: ''
      name: ''
      peerVnetResourceId: ''
      reverseAllowForwardedTraffic: true
      reverseAllowGatewayTransit: false
      reverseAllowVirtualNetworkAccess: true
      reverseName: ''
      reverseUseRemoteGateways: false
      useRemoteGateways: false
  }
  ```

### Parameter: `jumpVmAdminPassword`

Local admin password for the Windows JumpVM. Required if deployToggles.jumpVm is true.

- Required: No
- Type: securestring

### Parameter: `jumpVmDefinition`

Jump (bastion) VM configuration (Windows). Required if deployToggles.jumpVm is true.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`adminUsername`](#parameter-jumpvmdefinitionadminusername) | string | Admin username. |
| [`sku`](#parameter-jumpvmdefinitionsku) | string | VM size SKU (e.g., Standard_D2s_v5). |
| [`tags`](#parameter-jumpvmdefinitiontags) | object | Tags to apply to the Jump VM. |
| [`vmKeyVaultSecName`](#parameter-jumpvmdefinitionvmkeyvaultsecname) | string | Name of the admin password secret in the Bastion Key Vault. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`imageReference`](#parameter-jumpvmdefinitionimagereference) | object | Marketplace image reference for the VM. |
| [`maintenanceConfigurationResourceId`](#parameter-jumpvmdefinitionmaintenanceconfigurationresourceid) | string | Resource ID of the maintenance configuration. |
| [`name`](#parameter-jumpvmdefinitionname) | string | VM resource name. |
| [`osType`](#parameter-jumpvmdefinitionostype) | string | OS type for the VM. |

### Parameter: `jumpVmDefinition.adminUsername`

Admin username.

- Required: Yes
- Type: string

### Parameter: `jumpVmDefinition.sku`

VM size SKU (e.g., Standard_D2s_v5).

- Required: Yes
- Type: string

### Parameter: `jumpVmDefinition.tags`

Tags to apply to the Jump VM.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-jumpvmdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `jumpVmDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `jumpVmDefinition.vmKeyVaultSecName`

Name of the admin password secret in the Bastion Key Vault.

- Required: Yes
- Type: string

### Parameter: `jumpVmDefinition.imageReference`

Marketplace image reference for the VM.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`offer`](#parameter-jumpvmdefinitionimagereferenceoffer) | string | Offer name. |
| [`publisher`](#parameter-jumpvmdefinitionimagereferencepublisher) | string | Publisher name. |
| [`sku`](#parameter-jumpvmdefinitionimagereferencesku) | string | SKU name. |
| [`version`](#parameter-jumpvmdefinitionimagereferenceversion) | string | Image version (e.g., latest). |

### Parameter: `jumpVmDefinition.imageReference.offer`

Offer name.

- Required: Yes
- Type: string

### Parameter: `jumpVmDefinition.imageReference.publisher`

Publisher name.

- Required: Yes
- Type: string

### Parameter: `jumpVmDefinition.imageReference.sku`

SKU name.

- Required: Yes
- Type: string

### Parameter: `jumpVmDefinition.imageReference.version`

Image version (e.g., latest).

- Required: Yes
- Type: string

### Parameter: `jumpVmDefinition.maintenanceConfigurationResourceId`

Resource ID of the maintenance configuration.

- Required: No
- Type: string

### Parameter: `jumpVmDefinition.name`

VM resource name.

- Required: No
- Type: string

### Parameter: `jumpVmDefinition.osType`

OS type for the VM.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Linux'
    'Windows'
  ]
  ```

### Parameter: `jumpVmMaintenanceDefinition`

Jump (bastion) VM Maintenance Definition (Windows). Required if deployToggles.jumpVm is true.

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      name: ''
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-jumpvmmaintenancedefinitionname) | string | Name of the Maintenance Configuration. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enableTelemetry`](#parameter-jumpvmmaintenancedefinitionenabletelemetry) | bool | Enable or disable usage telemetry for the module. Default is true. |
| [`extensionProperties`](#parameter-jumpvmmaintenancedefinitionextensionproperties) | object | Extension properties of the Maintenance Configuration. |
| [`installPatches`](#parameter-jumpvmmaintenancedefinitioninstallpatches) | object | Configuration settings for VM guest patching with Azure Update Manager. |
| [`location`](#parameter-jumpvmmaintenancedefinitionlocation) | string | Resource location. Defaults to the resource group location. |
| [`lock`](#parameter-jumpvmmaintenancedefinitionlock) | object | Lock configuration for the Maintenance Configuration. |
| [`maintenanceScope`](#parameter-jumpvmmaintenancedefinitionmaintenancescope) | string | Maintenance scope of the configuration. Default is Host. |
| [`maintenanceWindow`](#parameter-jumpvmmaintenancedefinitionmaintenancewindow) | object | Definition of the Maintenance Window. |
| [`namespace`](#parameter-jumpvmmaintenancedefinitionnamespace) | string | Namespace of the resource. |
| [`roleAssignments`](#parameter-jumpvmmaintenancedefinitionroleassignments) | array | Role assignments to apply to the Maintenance Configuration. |
| [`tags`](#parameter-jumpvmmaintenancedefinitiontags) | object | Tags to apply to the Maintenance Configuration resource. |
| [`visibility`](#parameter-jumpvmmaintenancedefinitionvisibility) | string | Visibility of the configuration. Default is Custom. |

### Parameter: `jumpVmMaintenanceDefinition.name`

Name of the Maintenance Configuration.

- Required: Yes
- Type: string

### Parameter: `jumpVmMaintenanceDefinition.enableTelemetry`

Enable or disable usage telemetry for the module. Default is true.

- Required: No
- Type: bool

### Parameter: `jumpVmMaintenanceDefinition.extensionProperties`

Extension properties of the Maintenance Configuration.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-jumpvmmaintenancedefinitionextensionproperties>any_other_property<) | string | Arbitrary key for each extension property. |

### Parameter: `jumpVmMaintenanceDefinition.extensionProperties.>Any_other_property<`

Arbitrary key for each extension property.

- Required: Yes
- Type: string

### Parameter: `jumpVmMaintenanceDefinition.installPatches`

Configuration settings for VM guest patching with Azure Update Manager.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-jumpvmmaintenancedefinitioninstallpatches>any_other_property<) | string | Arbitrary key for each patch configuration property. |

### Parameter: `jumpVmMaintenanceDefinition.installPatches.>Any_other_property<`

Arbitrary key for each patch configuration property.

- Required: Yes
- Type: string

### Parameter: `jumpVmMaintenanceDefinition.location`

Resource location. Defaults to the resource group location.

- Required: No
- Type: string

### Parameter: `jumpVmMaintenanceDefinition.lock`

Lock configuration for the Maintenance Configuration.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-jumpvmmaintenancedefinitionlockkind) | string | Lock type. |
| [`name`](#parameter-jumpvmmaintenancedefinitionlockname) | string | Lock name. |
| [`notes`](#parameter-jumpvmmaintenancedefinitionlocknotes) | string | Lock notes. |

### Parameter: `jumpVmMaintenanceDefinition.lock.kind`

Lock type.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `jumpVmMaintenanceDefinition.lock.name`

Lock name.

- Required: No
- Type: string

### Parameter: `jumpVmMaintenanceDefinition.lock.notes`

Lock notes.

- Required: No
- Type: string

### Parameter: `jumpVmMaintenanceDefinition.maintenanceScope`

Maintenance scope of the configuration. Default is Host.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Extension'
    'Host'
    'InGuestPatch'
    'OSImage'
    'SQLDB'
    'SQLManagedInstance'
  ]
  ```

### Parameter: `jumpVmMaintenanceDefinition.maintenanceWindow`

Definition of the Maintenance Window.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-jumpvmmaintenancedefinitionmaintenancewindow>any_other_property<) | string | Arbitrary key for each maintenance window property. |

### Parameter: `jumpVmMaintenanceDefinition.maintenanceWindow.>Any_other_property<`

Arbitrary key for each maintenance window property.

- Required: Yes
- Type: string

### Parameter: `jumpVmMaintenanceDefinition.namespace`

Namespace of the resource.

- Required: No
- Type: string

### Parameter: `jumpVmMaintenanceDefinition.roleAssignments`

Role assignments to apply to the Maintenance Configuration.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-jumpvmmaintenancedefinitionroleassignmentsprincipalid) | string | Principal ID of the identity being assigned. |
| [`roleDefinitionIdOrName`](#parameter-jumpvmmaintenancedefinitionroleassignmentsroledefinitionidorname) | string | Role to assign (display name, GUID, or full resource ID). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-jumpvmmaintenancedefinitionroleassignmentscondition) | string | Condition for the role assignment. |
| [`conditionVersion`](#parameter-jumpvmmaintenancedefinitionroleassignmentsconditionversion) | string | Condition version. |
| [`delegatedManagedIdentityResourceId`](#parameter-jumpvmmaintenancedefinitionroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID. |
| [`description`](#parameter-jumpvmmaintenancedefinitionroleassignmentsdescription) | string | Description of the role assignment. |
| [`name`](#parameter-jumpvmmaintenancedefinitionroleassignmentsname) | string | Role assignment name (GUID). If omitted, a GUID is generated. |
| [`principalType`](#parameter-jumpvmmaintenancedefinitionroleassignmentsprincipaltype) | string | Principal type of the assigned identity. |

### Parameter: `jumpVmMaintenanceDefinition.roleAssignments.principalId`

Principal ID of the identity being assigned.

- Required: Yes
- Type: string

### Parameter: `jumpVmMaintenanceDefinition.roleAssignments.roleDefinitionIdOrName`

Role to assign (display name, GUID, or full resource ID).

- Required: Yes
- Type: string

### Parameter: `jumpVmMaintenanceDefinition.roleAssignments.condition`

Condition for the role assignment.

- Required: No
- Type: string

### Parameter: `jumpVmMaintenanceDefinition.roleAssignments.conditionVersion`

Condition version.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `jumpVmMaintenanceDefinition.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID.

- Required: No
- Type: string

### Parameter: `jumpVmMaintenanceDefinition.roleAssignments.description`

Description of the role assignment.

- Required: No
- Type: string

### Parameter: `jumpVmMaintenanceDefinition.roleAssignments.name`

Role assignment name (GUID). If omitted, a GUID is generated.

- Required: No
- Type: string

### Parameter: `jumpVmMaintenanceDefinition.roleAssignments.principalType`

Principal type of the assigned identity.

- Required: No
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

### Parameter: `jumpVmMaintenanceDefinition.tags`

Tags to apply to the Maintenance Configuration resource.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-jumpvmmaintenancedefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `jumpVmMaintenanceDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `jumpVmMaintenanceDefinition.visibility`

Visibility of the configuration. Default is Custom.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    ''
    'Custom'
    'Public'
  ]
  ```

### Parameter: `keyVaultDefinition`

Key Vault configuration for the GenAI app. Required if deployGenAiAppBackingServices is true, deployToggles.keyVault is true, and resourceIds.keyVaultResourceId is empty.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-keyvaultdefinitionname) | string | Name of the Key Vault. Must be globally unique. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`accessPolicies`](#parameter-keyvaultdefinitionaccesspolicies) | array | All access policies to create. |
| [`createMode`](#parameter-keyvaultdefinitioncreatemode) | string | The vault's create mode to indicate whether the vault needs to be recovered or not. |
| [`diagnosticSettings`](#parameter-keyvaultdefinitiondiagnosticsettings) | array | The diagnostic settings of the service. |
| [`enablePurgeProtection`](#parameter-keyvaultdefinitionenablepurgeprotection) | bool | Provide true to enable Key Vault purge protection feature. |
| [`enableRbacAuthorization`](#parameter-keyvaultdefinitionenablerbacauthorization) | bool | Controls how data actions are authorized. When true, RBAC is used for authorization. |
| [`enableSoftDelete`](#parameter-keyvaultdefinitionenablesoftdelete) | bool | Switch to enable/disable Key Vault soft delete feature. |
| [`enableTelemetry`](#parameter-keyvaultdefinitionenabletelemetry) | bool | Enable/Disable usage telemetry for module. |
| [`enableVaultForDeployment`](#parameter-keyvaultdefinitionenablevaultfordeployment) | bool | Specifies if the vault is enabled for deployment by script or compute. |
| [`enableVaultForDiskEncryption`](#parameter-keyvaultdefinitionenablevaultfordiskencryption) | bool | Specifies if the platform has access to the vault for disk encryption scenarios. |
| [`enableVaultForTemplateDeployment`](#parameter-keyvaultdefinitionenablevaultfortemplatedeployment) | bool | Specifies if the vault is enabled for a template deployment. |
| [`keys`](#parameter-keyvaultdefinitionkeys) | array | All keys to create. |
| [`location`](#parameter-keyvaultdefinitionlocation) | string | Location for all resources. |
| [`lock`](#parameter-keyvaultdefinitionlock) | object | The lock settings of the service. |
| [`networkAcls`](#parameter-keyvaultdefinitionnetworkacls) | object | Rules governing the accessibility of the resource from specific networks. |
| [`privateEndpoints`](#parameter-keyvaultdefinitionprivateendpoints) | array | Configuration details for private endpoints. |
| [`publicNetworkAccess`](#parameter-keyvaultdefinitionpublicnetworkaccess) | string | Whether or not public network access is allowed for this resource. |
| [`roleAssignments`](#parameter-keyvaultdefinitionroleassignments) | array | Array of role assignments to create at the vault level. |
| [`secrets`](#parameter-keyvaultdefinitionsecrets) | array | All secrets to create. |
| [`sku`](#parameter-keyvaultdefinitionsku) | string | Specifies the SKU for the vault. |
| [`softDeleteRetentionInDays`](#parameter-keyvaultdefinitionsoftdeleteretentionindays) | int | Soft delete retention days (between 7 and 90). |
| [`tags`](#parameter-keyvaultdefinitiontags) | object | Resource tags for the vault. |

### Parameter: `keyVaultDefinition.name`

Name of the Key Vault. Must be globally unique.

- Required: Yes
- Type: string

### Parameter: `keyVaultDefinition.accessPolicies`

All access policies to create.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`objectId`](#parameter-keyvaultdefinitionaccesspoliciesobjectid) | string | The object ID of a user, service principal or security group in the tenant for the vault. |
| [`permissions`](#parameter-keyvaultdefinitionaccesspoliciespermissions) | object | Permissions the identity has for keys, secrets and certificates. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`applicationId`](#parameter-keyvaultdefinitionaccesspoliciesapplicationid) | string | Application ID of the client making request on behalf of a principal. |
| [`tenantId`](#parameter-keyvaultdefinitionaccesspoliciestenantid) | string | The tenant ID that is used for authenticating requests to the key vault. |

### Parameter: `keyVaultDefinition.accessPolicies.objectId`

The object ID of a user, service principal or security group in the tenant for the vault.

- Required: Yes
- Type: string

### Parameter: `keyVaultDefinition.accessPolicies.permissions`

Permissions the identity has for keys, secrets and certificates.

- Required: Yes
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`certificates`](#parameter-keyvaultdefinitionaccesspoliciespermissionscertificates) | array | Permissions to certificates. |
| [`keys`](#parameter-keyvaultdefinitionaccesspoliciespermissionskeys) | array | Permissions to keys. |
| [`secrets`](#parameter-keyvaultdefinitionaccesspoliciespermissionssecrets) | array | Permissions to secrets. |
| [`storage`](#parameter-keyvaultdefinitionaccesspoliciespermissionsstorage) | array | Permissions to storage accounts. |

### Parameter: `keyVaultDefinition.accessPolicies.permissions.certificates`

Permissions to certificates.

- Required: No
- Type: array
- Allowed:
  ```Bicep
  [
    'all'
    'backup'
    'create'
    'delete'
    'deleteissuers'
    'get'
    'getissuers'
    'import'
    'list'
    'listissuers'
    'managecontacts'
    'manageissuers'
    'purge'
    'recover'
    'restore'
    'setissuers'
    'update'
  ]
  ```

### Parameter: `keyVaultDefinition.accessPolicies.permissions.keys`

Permissions to keys.

- Required: No
- Type: array
- Allowed:
  ```Bicep
  [
    'all'
    'backup'
    'create'
    'decrypt'
    'delete'
    'encrypt'
    'get'
    'getrotationpolicy'
    'import'
    'list'
    'purge'
    'recover'
    'release'
    'restore'
    'rotate'
    'setrotationpolicy'
    'sign'
    'unwrapKey'
    'update'
    'verify'
    'wrapKey'
  ]
  ```

### Parameter: `keyVaultDefinition.accessPolicies.permissions.secrets`

Permissions to secrets.

- Required: No
- Type: array
- Allowed:
  ```Bicep
  [
    'all'
    'backup'
    'delete'
    'get'
    'list'
    'purge'
    'recover'
    'restore'
    'set'
  ]
  ```

### Parameter: `keyVaultDefinition.accessPolicies.permissions.storage`

Permissions to storage accounts.

- Required: No
- Type: array
- Allowed:
  ```Bicep
  [
    'all'
    'backup'
    'delete'
    'deletesas'
    'get'
    'getsas'
    'list'
    'listsas'
    'purge'
    'recover'
    'regeneratekey'
    'restore'
    'set'
    'setsas'
    'update'
  ]
  ```

### Parameter: `keyVaultDefinition.accessPolicies.applicationId`

Application ID of the client making request on behalf of a principal.

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.accessPolicies.tenantId`

The tenant ID that is used for authenticating requests to the key vault.

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.createMode`

The vault's create mode to indicate whether the vault needs to be recovered or not.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'default'
    'recover'
  ]
  ```

### Parameter: `keyVaultDefinition.diagnosticSettings`

The diagnostic settings of the service.

- Required: No
- Type: array

### Parameter: `keyVaultDefinition.enablePurgeProtection`

Provide true to enable Key Vault purge protection feature.

- Required: No
- Type: bool

### Parameter: `keyVaultDefinition.enableRbacAuthorization`

Controls how data actions are authorized. When true, RBAC is used for authorization.

- Required: No
- Type: bool

### Parameter: `keyVaultDefinition.enableSoftDelete`

Switch to enable/disable Key Vault soft delete feature.

- Required: No
- Type: bool

### Parameter: `keyVaultDefinition.enableTelemetry`

Enable/Disable usage telemetry for module.

- Required: No
- Type: bool

### Parameter: `keyVaultDefinition.enableVaultForDeployment`

Specifies if the vault is enabled for deployment by script or compute.

- Required: No
- Type: bool

### Parameter: `keyVaultDefinition.enableVaultForDiskEncryption`

Specifies if the platform has access to the vault for disk encryption scenarios.

- Required: No
- Type: bool

### Parameter: `keyVaultDefinition.enableVaultForTemplateDeployment`

Specifies if the vault is enabled for a template deployment.

- Required: No
- Type: bool

### Parameter: `keyVaultDefinition.keys`

All keys to create.

- Required: No
- Type: array

### Parameter: `keyVaultDefinition.location`

Location for all resources.

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.lock`

The lock settings of the service.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-keyvaultdefinitionlockkind) | string | Specify the type of lock. |
| [`name`](#parameter-keyvaultdefinitionlockname) | string | Specify the name of the lock. |
| [`notes`](#parameter-keyvaultdefinitionlocknotes) | string | Specify the notes of the lock. |

### Parameter: `keyVaultDefinition.lock.kind`

Specify the type of lock.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `keyVaultDefinition.lock.name`

Specify the name of the lock.

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.lock.notes`

Specify the notes of the lock.

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.networkAcls`

Rules governing the accessibility of the resource from specific networks.

- Required: No
- Type: object

### Parameter: `keyVaultDefinition.privateEndpoints`

Configuration details for private endpoints.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`subnetResourceId`](#parameter-keyvaultdefinitionprivateendpointssubnetresourceid) | string | Resource ID of the subnet where the endpoint needs to be created. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`applicationSecurityGroupResourceIds`](#parameter-keyvaultdefinitionprivateendpointsapplicationsecuritygroupresourceids) | array | Application security groups in which the Private Endpoint IP configuration is included. |
| [`customDnsConfigs`](#parameter-keyvaultdefinitionprivateendpointscustomdnsconfigs) | array | Custom DNS configurations. |
| [`customNetworkInterfaceName`](#parameter-keyvaultdefinitionprivateendpointscustomnetworkinterfacename) | string | The custom name of the network interface attached to the Private Endpoint. |
| [`enableTelemetry`](#parameter-keyvaultdefinitionprivateendpointsenabletelemetry) | bool | Enable/Disable usage telemetry for module. |
| [`ipConfigurations`](#parameter-keyvaultdefinitionprivateendpointsipconfigurations) | array | A list of IP configurations of the Private Endpoint. |
| [`isManualConnection`](#parameter-keyvaultdefinitionprivateendpointsismanualconnection) | bool | If Manual Private Link Connection is required. |
| [`location`](#parameter-keyvaultdefinitionprivateendpointslocation) | string | The location to deploy the Private Endpoint to. |
| [`lock`](#parameter-keyvaultdefinitionprivateendpointslock) | object | Lock settings for the Private Endpoint. |
| [`manualConnectionRequestMessage`](#parameter-keyvaultdefinitionprivateendpointsmanualconnectionrequestmessage) | string | A message passed with the manual connection request. |
| [`name`](#parameter-keyvaultdefinitionprivateendpointsname) | string | The name of the Private Endpoint. |
| [`privateDnsZoneGroup`](#parameter-keyvaultdefinitionprivateendpointsprivatednszonegroup) | object | The private DNS zone group to configure for the Private Endpoint. |
| [`privateLinkServiceConnectionName`](#parameter-keyvaultdefinitionprivateendpointsprivatelinkserviceconnectionname) | string | The name of the private link connection to create. |
| [`resourceGroupResourceId`](#parameter-keyvaultdefinitionprivateendpointsresourcegroupresourceid) | string | The resource ID of the Resource Group the Private Endpoint will be created in. |
| [`roleAssignments`](#parameter-keyvaultdefinitionprivateendpointsroleassignments) | array | Array of role assignments to create for the Private Endpoint. |
| [`service`](#parameter-keyvaultdefinitionprivateendpointsservice) | string | The subresource to deploy the Private Endpoint for (e.g., vault). |
| [`tags`](#parameter-keyvaultdefinitionprivateendpointstags) | object | Tags for the Private Endpoint. |

### Parameter: `keyVaultDefinition.privateEndpoints.subnetResourceId`

Resource ID of the subnet where the endpoint needs to be created.

- Required: Yes
- Type: string

### Parameter: `keyVaultDefinition.privateEndpoints.applicationSecurityGroupResourceIds`

Application security groups in which the Private Endpoint IP configuration is included.

- Required: No
- Type: array

### Parameter: `keyVaultDefinition.privateEndpoints.customDnsConfigs`

Custom DNS configurations.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`ipAddresses`](#parameter-keyvaultdefinitionprivateendpointscustomdnsconfigsipaddresses) | array | A list of private IP addresses of the private endpoint. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`fqdn`](#parameter-keyvaultdefinitionprivateendpointscustomdnsconfigsfqdn) | string | FQDN that resolves to private endpoint IP address. |

### Parameter: `keyVaultDefinition.privateEndpoints.customDnsConfigs.ipAddresses`

A list of private IP addresses of the private endpoint.

- Required: Yes
- Type: array

### Parameter: `keyVaultDefinition.privateEndpoints.customDnsConfigs.fqdn`

FQDN that resolves to private endpoint IP address.

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.privateEndpoints.customNetworkInterfaceName`

The custom name of the network interface attached to the Private Endpoint.

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.privateEndpoints.enableTelemetry`

Enable/Disable usage telemetry for module.

- Required: No
- Type: bool

### Parameter: `keyVaultDefinition.privateEndpoints.ipConfigurations`

A list of IP configurations of the Private Endpoint.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-keyvaultdefinitionprivateendpointsipconfigurationsname) | string | The name of the resource that is unique within a resource group. |
| [`properties`](#parameter-keyvaultdefinitionprivateendpointsipconfigurationsproperties) | object | Properties of private endpoint IP configurations. |

### Parameter: `keyVaultDefinition.privateEndpoints.ipConfigurations.name`

The name of the resource that is unique within a resource group.

- Required: Yes
- Type: string

### Parameter: `keyVaultDefinition.privateEndpoints.ipConfigurations.properties`

Properties of private endpoint IP configurations.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`groupId`](#parameter-keyvaultdefinitionprivateendpointsipconfigurationspropertiesgroupid) | string | The ID of a group obtained from the remote resource to connect to. |
| [`memberName`](#parameter-keyvaultdefinitionprivateendpointsipconfigurationspropertiesmembername) | string | The member name of a group obtained from the remote resource. |
| [`privateIPAddress`](#parameter-keyvaultdefinitionprivateendpointsipconfigurationspropertiesprivateipaddress) | string | A private IP address obtained from the private endpoint's subnet. |

### Parameter: `keyVaultDefinition.privateEndpoints.ipConfigurations.properties.groupId`

The ID of a group obtained from the remote resource to connect to.

- Required: Yes
- Type: string

### Parameter: `keyVaultDefinition.privateEndpoints.ipConfigurations.properties.memberName`

The member name of a group obtained from the remote resource.

- Required: Yes
- Type: string

### Parameter: `keyVaultDefinition.privateEndpoints.ipConfigurations.properties.privateIPAddress`

A private IP address obtained from the private endpoint's subnet.

- Required: Yes
- Type: string

### Parameter: `keyVaultDefinition.privateEndpoints.isManualConnection`

If Manual Private Link Connection is required.

- Required: No
- Type: bool

### Parameter: `keyVaultDefinition.privateEndpoints.location`

The location to deploy the Private Endpoint to.

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.privateEndpoints.lock`

Lock settings for the Private Endpoint.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-keyvaultdefinitionprivateendpointslockkind) | string | Specify the type of lock. |
| [`name`](#parameter-keyvaultdefinitionprivateendpointslockname) | string | Specify the name of the lock. |
| [`notes`](#parameter-keyvaultdefinitionprivateendpointslocknotes) | string | Specify the notes of the lock. |

### Parameter: `keyVaultDefinition.privateEndpoints.lock.kind`

Specify the type of lock.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `keyVaultDefinition.privateEndpoints.lock.name`

Specify the name of the lock.

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.privateEndpoints.lock.notes`

Specify the notes of the lock.

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.privateEndpoints.manualConnectionRequestMessage`

A message passed with the manual connection request.

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.privateEndpoints.name`

The name of the Private Endpoint.

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.privateEndpoints.privateDnsZoneGroup`

The private DNS zone group to configure for the Private Endpoint.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`privateDnsZoneGroupConfigs`](#parameter-keyvaultdefinitionprivateendpointsprivatednszonegroupprivatednszonegroupconfigs) | array | The private DNS Zone Groups to associate the Private Endpoint. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-keyvaultdefinitionprivateendpointsprivatednszonegroupname) | string | The name of the Private DNS Zone Group. |

### Parameter: `keyVaultDefinition.privateEndpoints.privateDnsZoneGroup.privateDnsZoneGroupConfigs`

The private DNS Zone Groups to associate the Private Endpoint.

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`privateDnsZoneResourceId`](#parameter-keyvaultdefinitionprivateendpointsprivatednszonegroupprivatednszonegroupconfigsprivatednszoneresourceid) | string | The resource ID of the private DNS zone. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-keyvaultdefinitionprivateendpointsprivatednszonegroupprivatednszonegroupconfigsname) | string | The name of the private DNS Zone Group config. |

### Parameter: `keyVaultDefinition.privateEndpoints.privateDnsZoneGroup.privateDnsZoneGroupConfigs.privateDnsZoneResourceId`

The resource ID of the private DNS zone.

- Required: Yes
- Type: string

### Parameter: `keyVaultDefinition.privateEndpoints.privateDnsZoneGroup.privateDnsZoneGroupConfigs.name`

The name of the private DNS Zone Group config.

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.privateEndpoints.privateDnsZoneGroup.name`

The name of the Private DNS Zone Group.

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.privateEndpoints.privateLinkServiceConnectionName`

The name of the private link connection to create.

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.privateEndpoints.resourceGroupResourceId`

The resource ID of the Resource Group the Private Endpoint will be created in.

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.privateEndpoints.roleAssignments`

Array of role assignments to create for the Private Endpoint.

- Required: No
- Type: array

### Parameter: `keyVaultDefinition.privateEndpoints.service`

The subresource to deploy the Private Endpoint for (e.g., vault).

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.privateEndpoints.tags`

Tags for the Private Endpoint.

- Required: No
- Type: object

### Parameter: `keyVaultDefinition.publicNetworkAccess`

Whether or not public network access is allowed for this resource.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    ''
    'Disabled'
    'Enabled'
  ]
  ```

### Parameter: `keyVaultDefinition.roleAssignments`

Array of role assignments to create at the vault level.

- Required: No
- Type: array

### Parameter: `keyVaultDefinition.secrets`

All secrets to create.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-keyvaultdefinitionsecretsname) | string | The name of the secret. |
| [`value`](#parameter-keyvaultdefinitionsecretsvalue) | securestring | The value of the secret. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`attributes`](#parameter-keyvaultdefinitionsecretsattributes) | object | Contains attributes of the secret. |
| [`contentType`](#parameter-keyvaultdefinitionsecretscontenttype) | string | The content type of the secret. |
| [`roleAssignments`](#parameter-keyvaultdefinitionsecretsroleassignments) | array | Array of role assignments to create for the secret. |
| [`tags`](#parameter-keyvaultdefinitionsecretstags) | object | Resource tags for the secret. |

### Parameter: `keyVaultDefinition.secrets.name`

The name of the secret.

- Required: Yes
- Type: string

### Parameter: `keyVaultDefinition.secrets.value`

The value of the secret.

- Required: Yes
- Type: securestring

### Parameter: `keyVaultDefinition.secrets.attributes`

Contains attributes of the secret.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enabled`](#parameter-keyvaultdefinitionsecretsattributesenabled) | bool | Defines whether the secret is enabled or disabled. |
| [`exp`](#parameter-keyvaultdefinitionsecretsattributesexp) | int | Expiration time of the secret, in epoch seconds. |
| [`nbf`](#parameter-keyvaultdefinitionsecretsattributesnbf) | int | Not-before time of the secret, in epoch seconds. |

### Parameter: `keyVaultDefinition.secrets.attributes.enabled`

Defines whether the secret is enabled or disabled.

- Required: No
- Type: bool

### Parameter: `keyVaultDefinition.secrets.attributes.exp`

Expiration time of the secret, in epoch seconds.

- Required: No
- Type: int

### Parameter: `keyVaultDefinition.secrets.attributes.nbf`

Not-before time of the secret, in epoch seconds.

- Required: No
- Type: int

### Parameter: `keyVaultDefinition.secrets.contentType`

The content type of the secret.

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.secrets.roleAssignments`

Array of role assignments to create for the secret.

- Required: No
- Type: array

### Parameter: `keyVaultDefinition.secrets.tags`

Resource tags for the secret.

- Required: No
- Type: object

### Parameter: `keyVaultDefinition.sku`

Specifies the SKU for the vault.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'premium'
    'standard'
  ]
  ```

### Parameter: `keyVaultDefinition.softDeleteRetentionInDays`

Soft delete retention days (between 7 and 90).

- Required: No
- Type: int

### Parameter: `keyVaultDefinition.tags`

Resource tags for the vault.

- Required: No
- Type: object

### Parameter: `logAnalyticsDefinition`

Log Analytics Workspace configuration. Required if deployToggles.logAnalytics is true and resourceIds.logAnalyticsWorkspaceResourceId is empty.

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      name: ''
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-loganalyticsdefinitionname) | string | Name of the Log Analytics workspace. |

**Conditional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`linkedStorageAccounts`](#parameter-loganalyticsdefinitionlinkedstorageaccounts) | array | List of Storage Accounts to be linked. Required if forceCmkForQuery is true and savedSearches is not empty. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`dailyQuotaGb`](#parameter-loganalyticsdefinitiondailyquotagb) | int | Daily ingestion quota in GB. Default is -1. |
| [`dataExports`](#parameter-loganalyticsdefinitiondataexports) | array | Data export instances for the workspace. |
| [`dataRetention`](#parameter-loganalyticsdefinitiondataretention) | int | Number of days data will be retained. Default 365 (0–730). |
| [`dataSources`](#parameter-loganalyticsdefinitiondatasources) | array | Data sources for the workspace. |
| [`diagnosticSettings`](#parameter-loganalyticsdefinitiondiagnosticsettings) | array | Diagnostic settings for the workspace. |
| [`enableTelemetry`](#parameter-loganalyticsdefinitionenabletelemetry) | bool | Enable or disable telemetry. Default true. |
| [`features`](#parameter-loganalyticsdefinitionfeatures) | object | Features for the workspace. |
| [`forceCmkForQuery`](#parameter-loganalyticsdefinitionforcecmkforquery) | bool | Enforce customer-managed storage for queries. |
| [`gallerySolutions`](#parameter-loganalyticsdefinitiongallerysolutions) | array | Gallery solutions for the workspace. |
| [`linkedServices`](#parameter-loganalyticsdefinitionlinkedservices) | array | Linked services for the workspace. |
| [`location`](#parameter-loganalyticsdefinitionlocation) | string | Location of the workspace. Default: resourceGroup().location. |
| [`lock`](#parameter-loganalyticsdefinitionlock) | object | Lock settings. |
| [`managedIdentities`](#parameter-loganalyticsdefinitionmanagedidentities) | object | Managed identity definition (system-assigned or user-assigned). |
| [`onboardWorkspaceToSentinel`](#parameter-loganalyticsdefinitiononboardworkspacetosentinel) | bool | Onboard workspace to Sentinel. Requires SecurityInsights solution. |
| [`publicNetworkAccessForIngestion`](#parameter-loganalyticsdefinitionpublicnetworkaccessforingestion) | string | Network access for ingestion. Allowed: Disabled, Enabled. |
| [`publicNetworkAccessForQuery`](#parameter-loganalyticsdefinitionpublicnetworkaccessforquery) | string | Network access for query. Allowed: Disabled, Enabled. |
| [`replication`](#parameter-loganalyticsdefinitionreplication) | object | Replication settings. |
| [`roleAssignments`](#parameter-loganalyticsdefinitionroleassignments) | array | Role assignments for the workspace. |
| [`savedSearches`](#parameter-loganalyticsdefinitionsavedsearches) | array | Saved KQL searches. |
| [`skuCapacityReservationLevel`](#parameter-loganalyticsdefinitionskucapacityreservationlevel) | int | Capacity reservation level in GB (100–5000 in increments of 100). |
| [`skuName`](#parameter-loganalyticsdefinitionskuname) | string | SKU name. Allowed: CapacityReservation, Free, LACluster, PerGB2018, PerNode, Premium, Standalone, Standard. |
| [`storageInsightsConfigs`](#parameter-loganalyticsdefinitionstorageinsightsconfigs) | array | Storage insights configs for linked storage accounts. |
| [`tables`](#parameter-loganalyticsdefinitiontables) | array | Custom LAW tables to be deployed. |
| [`tags`](#parameter-loganalyticsdefinitiontags) | object | Tags for the workspace. |

### Parameter: `logAnalyticsDefinition.name`

Name of the Log Analytics workspace.

- Required: Yes
- Type: string

### Parameter: `logAnalyticsDefinition.linkedStorageAccounts`

List of Storage Accounts to be linked. Required if forceCmkForQuery is true and savedSearches is not empty.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-loganalyticsdefinitionlinkedstorageaccountsname) | string | Name of the storage link. |
| [`storageAccountIds`](#parameter-loganalyticsdefinitionlinkedstorageaccountsstorageaccountids) | array | Linked storage accounts resource IDs. |

### Parameter: `logAnalyticsDefinition.linkedStorageAccounts.name`

Name of the storage link.

- Required: Yes
- Type: string

### Parameter: `logAnalyticsDefinition.linkedStorageAccounts.storageAccountIds`

Linked storage accounts resource IDs.

- Required: Yes
- Type: array

### Parameter: `logAnalyticsDefinition.dailyQuotaGb`

Daily ingestion quota in GB. Default is -1.

- Required: No
- Type: int

### Parameter: `logAnalyticsDefinition.dataExports`

Data export instances for the workspace.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-loganalyticsdefinitiondataexportsname) | string | Name of the data export. |
| [`tableNames`](#parameter-loganalyticsdefinitiondataexportstablenames) | array | Table names to export. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`destination`](#parameter-loganalyticsdefinitiondataexportsdestination) | object | Destination configuration for the export. |
| [`enable`](#parameter-loganalyticsdefinitiondataexportsenable) | bool | Enable or disable the data export. |

### Parameter: `logAnalyticsDefinition.dataExports.name`

Name of the data export.

- Required: Yes
- Type: string

### Parameter: `logAnalyticsDefinition.dataExports.tableNames`

Table names to export.

- Required: Yes
- Type: array

### Parameter: `logAnalyticsDefinition.dataExports.destination`

Destination configuration for the export.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`resourceId`](#parameter-loganalyticsdefinitiondataexportsdestinationresourceid) | string | Destination resource ID. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`metaData`](#parameter-loganalyticsdefinitiondataexportsdestinationmetadata) | object | Destination metadata. |

### Parameter: `logAnalyticsDefinition.dataExports.destination.resourceId`

Destination resource ID.

- Required: Yes
- Type: string

### Parameter: `logAnalyticsDefinition.dataExports.destination.metaData`

Destination metadata.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`eventHubName`](#parameter-loganalyticsdefinitiondataexportsdestinationmetadataeventhubname) | string | Event Hub name (not applicable when destination is Storage Account). |

### Parameter: `logAnalyticsDefinition.dataExports.destination.metaData.eventHubName`

Event Hub name (not applicable when destination is Storage Account).

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.dataExports.enable`

Enable or disable the data export.

- Required: No
- Type: bool

### Parameter: `logAnalyticsDefinition.dataRetention`

Number of days data will be retained. Default 365 (0–730).

- Required: No
- Type: int

### Parameter: `logAnalyticsDefinition.dataSources`

Data sources for the workspace.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-loganalyticsdefinitiondatasourceskind) | string | Kind of data source. |
| [`name`](#parameter-loganalyticsdefinitiondatasourcesname) | string | Name of the data source. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`counterName`](#parameter-loganalyticsdefinitiondatasourcescountername) | string | Counter name for WindowsPerformanceCounter. |
| [`eventLogName`](#parameter-loganalyticsdefinitiondatasourceseventlogname) | string | Event log name for WindowsEvent. |
| [`eventTypes`](#parameter-loganalyticsdefinitiondatasourceseventtypes) | array | Event types for WindowsEvent. |
| [`instanceName`](#parameter-loganalyticsdefinitiondatasourcesinstancename) | string | Instance name for WindowsPerformanceCounter or LinuxPerformanceObject. |
| [`intervalSeconds`](#parameter-loganalyticsdefinitiondatasourcesintervalseconds) | int | Interval in seconds for collection. |
| [`linkedResourceId`](#parameter-loganalyticsdefinitiondatasourceslinkedresourceid) | string | Resource ID linked to the workspace. |
| [`objectName`](#parameter-loganalyticsdefinitiondatasourcesobjectname) | string | Object name for WindowsPerformanceCounter or LinuxPerformanceObject. |
| [`performanceCounters`](#parameter-loganalyticsdefinitiondatasourcesperformancecounters) | array | Performance counters for LinuxPerformanceObject. |
| [`state`](#parameter-loganalyticsdefinitiondatasourcesstate) | string | State (for IISLogs, LinuxSyslogCollection, or LinuxPerformanceCollection). |
| [`syslogName`](#parameter-loganalyticsdefinitiondatasourcessyslogname) | string | System log name for LinuxSyslog. |
| [`syslogSeverities`](#parameter-loganalyticsdefinitiondatasourcessyslogseverities) | array | Severities for LinuxSyslog. |
| [`tags`](#parameter-loganalyticsdefinitiondatasourcestags) | object | Tags for the data source. |

### Parameter: `logAnalyticsDefinition.dataSources.kind`

Kind of data source.

- Required: Yes
- Type: string

### Parameter: `logAnalyticsDefinition.dataSources.name`

Name of the data source.

- Required: Yes
- Type: string

### Parameter: `logAnalyticsDefinition.dataSources.counterName`

Counter name for WindowsPerformanceCounter.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.dataSources.eventLogName`

Event log name for WindowsEvent.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.dataSources.eventTypes`

Event types for WindowsEvent.

- Required: No
- Type: array

### Parameter: `logAnalyticsDefinition.dataSources.instanceName`

Instance name for WindowsPerformanceCounter or LinuxPerformanceObject.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.dataSources.intervalSeconds`

Interval in seconds for collection.

- Required: No
- Type: int

### Parameter: `logAnalyticsDefinition.dataSources.linkedResourceId`

Resource ID linked to the workspace.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.dataSources.objectName`

Object name for WindowsPerformanceCounter or LinuxPerformanceObject.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.dataSources.performanceCounters`

Performance counters for LinuxPerformanceObject.

- Required: No
- Type: array

### Parameter: `logAnalyticsDefinition.dataSources.state`

State (for IISLogs, LinuxSyslogCollection, or LinuxPerformanceCollection).

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.dataSources.syslogName`

System log name for LinuxSyslog.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.dataSources.syslogSeverities`

Severities for LinuxSyslog.

- Required: No
- Type: array

### Parameter: `logAnalyticsDefinition.dataSources.tags`

Tags for the data source.

- Required: No
- Type: object

### Parameter: `logAnalyticsDefinition.diagnosticSettings`

Diagnostic settings for the workspace.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`eventHubAuthorizationRuleResourceId`](#parameter-loganalyticsdefinitiondiagnosticsettingseventhubauthorizationruleresourceid) | string | Event Hub authorization rule resource ID. |
| [`eventHubName`](#parameter-loganalyticsdefinitiondiagnosticsettingseventhubname) | string | Diagnostic Event Hub name. |
| [`logAnalyticsDestinationType`](#parameter-loganalyticsdefinitiondiagnosticsettingsloganalyticsdestinationtype) | string | Destination type for Log Analytics. Allowed: AzureDiagnostics, Dedicated. |
| [`logCategoriesAndGroups`](#parameter-loganalyticsdefinitiondiagnosticsettingslogcategoriesandgroups) | array | Log categories and groups to stream. |
| [`marketplacePartnerResourceId`](#parameter-loganalyticsdefinitiondiagnosticsettingsmarketplacepartnerresourceid) | string | Marketplace partner resource ID. |
| [`metricCategories`](#parameter-loganalyticsdefinitiondiagnosticsettingsmetriccategories) | array | Metric categories to stream. |
| [`name`](#parameter-loganalyticsdefinitiondiagnosticsettingsname) | string | Diagnostic setting name. |
| [`storageAccountResourceId`](#parameter-loganalyticsdefinitiondiagnosticsettingsstorageaccountresourceid) | string | Storage account resource ID for diagnostic logs. |
| [`useThisWorkspace`](#parameter-loganalyticsdefinitiondiagnosticsettingsusethisworkspace) | bool | Use this workspace as diagnostic target (ignores workspaceResourceId). |
| [`workspaceResourceId`](#parameter-loganalyticsdefinitiondiagnosticsettingsworkspaceresourceid) | string | Log Analytics workspace resource ID for diagnostics. |

### Parameter: `logAnalyticsDefinition.diagnosticSettings.eventHubAuthorizationRuleResourceId`

Event Hub authorization rule resource ID.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.diagnosticSettings.eventHubName`

Diagnostic Event Hub name.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.diagnosticSettings.logAnalyticsDestinationType`

Destination type for Log Analytics. Allowed: AzureDiagnostics, Dedicated.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'AzureDiagnostics'
    'Dedicated'
  ]
  ```

### Parameter: `logAnalyticsDefinition.diagnosticSettings.logCategoriesAndGroups`

Log categories and groups to stream.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-loganalyticsdefinitiondiagnosticsettingslogcategoriesandgroupscategory) | string | Log category name. |
| [`categoryGroup`](#parameter-loganalyticsdefinitiondiagnosticsettingslogcategoriesandgroupscategorygroup) | string | Log category group name. |
| [`enabled`](#parameter-loganalyticsdefinitiondiagnosticsettingslogcategoriesandgroupsenabled) | bool | Enable or disable the category. Default true. |

### Parameter: `logAnalyticsDefinition.diagnosticSettings.logCategoriesAndGroups.category`

Log category name.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.diagnosticSettings.logCategoriesAndGroups.categoryGroup`

Log category group name.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.diagnosticSettings.logCategoriesAndGroups.enabled`

Enable or disable the category. Default true.

- Required: No
- Type: bool

### Parameter: `logAnalyticsDefinition.diagnosticSettings.marketplacePartnerResourceId`

Marketplace partner resource ID.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.diagnosticSettings.metricCategories`

Metric categories to stream.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-loganalyticsdefinitiondiagnosticsettingsmetriccategoriescategory) | string | Diagnostic metric category name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enabled`](#parameter-loganalyticsdefinitiondiagnosticsettingsmetriccategoriesenabled) | bool | Enable or disable the metric category. Default true. |

### Parameter: `logAnalyticsDefinition.diagnosticSettings.metricCategories.category`

Diagnostic metric category name.

- Required: Yes
- Type: string

### Parameter: `logAnalyticsDefinition.diagnosticSettings.metricCategories.enabled`

Enable or disable the metric category. Default true.

- Required: No
- Type: bool

### Parameter: `logAnalyticsDefinition.diagnosticSettings.name`

Diagnostic setting name.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.diagnosticSettings.storageAccountResourceId`

Storage account resource ID for diagnostic logs.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.diagnosticSettings.useThisWorkspace`

Use this workspace as diagnostic target (ignores workspaceResourceId).

- Required: No
- Type: bool

### Parameter: `logAnalyticsDefinition.diagnosticSettings.workspaceResourceId`

Log Analytics workspace resource ID for diagnostics.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.enableTelemetry`

Enable or disable telemetry. Default true.

- Required: No
- Type: bool

### Parameter: `logAnalyticsDefinition.features`

Features for the workspace.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`disableLocalAuth`](#parameter-loganalyticsdefinitionfeaturesdisablelocalauth) | bool | Disable non-EntraID auth. Default true. |
| [`enableDataExport`](#parameter-loganalyticsdefinitionfeaturesenabledataexport) | bool | Enable data export. |
| [`enableLogAccessUsingOnlyResourcePermissions`](#parameter-loganalyticsdefinitionfeaturesenablelogaccessusingonlyresourcepermissions) | bool | Enable log access using only resource permissions. Default false. |
| [`immediatePurgeDataOn30Days`](#parameter-loganalyticsdefinitionfeaturesimmediatepurgedataon30days) | bool | Remove data after 30 days. |

### Parameter: `logAnalyticsDefinition.features.disableLocalAuth`

Disable non-EntraID auth. Default true.

- Required: No
- Type: bool

### Parameter: `logAnalyticsDefinition.features.enableDataExport`

Enable data export.

- Required: No
- Type: bool

### Parameter: `logAnalyticsDefinition.features.enableLogAccessUsingOnlyResourcePermissions`

Enable log access using only resource permissions. Default false.

- Required: No
- Type: bool

### Parameter: `logAnalyticsDefinition.features.immediatePurgeDataOn30Days`

Remove data after 30 days.

- Required: No
- Type: bool

### Parameter: `logAnalyticsDefinition.forceCmkForQuery`

Enforce customer-managed storage for queries.

- Required: No
- Type: bool

### Parameter: `logAnalyticsDefinition.gallerySolutions`

Gallery solutions for the workspace.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-loganalyticsdefinitiongallerysolutionsname) | string | Solution name. Must follow Microsoft or 3rd party naming convention. |
| [`plan`](#parameter-loganalyticsdefinitiongallerysolutionsplan) | object | Plan for the gallery solution. |

### Parameter: `logAnalyticsDefinition.gallerySolutions.name`

Solution name. Must follow Microsoft or 3rd party naming convention.

- Required: Yes
- Type: string

### Parameter: `logAnalyticsDefinition.gallerySolutions.plan`

Plan for the gallery solution.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`product`](#parameter-loganalyticsdefinitiongallerysolutionsplanproduct) | string | Product name (e.g., OMSGallery/AntiMalware). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-loganalyticsdefinitiongallerysolutionsplanname) | string | Solution name (defaults to gallerySolutions.name). |
| [`publisher`](#parameter-loganalyticsdefinitiongallerysolutionsplanpublisher) | string | Publisher name (default: Microsoft for Microsoft solutions). |

### Parameter: `logAnalyticsDefinition.gallerySolutions.plan.product`

Product name (e.g., OMSGallery/AntiMalware).

- Required: Yes
- Type: string

### Parameter: `logAnalyticsDefinition.gallerySolutions.plan.name`

Solution name (defaults to gallerySolutions.name).

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.gallerySolutions.plan.publisher`

Publisher name (default: Microsoft for Microsoft solutions).

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.linkedServices`

Linked services for the workspace.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-loganalyticsdefinitionlinkedservicesname) | string | Name of the linked service. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`resourceId`](#parameter-loganalyticsdefinitionlinkedservicesresourceid) | string | Resource ID of the linked service (read access). |
| [`writeAccessResourceId`](#parameter-loganalyticsdefinitionlinkedserviceswriteaccessresourceid) | string | Resource ID for write access. |

### Parameter: `logAnalyticsDefinition.linkedServices.name`

Name of the linked service.

- Required: Yes
- Type: string

### Parameter: `logAnalyticsDefinition.linkedServices.resourceId`

Resource ID of the linked service (read access).

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.linkedServices.writeAccessResourceId`

Resource ID for write access.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.location`

Location of the workspace. Default: resourceGroup().location.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.lock`

Lock settings.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-loganalyticsdefinitionlockkind) | string | Lock type. Allowed values: CanNotDelete, None, ReadOnly. |
| [`name`](#parameter-loganalyticsdefinitionlockname) | string | Lock name. |
| [`notes`](#parameter-loganalyticsdefinitionlocknotes) | string | Lock notes. |

### Parameter: `logAnalyticsDefinition.lock.kind`

Lock type. Allowed values: CanNotDelete, None, ReadOnly.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `logAnalyticsDefinition.lock.name`

Lock name.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.lock.notes`

Lock notes.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.managedIdentities`

Managed identity definition (system-assigned or user-assigned).

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`systemAssigned`](#parameter-loganalyticsdefinitionmanagedidentitiessystemassigned) | bool | Enable system-assigned identity. |
| [`userAssignedResourceIds`](#parameter-loganalyticsdefinitionmanagedidentitiesuserassignedresourceids) | array | User-assigned identity resource IDs. |

### Parameter: `logAnalyticsDefinition.managedIdentities.systemAssigned`

Enable system-assigned identity.

- Required: No
- Type: bool

### Parameter: `logAnalyticsDefinition.managedIdentities.userAssignedResourceIds`

User-assigned identity resource IDs.

- Required: No
- Type: array

### Parameter: `logAnalyticsDefinition.onboardWorkspaceToSentinel`

Onboard workspace to Sentinel. Requires SecurityInsights solution.

- Required: No
- Type: bool

### Parameter: `logAnalyticsDefinition.publicNetworkAccessForIngestion`

Network access for ingestion. Allowed: Disabled, Enabled.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Disabled'
    'Enabled'
  ]
  ```

### Parameter: `logAnalyticsDefinition.publicNetworkAccessForQuery`

Network access for query. Allowed: Disabled, Enabled.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Disabled'
    'Enabled'
  ]
  ```

### Parameter: `logAnalyticsDefinition.replication`

Replication settings.

- Required: No
- Type: object

**Conditional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`location`](#parameter-loganalyticsdefinitionreplicationlocation) | string | Replication location. Required if replication is enabled. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enabled`](#parameter-loganalyticsdefinitionreplicationenabled) | bool | Enable replication. |

### Parameter: `logAnalyticsDefinition.replication.location`

Replication location. Required if replication is enabled.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.replication.enabled`

Enable replication.

- Required: No
- Type: bool

### Parameter: `logAnalyticsDefinition.roleAssignments`

Role assignments for the workspace.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-loganalyticsdefinitionroleassignmentsprincipalid) | string | Principal ID to assign. |
| [`roleDefinitionIdOrName`](#parameter-loganalyticsdefinitionroleassignmentsroledefinitionidorname) | string | Role definition ID, name, or GUID. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-loganalyticsdefinitionroleassignmentscondition) | string | Condition for the role assignment. |
| [`conditionVersion`](#parameter-loganalyticsdefinitionroleassignmentsconditionversion) | string | Condition version. Allowed: 2.0. |
| [`delegatedManagedIdentityResourceId`](#parameter-loganalyticsdefinitionroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID. |
| [`description`](#parameter-loganalyticsdefinitionroleassignmentsdescription) | string | Role assignment description. |
| [`name`](#parameter-loganalyticsdefinitionroleassignmentsname) | string | Role assignment GUID name. |
| [`principalType`](#parameter-loganalyticsdefinitionroleassignmentsprincipaltype) | string | Principal type. Allowed: Device, ForeignGroup, Group, ServicePrincipal, User. |

### Parameter: `logAnalyticsDefinition.roleAssignments.principalId`

Principal ID to assign.

- Required: Yes
- Type: string

### Parameter: `logAnalyticsDefinition.roleAssignments.roleDefinitionIdOrName`

Role definition ID, name, or GUID.

- Required: Yes
- Type: string

### Parameter: `logAnalyticsDefinition.roleAssignments.condition`

Condition for the role assignment.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.roleAssignments.conditionVersion`

Condition version. Allowed: 2.0.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `logAnalyticsDefinition.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.roleAssignments.description`

Role assignment description.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.roleAssignments.name`

Role assignment GUID name.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.roleAssignments.principalType`

Principal type. Allowed: Device, ForeignGroup, Group, ServicePrincipal, User.

- Required: No
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

### Parameter: `logAnalyticsDefinition.savedSearches`

Saved KQL searches.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-loganalyticsdefinitionsavedsearchescategory) | string | Saved search category. |
| [`displayName`](#parameter-loganalyticsdefinitionsavedsearchesdisplayname) | string | Display name for the saved search. |
| [`name`](#parameter-loganalyticsdefinitionsavedsearchesname) | string | Name of the saved search. |
| [`query`](#parameter-loganalyticsdefinitionsavedsearchesquery) | string | Query expression. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`etag`](#parameter-loganalyticsdefinitionsavedsearchesetag) | string | ETag for concurrency control. |
| [`functionAlias`](#parameter-loganalyticsdefinitionsavedsearchesfunctionalias) | string | Function alias if used as a function. |
| [`functionParameters`](#parameter-loganalyticsdefinitionsavedsearchesfunctionparameters) | string | Function parameters if query is used as a function. |
| [`tags`](#parameter-loganalyticsdefinitionsavedsearchestags) | array | Tags for the saved search. |
| [`version`](#parameter-loganalyticsdefinitionsavedsearchesversion) | int | Version of the query language. Default is 2. |

### Parameter: `logAnalyticsDefinition.savedSearches.category`

Saved search category.

- Required: Yes
- Type: string

### Parameter: `logAnalyticsDefinition.savedSearches.displayName`

Display name for the saved search.

- Required: Yes
- Type: string

### Parameter: `logAnalyticsDefinition.savedSearches.name`

Name of the saved search.

- Required: Yes
- Type: string

### Parameter: `logAnalyticsDefinition.savedSearches.query`

Query expression.

- Required: Yes
- Type: string

### Parameter: `logAnalyticsDefinition.savedSearches.etag`

ETag for concurrency control.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.savedSearches.functionAlias`

Function alias if used as a function.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.savedSearches.functionParameters`

Function parameters if query is used as a function.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.savedSearches.tags`

Tags for the saved search.

- Required: No
- Type: array

### Parameter: `logAnalyticsDefinition.savedSearches.version`

Version of the query language. Default is 2.

- Required: No
- Type: int

### Parameter: `logAnalyticsDefinition.skuCapacityReservationLevel`

Capacity reservation level in GB (100–5000 in increments of 100).

- Required: No
- Type: int

### Parameter: `logAnalyticsDefinition.skuName`

SKU name. Allowed: CapacityReservation, Free, LACluster, PerGB2018, PerNode, Premium, Standalone, Standard.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CapacityReservation'
    'Free'
    'LACluster'
    'PerGB2018'
    'PerNode'
    'Premium'
    'Standalone'
    'Standard'
  ]
  ```

### Parameter: `logAnalyticsDefinition.storageInsightsConfigs`

Storage insights configs for linked storage accounts.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`storageAccountResourceId`](#parameter-loganalyticsdefinitionstorageinsightsconfigsstorageaccountresourceid) | string | Storage account resource ID. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`containers`](#parameter-loganalyticsdefinitionstorageinsightsconfigscontainers) | array | Blob container names to read. |
| [`tables`](#parameter-loganalyticsdefinitionstorageinsightsconfigstables) | array | Tables to read. |

### Parameter: `logAnalyticsDefinition.storageInsightsConfigs.storageAccountResourceId`

Storage account resource ID.

- Required: Yes
- Type: string

### Parameter: `logAnalyticsDefinition.storageInsightsConfigs.containers`

Blob container names to read.

- Required: No
- Type: array

### Parameter: `logAnalyticsDefinition.storageInsightsConfigs.tables`

Tables to read.

- Required: No
- Type: array

### Parameter: `logAnalyticsDefinition.tables`

Custom LAW tables to be deployed.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-loganalyticsdefinitiontablesname) | string | Table name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`plan`](#parameter-loganalyticsdefinitiontablesplan) | string | Table plan. |
| [`restoredLogs`](#parameter-loganalyticsdefinitiontablesrestoredlogs) | object | Restored logs configuration. |
| [`retentionInDays`](#parameter-loganalyticsdefinitiontablesretentionindays) | int | Table retention in days. |
| [`roleAssignments`](#parameter-loganalyticsdefinitiontablesroleassignments) | array | Role assignments for the table. |
| [`schema`](#parameter-loganalyticsdefinitiontablesschema) | object | Table schema. |
| [`searchResults`](#parameter-loganalyticsdefinitiontablessearchresults) | object | Search results for the table. |
| [`totalRetentionInDays`](#parameter-loganalyticsdefinitiontablestotalretentionindays) | int | Total retention in days for the table. |

### Parameter: `logAnalyticsDefinition.tables.name`

Table name.

- Required: Yes
- Type: string

### Parameter: `logAnalyticsDefinition.tables.plan`

Table plan.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.tables.restoredLogs`

Restored logs configuration.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`endRestoreTime`](#parameter-loganalyticsdefinitiontablesrestoredlogsendrestoretime) | string | End restore time (UTC). |
| [`sourceTable`](#parameter-loganalyticsdefinitiontablesrestoredlogssourcetable) | string | Source table for restored logs. |
| [`startRestoreTime`](#parameter-loganalyticsdefinitiontablesrestoredlogsstartrestoretime) | string | Start restore time (UTC). |

### Parameter: `logAnalyticsDefinition.tables.restoredLogs.endRestoreTime`

End restore time (UTC).

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.tables.restoredLogs.sourceTable`

Source table for restored logs.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.tables.restoredLogs.startRestoreTime`

Start restore time (UTC).

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.tables.retentionInDays`

Table retention in days.

- Required: No
- Type: int

### Parameter: `logAnalyticsDefinition.tables.roleAssignments`

Role assignments for the table.

- Required: No
- Type: array

### Parameter: `logAnalyticsDefinition.tables.schema`

Table schema.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`columns`](#parameter-loganalyticsdefinitiontablesschemacolumns) | array | List of table columns. |
| [`name`](#parameter-loganalyticsdefinitiontablesschemaname) | string | Table name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`description`](#parameter-loganalyticsdefinitiontablesschemadescription) | string | Table description. |
| [`displayName`](#parameter-loganalyticsdefinitiontablesschemadisplayname) | string | Table display name. |

### Parameter: `logAnalyticsDefinition.tables.schema.columns`

List of table columns.

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-loganalyticsdefinitiontablesschemacolumnsname) | string | Column name. |
| [`type`](#parameter-loganalyticsdefinitiontablesschemacolumnstype) | string | Column type. Allowed: boolean, dateTime, dynamic, guid, int, long, real, string. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`dataTypeHint`](#parameter-loganalyticsdefinitiontablesschemacolumnsdatatypehint) | string | Logical data type hint. Allowed: armPath, guid, ip, uri. |
| [`description`](#parameter-loganalyticsdefinitiontablesschemacolumnsdescription) | string | Column description. |
| [`displayName`](#parameter-loganalyticsdefinitiontablesschemacolumnsdisplayname) | string | Column display name. |

### Parameter: `logAnalyticsDefinition.tables.schema.columns.name`

Column name.

- Required: Yes
- Type: string

### Parameter: `logAnalyticsDefinition.tables.schema.columns.type`

Column type. Allowed: boolean, dateTime, dynamic, guid, int, long, real, string.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'boolean'
    'dateTime'
    'dynamic'
    'guid'
    'int'
    'long'
    'real'
    'string'
  ]
  ```

### Parameter: `logAnalyticsDefinition.tables.schema.columns.dataTypeHint`

Logical data type hint. Allowed: armPath, guid, ip, uri.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'armPath'
    'guid'
    'ip'
    'uri'
  ]
  ```

### Parameter: `logAnalyticsDefinition.tables.schema.columns.description`

Column description.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.tables.schema.columns.displayName`

Column display name.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.tables.schema.name`

Table name.

- Required: Yes
- Type: string

### Parameter: `logAnalyticsDefinition.tables.schema.description`

Table description.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.tables.schema.displayName`

Table display name.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.tables.searchResults`

Search results for the table.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`query`](#parameter-loganalyticsdefinitiontablessearchresultsquery) | string | Query for the search job. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`description`](#parameter-loganalyticsdefinitiontablessearchresultsdescription) | string | Description of the search job. |
| [`endSearchTime`](#parameter-loganalyticsdefinitiontablessearchresultsendsearchtime) | string | End time for the search (UTC). |
| [`limit`](#parameter-loganalyticsdefinitiontablessearchresultslimit) | int | Row limit for the search job. |
| [`startSearchTime`](#parameter-loganalyticsdefinitiontablessearchresultsstartsearchtime) | string | Start time for the search (UTC). |

### Parameter: `logAnalyticsDefinition.tables.searchResults.query`

Query for the search job.

- Required: Yes
- Type: string

### Parameter: `logAnalyticsDefinition.tables.searchResults.description`

Description of the search job.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.tables.searchResults.endSearchTime`

End time for the search (UTC).

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.tables.searchResults.limit`

Row limit for the search job.

- Required: No
- Type: int

### Parameter: `logAnalyticsDefinition.tables.searchResults.startSearchTime`

Start time for the search (UTC).

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.tables.totalRetentionInDays`

Total retention in days for the table.

- Required: No
- Type: int

### Parameter: `logAnalyticsDefinition.tags`

Tags for the workspace.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-loganalyticsdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `logAnalyticsDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `privateDnsZonesDefinition`

Existing Private DNS Zone resource IDs per service. Required if you plan to reuse existing zones for any service.

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      acrZoneId: ''
      aiServicesZoneId: ''
      allowInternetResolutionFallback: false
      apimZoneId: ''
      appConfigZoneId: ''
      appInsightsZoneId: ''
      blobZoneId: ''
      cognitiveservicesZoneId: ''
      containerAppsZoneId: ''
      cosmosSqlZoneId: ''
      createNetworkLinks: true
      keyVaultZoneId: ''
      openaiZoneId: ''
      searchZoneId: ''
      tags: {}
  }
  ```

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`acrZoneId`](#parameter-privatednszonesdefinitionacrzoneid) | string | Existing Private DNS Zone resource ID for Azure Container Registry. |
| [`aiServicesZoneId`](#parameter-privatednszonesdefinitionaiserviceszoneid) | string | Existing Private DNS Zone resource ID for AI Services. |
| [`allowInternetResolutionFallback`](#parameter-privatednszonesdefinitionallowinternetresolutionfallback) | bool | Allow fallback to internet DNS resolution when Private DNS is unavailable. |
| [`apimZoneId`](#parameter-privatednszonesdefinitionapimzoneid) | string | Existing Private DNS Zone resource ID for Azure API Management. |
| [`appConfigZoneId`](#parameter-privatednszonesdefinitionappconfigzoneid) | string | Existing Private DNS Zone resource ID for App Configuration. |
| [`appInsightsZoneId`](#parameter-privatednszonesdefinitionappinsightszoneid) | string | Existing Private DNS Zone resource ID for Application Insights. |
| [`blobZoneId`](#parameter-privatednszonesdefinitionblobzoneid) | string | Existing Private DNS Zone resource ID for Blob Storage. |
| [`cognitiveservicesZoneId`](#parameter-privatednszonesdefinitioncognitiveserviceszoneid) | string | Existing Private DNS Zone resource ID for Cognitive Services. |
| [`containerAppsZoneId`](#parameter-privatednszonesdefinitioncontainerappszoneid) | string | Existing Private DNS Zone resource ID for Container Apps. |
| [`cosmosSqlZoneId`](#parameter-privatednszonesdefinitioncosmossqlzoneid) | string | Existing Private DNS Zone resource ID for Cosmos DB (SQL API). |
| [`createNetworkLinks`](#parameter-privatednszonesdefinitioncreatenetworklinks) | bool | Create VNet link to associate Spoke with the zones (can be empty). |
| [`keyVaultZoneId`](#parameter-privatednszonesdefinitionkeyvaultzoneid) | string | Existing Private DNS Zone resource ID for Key Vault. |
| [`openaiZoneId`](#parameter-privatednszonesdefinitionopenaizoneid) | string | Existing Private DNS Zone resource ID for Azure OpenAI. |
| [`searchZoneId`](#parameter-privatednszonesdefinitionsearchzoneid) | string | Existing Private DNS Zone resource ID for Azure Cognitive Search. |
| [`tags`](#parameter-privatednszonesdefinitiontags) | object | Tags to apply to the Private DNS Zones. |

### Parameter: `privateDnsZonesDefinition.acrZoneId`

Existing Private DNS Zone resource ID for Azure Container Registry.

- Required: No
- Type: string

### Parameter: `privateDnsZonesDefinition.aiServicesZoneId`

Existing Private DNS Zone resource ID for AI Services.

- Required: No
- Type: string

### Parameter: `privateDnsZonesDefinition.allowInternetResolutionFallback`

Allow fallback to internet DNS resolution when Private DNS is unavailable.

- Required: No
- Type: bool

### Parameter: `privateDnsZonesDefinition.apimZoneId`

Existing Private DNS Zone resource ID for Azure API Management.

- Required: No
- Type: string

### Parameter: `privateDnsZonesDefinition.appConfigZoneId`

Existing Private DNS Zone resource ID for App Configuration.

- Required: No
- Type: string

### Parameter: `privateDnsZonesDefinition.appInsightsZoneId`

Existing Private DNS Zone resource ID for Application Insights.

- Required: No
- Type: string

### Parameter: `privateDnsZonesDefinition.blobZoneId`

Existing Private DNS Zone resource ID for Blob Storage.

- Required: No
- Type: string

### Parameter: `privateDnsZonesDefinition.cognitiveservicesZoneId`

Existing Private DNS Zone resource ID for Cognitive Services.

- Required: No
- Type: string

### Parameter: `privateDnsZonesDefinition.containerAppsZoneId`

Existing Private DNS Zone resource ID for Container Apps.

- Required: No
- Type: string

### Parameter: `privateDnsZonesDefinition.cosmosSqlZoneId`

Existing Private DNS Zone resource ID for Cosmos DB (SQL API).

- Required: No
- Type: string

### Parameter: `privateDnsZonesDefinition.createNetworkLinks`

Create VNet link to associate Spoke with the zones (can be empty).

- Required: No
- Type: bool

### Parameter: `privateDnsZonesDefinition.keyVaultZoneId`

Existing Private DNS Zone resource ID for Key Vault.

- Required: No
- Type: string

### Parameter: `privateDnsZonesDefinition.openaiZoneId`

Existing Private DNS Zone resource ID for Azure OpenAI.

- Required: No
- Type: string

### Parameter: `privateDnsZonesDefinition.searchZoneId`

Existing Private DNS Zone resource ID for Azure Cognitive Search.

- Required: No
- Type: string

### Parameter: `privateDnsZonesDefinition.tags`

Tags to apply to the Private DNS Zones.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-privatednszonesdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `privateDnsZonesDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `searchDefinition`

Azure AI Search configuration for the GenAI app. Required if deployGenAiAppBackingServices is true, deployToggles.searchService is true, and resourceIds.searchServiceResourceId is empty.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-searchdefinitionname) | string | The name of the Azure Cognitive Search service to create or update. Must only contain lowercase letters, digits or dashes, cannot use dash as the first two or last one characters, cannot contain consecutive dashes, must be between 2 and 60 characters in length, and must be globally unique. Immutable after creation. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`authOptions`](#parameter-searchdefinitionauthoptions) | object | Defines the options for how the data plane API of a Search service authenticates requests. Must remain {} if disableLocalAuth=true. |
| [`cmkEnforcement`](#parameter-searchdefinitioncmkenforcement) | string | Policy that determines how resources within the search service are encrypted with Customer Managed Keys. Default is Unspecified. Allowed values: Disabled, Enabled, Unspecified. |
| [`diagnosticSettings`](#parameter-searchdefinitiondiagnosticsettings) | array | Diagnostic settings for the search service. |
| [`disableLocalAuth`](#parameter-searchdefinitiondisablelocalauth) | bool | Disable local authentication via API keys. Cannot be true if authOptions are defined. Default is true. |
| [`enableTelemetry`](#parameter-searchdefinitionenabletelemetry) | bool | Enable/disable usage telemetry for the module. Default is true. |
| [`hostingMode`](#parameter-searchdefinitionhostingmode) | string | Hosting mode, only for standard3 SKU. Allowed values: default, highDensity. Default is default. |
| [`location`](#parameter-searchdefinitionlocation) | string | Location for all resources. Default is resourceGroup().location. |
| [`lock`](#parameter-searchdefinitionlock) | object | Lock settings for the search service. |
| [`managedIdentities`](#parameter-searchdefinitionmanagedidentities) | object | Managed identity definition for the search service. |
| [`networkRuleSet`](#parameter-searchdefinitionnetworkruleset) | object | Network rules for the search service. |
| [`partitionCount`](#parameter-searchdefinitionpartitioncount) | int | Number of partitions in the search service. Valid values: 1,2,3,4,6,12 (or 1–3 for standard3 highDensity). Default is 1. |
| [`privateEndpoints`](#parameter-searchdefinitionprivateendpoints) | array | Configuration details for private endpoints. |
| [`publicNetworkAccess`](#parameter-searchdefinitionpublicnetworkaccess) | string | Public network access. Default is Enabled. Allowed values: Enabled, Disabled. |
| [`replicaCount`](#parameter-searchdefinitionreplicacount) | int | Number of replicas in the search service. Must be 1–12 for Standard SKUs or 1–3 for Basic. Default is 3. |
| [`roleAssignments`](#parameter-searchdefinitionroleassignments) | array | Role assignments for the search service. |
| [`secretsExportConfiguration`](#parameter-searchdefinitionsecretsexportconfiguration) | object | Key Vault reference and secret settings for exporting admin keys. |
| [`semanticSearch`](#parameter-searchdefinitionsemanticsearch) | string | Semantic search configuration. Allowed values: disabled, free, standard. |
| [`sharedPrivateLinkResources`](#parameter-searchdefinitionsharedprivatelinkresources) | array | Shared Private Link Resources to create. Default is []. |
| [`sku`](#parameter-searchdefinitionsku) | string | SKU of the search service. Determines price tier and limits. Default is standard. Allowed values: basic, free, standard, standard2, standard3, storage_optimized_l1, storage_optimized_l2. |
| [`tags`](#parameter-searchdefinitiontags) | object | Tags for categorizing the search service. |

### Parameter: `searchDefinition.name`

The name of the Azure Cognitive Search service to create or update. Must only contain lowercase letters, digits or dashes, cannot use dash as the first two or last one characters, cannot contain consecutive dashes, must be between 2 and 60 characters in length, and must be globally unique. Immutable after creation.

- Required: Yes
- Type: string

### Parameter: `searchDefinition.authOptions`

Defines the options for how the data plane API of a Search service authenticates requests. Must remain {} if disableLocalAuth=true.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`aadOrApiKey`](#parameter-searchdefinitionauthoptionsaadorapikey) | object | Indicates that either API key or an access token from Microsoft Entra ID can be used for authentication. |
| [`apiKeyOnly`](#parameter-searchdefinitionauthoptionsapikeyonly) | object | Indicates that only the API key can be used for authentication. |

### Parameter: `searchDefinition.authOptions.aadOrApiKey`

Indicates that either API key or an access token from Microsoft Entra ID can be used for authentication.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`aadAuthFailureMode`](#parameter-searchdefinitionauthoptionsaadorapikeyaadauthfailuremode) | string | Response sent when authentication fails. Allowed values: http401WithBearerChallenge, http403. |

### Parameter: `searchDefinition.authOptions.aadOrApiKey.aadAuthFailureMode`

Response sent when authentication fails. Allowed values: http401WithBearerChallenge, http403.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'http401WithBearerChallenge'
    'http403'
  ]
  ```

### Parameter: `searchDefinition.authOptions.apiKeyOnly`

Indicates that only the API key can be used for authentication.

- Required: No
- Type: object

### Parameter: `searchDefinition.cmkEnforcement`

Policy that determines how resources within the search service are encrypted with Customer Managed Keys. Default is Unspecified. Allowed values: Disabled, Enabled, Unspecified.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Disabled'
    'Enabled'
    'Unspecified'
  ]
  ```

### Parameter: `searchDefinition.diagnosticSettings`

Diagnostic settings for the search service.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`eventHubAuthorizationRuleResourceId`](#parameter-searchdefinitiondiagnosticsettingseventhubauthorizationruleresourceid) | string | Resource ID of the diagnostic Event Hub authorization rule. |
| [`eventHubName`](#parameter-searchdefinitiondiagnosticsettingseventhubname) | string | Name of the diagnostic Event Hub. Without this, one Event Hub per category will be created. |
| [`logAnalyticsDestinationType`](#parameter-searchdefinitiondiagnosticsettingsloganalyticsdestinationtype) | string | Destination type for Log Analytics. Allowed values: AzureDiagnostics, Dedicated. |
| [`logCategoriesAndGroups`](#parameter-searchdefinitiondiagnosticsettingslogcategoriesandgroups) | array | Log categories and groups to collect. Use [] to disable. |
| [`marketplacePartnerResourceId`](#parameter-searchdefinitiondiagnosticsettingsmarketplacepartnerresourceid) | string | Marketplace partner resource ID to send logs to. |
| [`metricCategories`](#parameter-searchdefinitiondiagnosticsettingsmetriccategories) | array | Metric categories to collect. |
| [`name`](#parameter-searchdefinitiondiagnosticsettingsname) | string | Name of the diagnostic setting. |
| [`storageAccountResourceId`](#parameter-searchdefinitiondiagnosticsettingsstorageaccountresourceid) | string | Storage account resource ID for diagnostic logs. |
| [`workspaceResourceId`](#parameter-searchdefinitiondiagnosticsettingsworkspaceresourceid) | string | Log Analytics workspace resource ID for diagnostic logs. |

### Parameter: `searchDefinition.diagnosticSettings.eventHubAuthorizationRuleResourceId`

Resource ID of the diagnostic Event Hub authorization rule.

- Required: No
- Type: string

### Parameter: `searchDefinition.diagnosticSettings.eventHubName`

Name of the diagnostic Event Hub. Without this, one Event Hub per category will be created.

- Required: No
- Type: string

### Parameter: `searchDefinition.diagnosticSettings.logAnalyticsDestinationType`

Destination type for Log Analytics. Allowed values: AzureDiagnostics, Dedicated.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'AzureDiagnostics'
    'Dedicated'
  ]
  ```

### Parameter: `searchDefinition.diagnosticSettings.logCategoriesAndGroups`

Log categories and groups to collect. Use [] to disable.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-searchdefinitiondiagnosticsettingslogcategoriesandgroupscategory) | string | Diagnostic log category. |
| [`categoryGroup`](#parameter-searchdefinitiondiagnosticsettingslogcategoriesandgroupscategorygroup) | string | Diagnostic log category group. Use allLogs to collect all logs. |
| [`enabled`](#parameter-searchdefinitiondiagnosticsettingslogcategoriesandgroupsenabled) | bool | Enable or disable this log category. Default is true. |

### Parameter: `searchDefinition.diagnosticSettings.logCategoriesAndGroups.category`

Diagnostic log category.

- Required: No
- Type: string

### Parameter: `searchDefinition.diagnosticSettings.logCategoriesAndGroups.categoryGroup`

Diagnostic log category group. Use allLogs to collect all logs.

- Required: No
- Type: string

### Parameter: `searchDefinition.diagnosticSettings.logCategoriesAndGroups.enabled`

Enable or disable this log category. Default is true.

- Required: No
- Type: bool

### Parameter: `searchDefinition.diagnosticSettings.marketplacePartnerResourceId`

Marketplace partner resource ID to send logs to.

- Required: No
- Type: string

### Parameter: `searchDefinition.diagnosticSettings.metricCategories`

Metric categories to collect.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-searchdefinitiondiagnosticsettingsmetriccategoriescategory) | string | Diagnostic metric category. Example: AllMetrics. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enabled`](#parameter-searchdefinitiondiagnosticsettingsmetriccategoriesenabled) | bool | Enable or disable this metric category. Default is true. |

### Parameter: `searchDefinition.diagnosticSettings.metricCategories.category`

Diagnostic metric category. Example: AllMetrics.

- Required: Yes
- Type: string

### Parameter: `searchDefinition.diagnosticSettings.metricCategories.enabled`

Enable or disable this metric category. Default is true.

- Required: No
- Type: bool

### Parameter: `searchDefinition.diagnosticSettings.name`

Name of the diagnostic setting.

- Required: No
- Type: string

### Parameter: `searchDefinition.diagnosticSettings.storageAccountResourceId`

Storage account resource ID for diagnostic logs.

- Required: No
- Type: string

### Parameter: `searchDefinition.diagnosticSettings.workspaceResourceId`

Log Analytics workspace resource ID for diagnostic logs.

- Required: No
- Type: string

### Parameter: `searchDefinition.disableLocalAuth`

Disable local authentication via API keys. Cannot be true if authOptions are defined. Default is true.

- Required: No
- Type: bool

### Parameter: `searchDefinition.enableTelemetry`

Enable/disable usage telemetry for the module. Default is true.

- Required: No
- Type: bool

### Parameter: `searchDefinition.hostingMode`

Hosting mode, only for standard3 SKU. Allowed values: default, highDensity. Default is default.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'default'
    'highDensity'
  ]
  ```

### Parameter: `searchDefinition.location`

Location for all resources. Default is resourceGroup().location.

- Required: No
- Type: string

### Parameter: `searchDefinition.lock`

Lock settings for the search service.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-searchdefinitionlockkind) | string | Type of lock. Allowed values: CanNotDelete, None, ReadOnly. |
| [`name`](#parameter-searchdefinitionlockname) | string | Name of the lock. |
| [`notes`](#parameter-searchdefinitionlocknotes) | string | Notes for the lock. |

### Parameter: `searchDefinition.lock.kind`

Type of lock. Allowed values: CanNotDelete, None, ReadOnly.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `searchDefinition.lock.name`

Name of the lock.

- Required: No
- Type: string

### Parameter: `searchDefinition.lock.notes`

Notes for the lock.

- Required: No
- Type: string

### Parameter: `searchDefinition.managedIdentities`

Managed identity definition for the search service.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`systemAssigned`](#parameter-searchdefinitionmanagedidentitiessystemassigned) | bool | Enables system-assigned managed identity. |
| [`userAssignedResourceIds`](#parameter-searchdefinitionmanagedidentitiesuserassignedresourceids) | array | User-assigned identity resource IDs. Required if user-assigned identity is used for encryption. |

### Parameter: `searchDefinition.managedIdentities.systemAssigned`

Enables system-assigned managed identity.

- Required: No
- Type: bool

### Parameter: `searchDefinition.managedIdentities.userAssignedResourceIds`

User-assigned identity resource IDs. Required if user-assigned identity is used for encryption.

- Required: No
- Type: array

### Parameter: `searchDefinition.networkRuleSet`

Network rules for the search service.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`bypass`](#parameter-searchdefinitionnetworkrulesetbypass) | string | Bypass setting. Allowed values: AzurePortal, AzureServices, None. |
| [`ipRules`](#parameter-searchdefinitionnetworkrulesetiprules) | array | IP restriction rules applied when publicNetworkAccess=Enabled. |

### Parameter: `searchDefinition.networkRuleSet.bypass`

Bypass setting. Allowed values: AzurePortal, AzureServices, None.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'AzurePortal'
    'AzureServices'
    'None'
  ]
  ```

### Parameter: `searchDefinition.networkRuleSet.ipRules`

IP restriction rules applied when publicNetworkAccess=Enabled.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`value`](#parameter-searchdefinitionnetworkrulesetiprulesvalue) | string | IPv4 address (e.g., 123.1.2.3) or range in CIDR format (e.g., 123.1.2.3/24) to allow. |

### Parameter: `searchDefinition.networkRuleSet.ipRules.value`

IPv4 address (e.g., 123.1.2.3) or range in CIDR format (e.g., 123.1.2.3/24) to allow.

- Required: Yes
- Type: string

### Parameter: `searchDefinition.partitionCount`

Number of partitions in the search service. Valid values: 1,2,3,4,6,12 (or 1–3 for standard3 highDensity). Default is 1.

- Required: No
- Type: int

### Parameter: `searchDefinition.privateEndpoints`

Configuration details for private endpoints.

- Required: No
- Type: array

### Parameter: `searchDefinition.publicNetworkAccess`

Public network access. Default is Enabled. Allowed values: Enabled, Disabled.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Disabled'
    'Enabled'
  ]
  ```

### Parameter: `searchDefinition.replicaCount`

Number of replicas in the search service. Must be 1–12 for Standard SKUs or 1–3 for Basic. Default is 3.

- Required: No
- Type: int

### Parameter: `searchDefinition.roleAssignments`

Role assignments for the search service.

- Required: No
- Type: array

### Parameter: `searchDefinition.secretsExportConfiguration`

Key Vault reference and secret settings for exporting admin keys.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`keyVaultResourceId`](#parameter-searchdefinitionsecretsexportconfigurationkeyvaultresourceid) | string | Key Vault resource ID where the API Admin keys will be stored. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`primaryAdminKeyName`](#parameter-searchdefinitionsecretsexportconfigurationprimaryadminkeyname) | string | Secret name for the primary admin key. |
| [`secondaryAdminKeyName`](#parameter-searchdefinitionsecretsexportconfigurationsecondaryadminkeyname) | string | Secret name for the secondary admin key. |

### Parameter: `searchDefinition.secretsExportConfiguration.keyVaultResourceId`

Key Vault resource ID where the API Admin keys will be stored.

- Required: Yes
- Type: string

### Parameter: `searchDefinition.secretsExportConfiguration.primaryAdminKeyName`

Secret name for the primary admin key.

- Required: No
- Type: string

### Parameter: `searchDefinition.secretsExportConfiguration.secondaryAdminKeyName`

Secret name for the secondary admin key.

- Required: No
- Type: string

### Parameter: `searchDefinition.semanticSearch`

Semantic search configuration. Allowed values: disabled, free, standard.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'disabled'
    'free'
    'standard'
  ]
  ```

### Parameter: `searchDefinition.sharedPrivateLinkResources`

Shared Private Link Resources to create. Default is [].

- Required: No
- Type: array

### Parameter: `searchDefinition.sku`

SKU of the search service. Determines price tier and limits. Default is standard. Allowed values: basic, free, standard, standard2, standard3, storage_optimized_l1, storage_optimized_l2.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'basic'
    'free'
    'standard'
    'standard2'
    'standard3'
    'storage_optimized_l1'
    'storage_optimized_l2'
  ]
  ```

### Parameter: `searchDefinition.tags`

Tags for categorizing the search service.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-searchdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `searchDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `storageAccountDefinition`

Storage Account configuration for the GenAI app. Required if deployGenAiAppBackingServices is true, deployToggles.storageAccount is true, and resourceIds.storageAccountResourceId is empty.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-storageaccountdefinitionname) | string | Name of the Storage Account. Must be lower-case. |

**Conditional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`accessTier`](#parameter-storageaccountdefinitionaccesstier) | string | The access tier for billing. Required if kind is set to BlobStorage. Allowed values: Cold, Cool, Hot, Premium. |
| [`enableHierarchicalNamespace`](#parameter-storageaccountdefinitionenablehierarchicalnamespace) | bool | Enables Hierarchical Namespace for the storage account. Required if enableSftp or enableNfsV3 is true. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`allowBlobPublicAccess`](#parameter-storageaccountdefinitionallowblobpublicaccess) | bool | Indicates whether public access is enabled for all blobs or containers. Recommended to be set to false. |
| [`allowCrossTenantReplication`](#parameter-storageaccountdefinitionallowcrosstenantreplication) | bool | Allow or disallow cross AAD tenant object replication. |
| [`allowedCopyScope`](#parameter-storageaccountdefinitionallowedcopyscope) | string | Restrict copy scope. Allowed values: AAD, PrivateLink. |
| [`allowSharedKeyAccess`](#parameter-storageaccountdefinitionallowsharedkeyaccess) | bool | Indicates whether Shared Key authorization is allowed. Default is true. |
| [`azureFilesIdentityBasedAuthentication`](#parameter-storageaccountdefinitionazurefilesidentitybasedauthentication) | object | Provides the identity-based authentication settings for Azure Files. |
| [`blobServices`](#parameter-storageaccountdefinitionblobservices) | object | Blob service and containers configuration. |
| [`customDomainName`](#parameter-storageaccountdefinitioncustomdomainname) | string | Sets the custom domain name (CNAME source) for the storage account. |
| [`customDomainUseSubDomainName`](#parameter-storageaccountdefinitioncustomdomainusesubdomainname) | bool | Indicates whether indirect CName validation is enabled (updates only). |
| [`customerManagedKey`](#parameter-storageaccountdefinitioncustomermanagedkey) | object | Customer managed key definition. |
| [`defaultToOAuthAuthentication`](#parameter-storageaccountdefinitiondefaulttooauthauthentication) | bool | When true, OAuth is the default authentication method. |
| [`diagnosticSettings`](#parameter-storageaccountdefinitiondiagnosticsettings) | array | Diagnostic settings for the service. |
| [`dnsEndpointType`](#parameter-storageaccountdefinitiondnsendpointtype) | string | Endpoint type. Allowed values: AzureDnsZone, Standard. |
| [`enableNfsV3`](#parameter-storageaccountdefinitionenablenfsv3) | bool | Enables NFS 3.0 support. Requires hierarchical namespace enabled. |
| [`enableSftp`](#parameter-storageaccountdefinitionenablesftp) | bool | Enables Secure File Transfer Protocol (SFTP). Requires hierarchical namespace enabled. |
| [`enableTelemetry`](#parameter-storageaccountdefinitionenabletelemetry) | bool | Enable/disable telemetry for the module. |
| [`fileServices`](#parameter-storageaccountdefinitionfileservices) | object | File service and share configuration. |
| [`isLocalUserEnabled`](#parameter-storageaccountdefinitionislocaluserenabled) | bool | Enables local users feature for SFTP authentication. |
| [`keyType`](#parameter-storageaccountdefinitionkeytype) | string | Key type for Queue & Table services. Allowed values: Account, Service. |
| [`kind`](#parameter-storageaccountdefinitionkind) | string | Storage account type. Allowed values: BlobStorage, BlockBlobStorage, FileStorage, Storage, StorageV2. |
| [`largeFileSharesState`](#parameter-storageaccountdefinitionlargefilesharesstate) | string | Large file shares state. Allowed values: Disabled, Enabled. |
| [`localUsers`](#parameter-storageaccountdefinitionlocalusers) | array | Local users for SFTP authentication. |
| [`location`](#parameter-storageaccountdefinitionlocation) | string | Resource location. |
| [`lock`](#parameter-storageaccountdefinitionlock) | object | Lock settings for the resource. |
| [`managedIdentities`](#parameter-storageaccountdefinitionmanagedidentities) | object | Managed identity configuration. |
| [`managementPolicyRules`](#parameter-storageaccountdefinitionmanagementpolicyrules) | array | Storage account management policy rules. |
| [`minimumTlsVersion`](#parameter-storageaccountdefinitionminimumtlsversion) | string | Minimum TLS version for requests. Allowed value: TLS1_2. |
| [`networkAcls`](#parameter-storageaccountdefinitionnetworkacls) | object | Network ACL rules and settings. |
| [`privateEndpoints`](#parameter-storageaccountdefinitionprivateendpoints) | array | Private endpoint configurations. |
| [`publicNetworkAccess`](#parameter-storageaccountdefinitionpublicnetworkaccess) | string | Whether public network access is allowed. Allowed values: Disabled, Enabled. |
| [`queueServices`](#parameter-storageaccountdefinitionqueueservices) | object | Queue service configuration. |
| [`requireInfrastructureEncryption`](#parameter-storageaccountdefinitionrequireinfrastructureencryption) | bool | Indicates whether infrastructure encryption with PMK is applied. |
| [`roleAssignments`](#parameter-storageaccountdefinitionroleassignments) | array | Role assignments for the storage account. |
| [`sasExpirationAction`](#parameter-storageaccountdefinitionsasexpirationaction) | string | SAS expiration action. Allowed values: Block, Log. |
| [`sasExpirationPeriod`](#parameter-storageaccountdefinitionsasexpirationperiod) | string | SAS expiration period in DD.HH:MM:SS format. |
| [`secretsExportConfiguration`](#parameter-storageaccountdefinitionsecretsexportconfiguration) | object | Configuration for exporting secrets to Key Vault. |
| [`skuName`](#parameter-storageaccountdefinitionskuname) | string | SKU name for the storage account. Allowed values: Premium_LRS, Premium_ZRS, PremiumV2_LRS, PremiumV2_ZRS, Standard_GRS, Standard_GZRS, Standard_LRS, Standard_RAGRS, Standard_RAGZRS, Standard_ZRS, StandardV2_GRS, StandardV2_GZRS, StandardV2_LRS, StandardV2_ZRS. |
| [`supportsHttpsTrafficOnly`](#parameter-storageaccountdefinitionsupportshttpstrafficonly) | bool | When true, allows only HTTPS traffic to the storage service. |
| [`tableServices`](#parameter-storageaccountdefinitiontableservices) | object | Table service and tables configuration. |
| [`tags`](#parameter-storageaccountdefinitiontags) | object | Tags for the resource. |

### Parameter: `storageAccountDefinition.name`

Name of the Storage Account. Must be lower-case.

- Required: Yes
- Type: string

### Parameter: `storageAccountDefinition.accessTier`

The access tier for billing. Required if kind is set to BlobStorage. Allowed values: Cold, Cool, Hot, Premium.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Cold'
    'Cool'
    'Hot'
    'Premium'
  ]
  ```

### Parameter: `storageAccountDefinition.enableHierarchicalNamespace`

Enables Hierarchical Namespace for the storage account. Required if enableSftp or enableNfsV3 is true.

- Required: No
- Type: bool

### Parameter: `storageAccountDefinition.allowBlobPublicAccess`

Indicates whether public access is enabled for all blobs or containers. Recommended to be set to false.

- Required: No
- Type: bool

### Parameter: `storageAccountDefinition.allowCrossTenantReplication`

Allow or disallow cross AAD tenant object replication.

- Required: No
- Type: bool

### Parameter: `storageAccountDefinition.allowedCopyScope`

Restrict copy scope. Allowed values: AAD, PrivateLink.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'AAD'
    'PrivateLink'
  ]
  ```

### Parameter: `storageAccountDefinition.allowSharedKeyAccess`

Indicates whether Shared Key authorization is allowed. Default is true.

- Required: No
- Type: bool

### Parameter: `storageAccountDefinition.azureFilesIdentityBasedAuthentication`

Provides the identity-based authentication settings for Azure Files.

- Required: No
- Type: object

### Parameter: `storageAccountDefinition.blobServices`

Blob service and containers configuration.

- Required: No
- Type: object

### Parameter: `storageAccountDefinition.customDomainName`

Sets the custom domain name (CNAME source) for the storage account.

- Required: No
- Type: string

### Parameter: `storageAccountDefinition.customDomainUseSubDomainName`

Indicates whether indirect CName validation is enabled (updates only).

- Required: No
- Type: bool

### Parameter: `storageAccountDefinition.customerManagedKey`

Customer managed key definition.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`keyName`](#parameter-storageaccountdefinitioncustomermanagedkeykeyname) | string | The name of the customer managed key. |
| [`keyVaultResourceId`](#parameter-storageaccountdefinitioncustomermanagedkeykeyvaultresourceid) | string | The Key Vault resource ID where the key is stored. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`autoRotationEnabled`](#parameter-storageaccountdefinitioncustomermanagedkeyautorotationenabled) | bool | Enable or disable key auto-rotation. Default is true. |
| [`keyVersion`](#parameter-storageaccountdefinitioncustomermanagedkeykeyversion) | string | The version of the customer managed key to reference. |
| [`userAssignedIdentityResourceId`](#parameter-storageaccountdefinitioncustomermanagedkeyuserassignedidentityresourceid) | string | User-assigned identity resource ID to fetch the key (if no system-assigned identity is available). |

### Parameter: `storageAccountDefinition.customerManagedKey.keyName`

The name of the customer managed key.

- Required: Yes
- Type: string

### Parameter: `storageAccountDefinition.customerManagedKey.keyVaultResourceId`

The Key Vault resource ID where the key is stored.

- Required: Yes
- Type: string

### Parameter: `storageAccountDefinition.customerManagedKey.autoRotationEnabled`

Enable or disable key auto-rotation. Default is true.

- Required: No
- Type: bool

### Parameter: `storageAccountDefinition.customerManagedKey.keyVersion`

The version of the customer managed key to reference.

- Required: No
- Type: string

### Parameter: `storageAccountDefinition.customerManagedKey.userAssignedIdentityResourceId`

User-assigned identity resource ID to fetch the key (if no system-assigned identity is available).

- Required: No
- Type: string

### Parameter: `storageAccountDefinition.defaultToOAuthAuthentication`

When true, OAuth is the default authentication method.

- Required: No
- Type: bool

### Parameter: `storageAccountDefinition.diagnosticSettings`

Diagnostic settings for the service.

- Required: No
- Type: array

### Parameter: `storageAccountDefinition.dnsEndpointType`

Endpoint type. Allowed values: AzureDnsZone, Standard.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'AzureDnsZone'
    'Standard'
  ]
  ```

### Parameter: `storageAccountDefinition.enableNfsV3`

Enables NFS 3.0 support. Requires hierarchical namespace enabled.

- Required: No
- Type: bool

### Parameter: `storageAccountDefinition.enableSftp`

Enables Secure File Transfer Protocol (SFTP). Requires hierarchical namespace enabled.

- Required: No
- Type: bool

### Parameter: `storageAccountDefinition.enableTelemetry`

Enable/disable telemetry for the module.

- Required: No
- Type: bool

### Parameter: `storageAccountDefinition.fileServices`

File service and share configuration.

- Required: No
- Type: object

### Parameter: `storageAccountDefinition.isLocalUserEnabled`

Enables local users feature for SFTP authentication.

- Required: No
- Type: bool

### Parameter: `storageAccountDefinition.keyType`

Key type for Queue & Table services. Allowed values: Account, Service.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Account'
    'Service'
  ]
  ```

### Parameter: `storageAccountDefinition.kind`

Storage account type. Allowed values: BlobStorage, BlockBlobStorage, FileStorage, Storage, StorageV2.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'BlobStorage'
    'BlockBlobStorage'
    'FileStorage'
    'Storage'
    'StorageV2'
  ]
  ```

### Parameter: `storageAccountDefinition.largeFileSharesState`

Large file shares state. Allowed values: Disabled, Enabled.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Disabled'
    'Enabled'
  ]
  ```

### Parameter: `storageAccountDefinition.localUsers`

Local users for SFTP authentication.

- Required: No
- Type: array

### Parameter: `storageAccountDefinition.location`

Resource location.

- Required: No
- Type: string

### Parameter: `storageAccountDefinition.lock`

Lock settings for the resource.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-storageaccountdefinitionlockkind) | string | Lock type. Allowed values: CanNotDelete, None, ReadOnly. |
| [`name`](#parameter-storageaccountdefinitionlockname) | string | Lock name. |
| [`notes`](#parameter-storageaccountdefinitionlocknotes) | string | Lock notes. |

### Parameter: `storageAccountDefinition.lock.kind`

Lock type. Allowed values: CanNotDelete, None, ReadOnly.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `storageAccountDefinition.lock.name`

Lock name.

- Required: No
- Type: string

### Parameter: `storageAccountDefinition.lock.notes`

Lock notes.

- Required: No
- Type: string

### Parameter: `storageAccountDefinition.managedIdentities`

Managed identity configuration.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`systemAssigned`](#parameter-storageaccountdefinitionmanagedidentitiessystemassigned) | bool | Enables system-assigned identity. |
| [`userAssignedResourceIds`](#parameter-storageaccountdefinitionmanagedidentitiesuserassignedresourceids) | array | List of user-assigned identity resource IDs. |

### Parameter: `storageAccountDefinition.managedIdentities.systemAssigned`

Enables system-assigned identity.

- Required: No
- Type: bool

### Parameter: `storageAccountDefinition.managedIdentities.userAssignedResourceIds`

List of user-assigned identity resource IDs.

- Required: No
- Type: array

### Parameter: `storageAccountDefinition.managementPolicyRules`

Storage account management policy rules.

- Required: No
- Type: array

### Parameter: `storageAccountDefinition.minimumTlsVersion`

Minimum TLS version for requests. Allowed value: TLS1_2.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'TLS1_2'
  ]
  ```

### Parameter: `storageAccountDefinition.networkAcls`

Network ACL rules and settings.

- Required: No
- Type: object

### Parameter: `storageAccountDefinition.privateEndpoints`

Private endpoint configurations.

- Required: No
- Type: array

### Parameter: `storageAccountDefinition.publicNetworkAccess`

Whether public network access is allowed. Allowed values: Disabled, Enabled.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Disabled'
    'Enabled'
  ]
  ```

### Parameter: `storageAccountDefinition.queueServices`

Queue service configuration.

- Required: No
- Type: object

### Parameter: `storageAccountDefinition.requireInfrastructureEncryption`

Indicates whether infrastructure encryption with PMK is applied.

- Required: No
- Type: bool

### Parameter: `storageAccountDefinition.roleAssignments`

Role assignments for the storage account.

- Required: No
- Type: array

### Parameter: `storageAccountDefinition.sasExpirationAction`

SAS expiration action. Allowed values: Block, Log.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Block'
    'Log'
  ]
  ```

### Parameter: `storageAccountDefinition.sasExpirationPeriod`

SAS expiration period in DD.HH:MM:SS format.

- Required: No
- Type: string

### Parameter: `storageAccountDefinition.secretsExportConfiguration`

Configuration for exporting secrets to Key Vault.

- Required: No
- Type: object

### Parameter: `storageAccountDefinition.skuName`

SKU name for the storage account. Allowed values: Premium_LRS, Premium_ZRS, PremiumV2_LRS, PremiumV2_ZRS, Standard_GRS, Standard_GZRS, Standard_LRS, Standard_RAGRS, Standard_RAGZRS, Standard_ZRS, StandardV2_GRS, StandardV2_GZRS, StandardV2_LRS, StandardV2_ZRS.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Premium_LRS'
    'Premium_ZRS'
    'PremiumV2_LRS'
    'PremiumV2_ZRS'
    'Standard_GRS'
    'Standard_GZRS'
    'Standard_LRS'
    'Standard_RAGRS'
    'Standard_RAGZRS'
    'Standard_ZRS'
    'StandardV2_GRS'
    'StandardV2_GZRS'
    'StandardV2_LRS'
    'StandardV2_ZRS'
  ]
  ```

### Parameter: `storageAccountDefinition.supportsHttpsTrafficOnly`

When true, allows only HTTPS traffic to the storage service.

- Required: No
- Type: bool

### Parameter: `storageAccountDefinition.tableServices`

Table service and tables configuration.

- Required: No
- Type: object

### Parameter: `storageAccountDefinition.tags`

Tags for the resource.

- Required: No
- Type: object

### Parameter: `subnetsNamesDefinition`

Subnet names configuration. Required if you want to use names different than the defaults names for the subnets.

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      acaEnvironment: ''
      agent: ''
      apiManagement: ''
      applicationGateway: ''
      devopsBuildAgents: ''
      jumpbox: ''
      pe: ''
  }
  ```

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`acaEnvironment`](#parameter-subnetsnamesdefinitionacaenvironment) | string | Subnet name for Container Apps environment. Default: aca-environment-subnet. |
| [`agent`](#parameter-subnetsnamesdefinitionagent) | string | Subnet name for agent workloads. Default: agent-subnet. |
| [`apiManagement`](#parameter-subnetsnamesdefinitionapimanagement) | string | Subnet name for API Management. Default: api-management-subnet. |
| [`applicationGateway`](#parameter-subnetsnamesdefinitionapplicationgateway) | string | Subnet name for Application Gateway. Default: app-gateway-subnet. |
| [`devopsBuildAgents`](#parameter-subnetsnamesdefinitiondevopsbuildagents) | string | Subnet name for DevOps build agents. Default: devops-build-agents-subnet. |
| [`jumpbox`](#parameter-subnetsnamesdefinitionjumpbox) | string | Subnet name for jumpbox VMs. Default: jumpbox-subnet. |
| [`pe`](#parameter-subnetsnamesdefinitionpe) | string | Subnet name for private endpoints. Default: pe-subnet. |

### Parameter: `subnetsNamesDefinition.acaEnvironment`

Subnet name for Container Apps environment. Default: aca-environment-subnet.

- Required: No
- Type: string

### Parameter: `subnetsNamesDefinition.agent`

Subnet name for agent workloads. Default: agent-subnet.

- Required: No
- Type: string

### Parameter: `subnetsNamesDefinition.apiManagement`

Subnet name for API Management. Default: api-management-subnet.

- Required: No
- Type: string

### Parameter: `subnetsNamesDefinition.applicationGateway`

Subnet name for Application Gateway. Default: app-gateway-subnet.

- Required: No
- Type: string

### Parameter: `subnetsNamesDefinition.devopsBuildAgents`

Subnet name for DevOps build agents. Default: devops-build-agents-subnet.

- Required: No
- Type: string

### Parameter: `subnetsNamesDefinition.jumpbox`

Subnet name for jumpbox VMs. Default: jumpbox-subnet.

- Required: No
- Type: string

### Parameter: `subnetsNamesDefinition.pe`

Subnet name for private endpoints. Default: pe-subnet.

- Required: No
- Type: string

### Parameter: `vNetDefinition`

Virtual Network configuration. Required if deployToggles.virtualNetwork is true and resourceIds.virtualNetworkResourceId is empty.

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      addressPrefixes: [
        '192.168.0.0/23'
      ]
      name: ''
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`addressPrefixes`](#parameter-vnetdefinitionaddressprefixes) | array | An array of one or more IP address prefixes OR the resource ID of the IPAM pool to be used for the Virtual Network. Required if using IPAM pool resource ID, you must also set ipamPoolNumberOfIpAddresses. |
| [`name`](#parameter-vnetdefinitionname) | string | The name of the Virtual Network (vNet). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`ddosProtectionPlanResourceId`](#parameter-vnetdefinitionddosprotectionplanresourceid) | string | Resource ID of the DDoS protection plan to assign the VNet to. If blank, DDoS protection is not configured. |
| [`diagnosticSettings`](#parameter-vnetdefinitiondiagnosticsettings) | array | The diagnostic settings of the Virtual Network. |
| [`dnsServers`](#parameter-vnetdefinitiondnsservers) | array | DNS servers associated with the Virtual Network. |
| [`enableTelemetry`](#parameter-vnetdefinitionenabletelemetry) | bool | Enable or disable usage telemetry for the module. Default is true. |
| [`enableVmProtection`](#parameter-vnetdefinitionenablevmprotection) | bool | Indicates if VM protection is enabled for all subnets in the Virtual Network. |
| [`flowTimeoutInMinutes`](#parameter-vnetdefinitionflowtimeoutinminutes) | int | Flow timeout in minutes for intra-VM flows (range 4–30). Default 0 sets the property to null. |
| [`ipamPoolNumberOfIpAddresses`](#parameter-vnetdefinitionipampoolnumberofipaddresses) | string | Number of IP addresses allocated from the IPAM pool. Required if addressPrefixes is defined with a resource ID of an IPAM pool. |
| [`location`](#parameter-vnetdefinitionlocation) | string | Location for all resources. Default is resourceGroup().location. |
| [`lock`](#parameter-vnetdefinitionlock) | object | Lock settings for the Virtual Network. |
| [`peerings`](#parameter-vnetdefinitionpeerings) | array | Virtual Network peering configurations. |
| [`roleAssignments`](#parameter-vnetdefinitionroleassignments) | array | Role assignments to create on the Virtual Network. |
| [`subnets`](#parameter-vnetdefinitionsubnets) | array | Array of subnets to deploy in the Virtual Network. |
| [`tags`](#parameter-vnetdefinitiontags) | object | Tags to apply to the Virtual Network. |
| [`virtualNetworkBgpCommunity`](#parameter-vnetdefinitionvirtualnetworkbgpcommunity) | string | The BGP community associated with the Virtual Network. |
| [`vnetEncryption`](#parameter-vnetdefinitionvnetencryption) | bool | Indicates if encryption is enabled for the Virtual Network. Requires the EnableVNetEncryption feature and a supported region. |
| [`vnetEncryptionEnforcement`](#parameter-vnetdefinitionvnetencryptionenforcement) | string | Enforcement policy for unencrypted VMs in an encrypted VNet. Allowed values: AllowUnencrypted, DropUnencrypted. |

### Parameter: `vNetDefinition.addressPrefixes`

An array of one or more IP address prefixes OR the resource ID of the IPAM pool to be used for the Virtual Network. Required if using IPAM pool resource ID, you must also set ipamPoolNumberOfIpAddresses.

- Required: Yes
- Type: array

### Parameter: `vNetDefinition.name`

The name of the Virtual Network (vNet).

- Required: Yes
- Type: string

### Parameter: `vNetDefinition.ddosProtectionPlanResourceId`

Resource ID of the DDoS protection plan to assign the VNet to. If blank, DDoS protection is not configured.

- Required: No
- Type: string

### Parameter: `vNetDefinition.diagnosticSettings`

The diagnostic settings of the Virtual Network.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`eventHubAuthorizationRuleResourceId`](#parameter-vnetdefinitiondiagnosticsettingseventhubauthorizationruleresourceid) | string | Resource ID of the diagnostic event hub authorization rule for the Event Hubs namespace. |
| [`eventHubName`](#parameter-vnetdefinitiondiagnosticsettingseventhubname) | string | Name of the diagnostic event hub within the namespace to which logs are streamed. |
| [`logAnalyticsDestinationType`](#parameter-vnetdefinitiondiagnosticsettingsloganalyticsdestinationtype) | string | Destination type for export to Log Analytics. Allowed values: AzureDiagnostics, Dedicated. |
| [`logCategoriesAndGroups`](#parameter-vnetdefinitiondiagnosticsettingslogcategoriesandgroups) | array | Logs to be streamed. Set to [] to disable log collection. |
| [`marketplacePartnerResourceId`](#parameter-vnetdefinitiondiagnosticsettingsmarketplacepartnerresourceid) | string | Marketplace resource ID to which diagnostic logs should be sent. |
| [`metricCategories`](#parameter-vnetdefinitiondiagnosticsettingsmetriccategories) | array | Metrics to be streamed. Set to [] to disable metric collection. |
| [`name`](#parameter-vnetdefinitiondiagnosticsettingsname) | string | Name of the diagnostic setting. |
| [`storageAccountResourceId`](#parameter-vnetdefinitiondiagnosticsettingsstorageaccountresourceid) | string | Resource ID of the diagnostic storage account. |
| [`workspaceResourceId`](#parameter-vnetdefinitiondiagnosticsettingsworkspaceresourceid) | string | Resource ID of the diagnostic Log Analytics workspace. |

### Parameter: `vNetDefinition.diagnosticSettings.eventHubAuthorizationRuleResourceId`

Resource ID of the diagnostic event hub authorization rule for the Event Hubs namespace.

- Required: No
- Type: string

### Parameter: `vNetDefinition.diagnosticSettings.eventHubName`

Name of the diagnostic event hub within the namespace to which logs are streamed.

- Required: No
- Type: string

### Parameter: `vNetDefinition.diagnosticSettings.logAnalyticsDestinationType`

Destination type for export to Log Analytics. Allowed values: AzureDiagnostics, Dedicated.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'AzureDiagnostics'
    'Dedicated'
  ]
  ```

### Parameter: `vNetDefinition.diagnosticSettings.logCategoriesAndGroups`

Logs to be streamed. Set to [] to disable log collection.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-vnetdefinitiondiagnosticsettingslogcategoriesandgroupscategory) | string | Name of a diagnostic log category for the resource type. |
| [`categoryGroup`](#parameter-vnetdefinitiondiagnosticsettingslogcategoriesandgroupscategorygroup) | string | Name of a diagnostic log category group for the resource type. |
| [`enabled`](#parameter-vnetdefinitiondiagnosticsettingslogcategoriesandgroupsenabled) | bool | Enable or disable the category explicitly. Default is true. |

### Parameter: `vNetDefinition.diagnosticSettings.logCategoriesAndGroups.category`

Name of a diagnostic log category for the resource type.

- Required: No
- Type: string

### Parameter: `vNetDefinition.diagnosticSettings.logCategoriesAndGroups.categoryGroup`

Name of a diagnostic log category group for the resource type.

- Required: No
- Type: string

### Parameter: `vNetDefinition.diagnosticSettings.logCategoriesAndGroups.enabled`

Enable or disable the category explicitly. Default is true.

- Required: No
- Type: bool

### Parameter: `vNetDefinition.diagnosticSettings.marketplacePartnerResourceId`

Marketplace resource ID to which diagnostic logs should be sent.

- Required: No
- Type: string

### Parameter: `vNetDefinition.diagnosticSettings.metricCategories`

Metrics to be streamed. Set to [] to disable metric collection.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-vnetdefinitiondiagnosticsettingsmetriccategoriescategory) | string | Name of a diagnostic metric category for the resource type. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enabled`](#parameter-vnetdefinitiondiagnosticsettingsmetriccategoriesenabled) | bool | Enable or disable the metric category explicitly. Default is true. |

### Parameter: `vNetDefinition.diagnosticSettings.metricCategories.category`

Name of a diagnostic metric category for the resource type.

- Required: Yes
- Type: string

### Parameter: `vNetDefinition.diagnosticSettings.metricCategories.enabled`

Enable or disable the metric category explicitly. Default is true.

- Required: No
- Type: bool

### Parameter: `vNetDefinition.diagnosticSettings.name`

Name of the diagnostic setting.

- Required: No
- Type: string

### Parameter: `vNetDefinition.diagnosticSettings.storageAccountResourceId`

Resource ID of the diagnostic storage account.

- Required: No
- Type: string

### Parameter: `vNetDefinition.diagnosticSettings.workspaceResourceId`

Resource ID of the diagnostic Log Analytics workspace.

- Required: No
- Type: string

### Parameter: `vNetDefinition.dnsServers`

DNS servers associated with the Virtual Network.

- Required: No
- Type: array

### Parameter: `vNetDefinition.enableTelemetry`

Enable or disable usage telemetry for the module. Default is true.

- Required: No
- Type: bool

### Parameter: `vNetDefinition.enableVmProtection`

Indicates if VM protection is enabled for all subnets in the Virtual Network.

- Required: No
- Type: bool

### Parameter: `vNetDefinition.flowTimeoutInMinutes`

Flow timeout in minutes for intra-VM flows (range 4–30). Default 0 sets the property to null.

- Required: No
- Type: int

### Parameter: `vNetDefinition.ipamPoolNumberOfIpAddresses`

Number of IP addresses allocated from the IPAM pool. Required if addressPrefixes is defined with a resource ID of an IPAM pool.

- Required: No
- Type: string

### Parameter: `vNetDefinition.location`

Location for all resources. Default is resourceGroup().location.

- Required: No
- Type: string

### Parameter: `vNetDefinition.lock`

Lock settings for the Virtual Network.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-vnetdefinitionlockkind) | string | Type of lock. Allowed values: CanNotDelete, None, ReadOnly. |
| [`name`](#parameter-vnetdefinitionlockname) | string | Name of the lock. |
| [`notes`](#parameter-vnetdefinitionlocknotes) | string | Notes for the lock. |

### Parameter: `vNetDefinition.lock.kind`

Type of lock. Allowed values: CanNotDelete, None, ReadOnly.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `vNetDefinition.lock.name`

Name of the lock.

- Required: No
- Type: string

### Parameter: `vNetDefinition.lock.notes`

Notes for the lock.

- Required: No
- Type: string

### Parameter: `vNetDefinition.peerings`

Virtual Network peering configurations.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`remoteVirtualNetworkResourceId`](#parameter-vnetdefinitionpeeringsremotevirtualnetworkresourceid) | string | Resource ID of the remote Virtual Network to peer with. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`allowForwardedTraffic`](#parameter-vnetdefinitionpeeringsallowforwardedtraffic) | bool | Allow forwarded traffic from VMs in local VNet. Default is true. |
| [`allowGatewayTransit`](#parameter-vnetdefinitionpeeringsallowgatewaytransit) | bool | Allow gateway transit from remote VNet. Default is false. |
| [`allowVirtualNetworkAccess`](#parameter-vnetdefinitionpeeringsallowvirtualnetworkaccess) | bool | Allow VMs in local VNet to access VMs in remote VNet. Default is true. |
| [`doNotVerifyRemoteGateways`](#parameter-vnetdefinitionpeeringsdonotverifyremotegateways) | bool | Do not verify remote gateway provisioning state. Default is true. |
| [`name`](#parameter-vnetdefinitionpeeringsname) | string | Name of the VNet peering resource. Default: peer-localVnetName-remoteVnetName. |
| [`remotePeeringAllowForwardedTraffic`](#parameter-vnetdefinitionpeeringsremotepeeringallowforwardedtraffic) | bool | Allow forwarded traffic from remote peering. Default is true. |
| [`remotePeeringAllowGatewayTransit`](#parameter-vnetdefinitionpeeringsremotepeeringallowgatewaytransit) | bool | Allow gateway transit from remote peering. Default is false. |
| [`remotePeeringAllowVirtualNetworkAccess`](#parameter-vnetdefinitionpeeringsremotepeeringallowvirtualnetworkaccess) | bool | Allow virtual network access from remote peering. Default is true. |
| [`remotePeeringDoNotVerifyRemoteGateways`](#parameter-vnetdefinitionpeeringsremotepeeringdonotverifyremotegateways) | bool | Do not verify provisioning state of remote peering gateway. Default is true. |
| [`remotePeeringEnabled`](#parameter-vnetdefinitionpeeringsremotepeeringenabled) | bool | Deploy outbound and inbound peering. |
| [`remotePeeringName`](#parameter-vnetdefinitionpeeringsremotepeeringname) | string | Name of the remote peering resource. Default: peer-remoteVnetName-localVnetName. |
| [`remotePeeringUseRemoteGateways`](#parameter-vnetdefinitionpeeringsremotepeeringuseremotegateways) | bool | Use remote gateways for transit if allowed. Default is false. |
| [`useRemoteGateways`](#parameter-vnetdefinitionpeeringsuseremotegateways) | bool | Use remote gateways on this Virtual Network for transit. Default is false. |

### Parameter: `vNetDefinition.peerings.remoteVirtualNetworkResourceId`

Resource ID of the remote Virtual Network to peer with.

- Required: Yes
- Type: string

### Parameter: `vNetDefinition.peerings.allowForwardedTraffic`

Allow forwarded traffic from VMs in local VNet. Default is true.

- Required: No
- Type: bool

### Parameter: `vNetDefinition.peerings.allowGatewayTransit`

Allow gateway transit from remote VNet. Default is false.

- Required: No
- Type: bool

### Parameter: `vNetDefinition.peerings.allowVirtualNetworkAccess`

Allow VMs in local VNet to access VMs in remote VNet. Default is true.

- Required: No
- Type: bool

### Parameter: `vNetDefinition.peerings.doNotVerifyRemoteGateways`

Do not verify remote gateway provisioning state. Default is true.

- Required: No
- Type: bool

### Parameter: `vNetDefinition.peerings.name`

Name of the VNet peering resource. Default: peer-localVnetName-remoteVnetName.

- Required: No
- Type: string

### Parameter: `vNetDefinition.peerings.remotePeeringAllowForwardedTraffic`

Allow forwarded traffic from remote peering. Default is true.

- Required: No
- Type: bool

### Parameter: `vNetDefinition.peerings.remotePeeringAllowGatewayTransit`

Allow gateway transit from remote peering. Default is false.

- Required: No
- Type: bool

### Parameter: `vNetDefinition.peerings.remotePeeringAllowVirtualNetworkAccess`

Allow virtual network access from remote peering. Default is true.

- Required: No
- Type: bool

### Parameter: `vNetDefinition.peerings.remotePeeringDoNotVerifyRemoteGateways`

Do not verify provisioning state of remote peering gateway. Default is true.

- Required: No
- Type: bool

### Parameter: `vNetDefinition.peerings.remotePeeringEnabled`

Deploy outbound and inbound peering.

- Required: No
- Type: bool

### Parameter: `vNetDefinition.peerings.remotePeeringName`

Name of the remote peering resource. Default: peer-remoteVnetName-localVnetName.

- Required: No
- Type: string

### Parameter: `vNetDefinition.peerings.remotePeeringUseRemoteGateways`

Use remote gateways for transit if allowed. Default is false.

- Required: No
- Type: bool

### Parameter: `vNetDefinition.peerings.useRemoteGateways`

Use remote gateways on this Virtual Network for transit. Default is false.

- Required: No
- Type: bool

### Parameter: `vNetDefinition.roleAssignments`

Role assignments to create on the Virtual Network.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-vnetdefinitionroleassignmentsprincipalid) | string | Principal ID of the user/group/identity to assign the role to. |
| [`roleDefinitionIdOrName`](#parameter-vnetdefinitionroleassignmentsroledefinitionidorname) | string | Role to assign. Accepts role name, role GUID, or fully qualified role definition ID. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-vnetdefinitionroleassignmentscondition) | string | Condition applied to the role assignment. |
| [`conditionVersion`](#parameter-vnetdefinitionroleassignmentsconditionversion) | string | Condition version. Allowed value: 2.0. |
| [`delegatedManagedIdentityResourceId`](#parameter-vnetdefinitionroleassignmentsdelegatedmanagedidentityresourceid) | string | Resource ID of delegated managed identity. |
| [`description`](#parameter-vnetdefinitionroleassignmentsdescription) | string | Description of the role assignment. |
| [`name`](#parameter-vnetdefinitionroleassignmentsname) | string | Name of the role assignment. If not provided, a GUID will be generated. |
| [`principalType`](#parameter-vnetdefinitionroleassignmentsprincipaltype) | string | Principal type. Allowed values: Device, ForeignGroup, Group, ServicePrincipal, User. |

### Parameter: `vNetDefinition.roleAssignments.principalId`

Principal ID of the user/group/identity to assign the role to.

- Required: Yes
- Type: string

### Parameter: `vNetDefinition.roleAssignments.roleDefinitionIdOrName`

Role to assign. Accepts role name, role GUID, or fully qualified role definition ID.

- Required: Yes
- Type: string

### Parameter: `vNetDefinition.roleAssignments.condition`

Condition applied to the role assignment.

- Required: No
- Type: string

### Parameter: `vNetDefinition.roleAssignments.conditionVersion`

Condition version. Allowed value: 2.0.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `vNetDefinition.roleAssignments.delegatedManagedIdentityResourceId`

Resource ID of delegated managed identity.

- Required: No
- Type: string

### Parameter: `vNetDefinition.roleAssignments.description`

Description of the role assignment.

- Required: No
- Type: string

### Parameter: `vNetDefinition.roleAssignments.name`

Name of the role assignment. If not provided, a GUID will be generated.

- Required: No
- Type: string

### Parameter: `vNetDefinition.roleAssignments.principalType`

Principal type. Allowed values: Device, ForeignGroup, Group, ServicePrincipal, User.

- Required: No
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

### Parameter: `vNetDefinition.subnets`

Array of subnets to deploy in the Virtual Network.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-vnetdefinitionsubnetsname) | string | Name of the subnet. |

**Conditional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`addressPrefix`](#parameter-vnetdefinitionsubnetsaddressprefix) | string | Address prefix for the subnet. Required if addressPrefixes is empty. |
| [`addressPrefixes`](#parameter-vnetdefinitionsubnetsaddressprefixes) | array | List of address prefixes for the subnet. Required if addressPrefix is empty. |
| [`ipamPoolPrefixAllocations`](#parameter-vnetdefinitionsubnetsipampoolprefixallocations) | array | Address space for subnet from IPAM Pool. Required if both addressPrefix and addressPrefixes are empty and VNet uses IPAM Pool. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`applicationGatewayIPConfigurations`](#parameter-vnetdefinitionsubnetsapplicationgatewayipconfigurations) | array | Application Gateway IP configurations for the subnet. |
| [`defaultOutboundAccess`](#parameter-vnetdefinitionsubnetsdefaultoutboundaccess) | bool | Disable default outbound connectivity for all VMs in subnet. Only allowed at creation time. |
| [`delegation`](#parameter-vnetdefinitionsubnetsdelegation) | string | Delegation to enable on the subnet. |
| [`natGatewayResourceId`](#parameter-vnetdefinitionsubnetsnatgatewayresourceid) | string | NAT Gateway resource ID for the subnet. |
| [`networkSecurityGroupResourceId`](#parameter-vnetdefinitionsubnetsnetworksecuritygroupresourceid) | string | NSG resource ID for the subnet. |
| [`privateEndpointNetworkPolicies`](#parameter-vnetdefinitionsubnetsprivateendpointnetworkpolicies) | string | Policy for private endpoint network. Allowed values: Disabled, Enabled, NetworkSecurityGroupEnabled, RouteTableEnabled. |
| [`privateLinkServiceNetworkPolicies`](#parameter-vnetdefinitionsubnetsprivatelinkservicenetworkpolicies) | string | Policy for private link service network. Allowed values: Disabled, Enabled. |
| [`roleAssignments`](#parameter-vnetdefinitionsubnetsroleassignments) | array | Role assignments to create on the subnet. |
| [`routeTableResourceId`](#parameter-vnetdefinitionsubnetsroutetableresourceid) | string | Route table resource ID for the subnet. |
| [`serviceEndpointPolicies`](#parameter-vnetdefinitionsubnetsserviceendpointpolicies) | array | Service endpoint policies for the subnet. |
| [`serviceEndpoints`](#parameter-vnetdefinitionsubnetsserviceendpoints) | array | Service endpoints enabled on the subnet. |
| [`sharingScope`](#parameter-vnetdefinitionsubnetssharingscope) | string | Sharing scope for the subnet. Allowed values: DelegatedServices, Tenant. |

### Parameter: `vNetDefinition.subnets.name`

Name of the subnet.

- Required: Yes
- Type: string

### Parameter: `vNetDefinition.subnets.addressPrefix`

Address prefix for the subnet. Required if addressPrefixes is empty.

- Required: No
- Type: string

### Parameter: `vNetDefinition.subnets.addressPrefixes`

List of address prefixes for the subnet. Required if addressPrefix is empty.

- Required: No
- Type: array

### Parameter: `vNetDefinition.subnets.ipamPoolPrefixAllocations`

Address space for subnet from IPAM Pool. Required if both addressPrefix and addressPrefixes are empty and VNet uses IPAM Pool.

- Required: No
- Type: array

### Parameter: `vNetDefinition.subnets.applicationGatewayIPConfigurations`

Application Gateway IP configurations for the subnet.

- Required: No
- Type: array

### Parameter: `vNetDefinition.subnets.defaultOutboundAccess`

Disable default outbound connectivity for all VMs in subnet. Only allowed at creation time.

- Required: No
- Type: bool

### Parameter: `vNetDefinition.subnets.delegation`

Delegation to enable on the subnet.

- Required: No
- Type: string

### Parameter: `vNetDefinition.subnets.natGatewayResourceId`

NAT Gateway resource ID for the subnet.

- Required: No
- Type: string

### Parameter: `vNetDefinition.subnets.networkSecurityGroupResourceId`

NSG resource ID for the subnet.

- Required: No
- Type: string

### Parameter: `vNetDefinition.subnets.privateEndpointNetworkPolicies`

Policy for private endpoint network. Allowed values: Disabled, Enabled, NetworkSecurityGroupEnabled, RouteTableEnabled.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Disabled'
    'Enabled'
    'NetworkSecurityGroupEnabled'
    'RouteTableEnabled'
  ]
  ```

### Parameter: `vNetDefinition.subnets.privateLinkServiceNetworkPolicies`

Policy for private link service network. Allowed values: Disabled, Enabled.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Disabled'
    'Enabled'
  ]
  ```

### Parameter: `vNetDefinition.subnets.roleAssignments`

Role assignments to create on the subnet.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-vnetdefinitionsubnetsroleassignmentsprincipalid) | string | Principal ID of the user/group/identity to assign the role to. |
| [`roleDefinitionIdOrName`](#parameter-vnetdefinitionsubnetsroleassignmentsroledefinitionidorname) | string | Role to assign. Accepts role name, role GUID, or fully qualified role definition ID. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-vnetdefinitionsubnetsroleassignmentscondition) | string | Condition applied to the role assignment. |
| [`conditionVersion`](#parameter-vnetdefinitionsubnetsroleassignmentsconditionversion) | string | Condition version. Allowed value: 2.0. |
| [`delegatedManagedIdentityResourceId`](#parameter-vnetdefinitionsubnetsroleassignmentsdelegatedmanagedidentityresourceid) | string | Resource ID of delegated managed identity. |
| [`description`](#parameter-vnetdefinitionsubnetsroleassignmentsdescription) | string | Description of the role assignment. |
| [`name`](#parameter-vnetdefinitionsubnetsroleassignmentsname) | string | Name of the role assignment. If not provided, a GUID will be generated. |
| [`principalType`](#parameter-vnetdefinitionsubnetsroleassignmentsprincipaltype) | string | Principal type. Allowed values: Device, ForeignGroup, Group, ServicePrincipal, User. |

### Parameter: `vNetDefinition.subnets.roleAssignments.principalId`

Principal ID of the user/group/identity to assign the role to.

- Required: Yes
- Type: string

### Parameter: `vNetDefinition.subnets.roleAssignments.roleDefinitionIdOrName`

Role to assign. Accepts role name, role GUID, or fully qualified role definition ID.

- Required: Yes
- Type: string

### Parameter: `vNetDefinition.subnets.roleAssignments.condition`

Condition applied to the role assignment.

- Required: No
- Type: string

### Parameter: `vNetDefinition.subnets.roleAssignments.conditionVersion`

Condition version. Allowed value: 2.0.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `vNetDefinition.subnets.roleAssignments.delegatedManagedIdentityResourceId`

Resource ID of delegated managed identity.

- Required: No
- Type: string

### Parameter: `vNetDefinition.subnets.roleAssignments.description`

Description of the role assignment.

- Required: No
- Type: string

### Parameter: `vNetDefinition.subnets.roleAssignments.name`

Name of the role assignment. If not provided, a GUID will be generated.

- Required: No
- Type: string

### Parameter: `vNetDefinition.subnets.roleAssignments.principalType`

Principal type. Allowed values: Device, ForeignGroup, Group, ServicePrincipal, User.

- Required: No
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

### Parameter: `vNetDefinition.subnets.routeTableResourceId`

Route table resource ID for the subnet.

- Required: No
- Type: string

### Parameter: `vNetDefinition.subnets.serviceEndpointPolicies`

Service endpoint policies for the subnet.

- Required: No
- Type: array

### Parameter: `vNetDefinition.subnets.serviceEndpoints`

Service endpoints enabled on the subnet.

- Required: No
- Type: array

### Parameter: `vNetDefinition.subnets.sharingScope`

Sharing scope for the subnet. Allowed values: DelegatedServices, Tenant.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'DelegatedServices'
    'Tenant'
  ]
  ```

### Parameter: `vNetDefinition.tags`

Tags to apply to the Virtual Network.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-vnetdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `vNetDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `vNetDefinition.virtualNetworkBgpCommunity`

The BGP community associated with the Virtual Network.

- Required: No
- Type: string

### Parameter: `vNetDefinition.vnetEncryption`

Indicates if encryption is enabled for the Virtual Network. Requires the EnableVNetEncryption feature and a supported region.

- Required: No
- Type: bool

### Parameter: `vNetDefinition.vnetEncryptionEnforcement`

Enforcement policy for unencrypted VMs in an encrypted VNet. Allowed values: AllowUnencrypted, DropUnencrypted.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'AllowUnencrypted'
    'DropUnencrypted'
  ]
  ```

### Parameter: `wafPolicyDefinition`

Web Application Firewall (WAF) policy configuration. Required if deployToggles.wafPolicy is true and you are deploying Application Gateway via this template.

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      managedRules: {
        exclusions: []
        managedRuleSets: [
          {
            ruleGroupOverride: []
            type: 'OWASP'
            version: '3.2'
          }
        ]
      }
      name: ''
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`managedRules`](#parameter-wafpolicydefinitionmanagedrules) | object | Managed rules configuration (rule sets and exclusions). |
| [`name`](#parameter-wafpolicydefinitionname) | string | Name of the Application Gateway WAF policy. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`customRules`](#parameter-wafpolicydefinitioncustomrules) | array | Custom rules inside the policy. |
| [`enableTelemetry`](#parameter-wafpolicydefinitionenabletelemetry) | bool | Enable or disable usage telemetry for the module. Default is true. |
| [`location`](#parameter-wafpolicydefinitionlocation) | string | Location for all resources. Default is resourceGroup().location. |
| [`policySettings`](#parameter-wafpolicydefinitionpolicysettings) | object | Policy settings (state, mode, size limits). |
| [`tags`](#parameter-wafpolicydefinitiontags) | object | Resource tags. |

### Parameter: `wafPolicyDefinition.managedRules`

Managed rules configuration (rule sets and exclusions).

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`managedRuleSets`](#parameter-wafpolicydefinitionmanagedrulesmanagedrulesets) | array | Managed rule sets to apply. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`exclusions`](#parameter-wafpolicydefinitionmanagedrulesexclusions) | array | Exclusions for specific rules or variables. |

### Parameter: `wafPolicyDefinition.managedRules.managedRuleSets`

Managed rule sets to apply.

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`type`](#parameter-wafpolicydefinitionmanagedrulesmanagedrulesetstype) | string | Rule set type (e.g., OWASP). |
| [`version`](#parameter-wafpolicydefinitionmanagedrulesmanagedrulesetsversion) | string | Rule set version. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`ruleGroupOverride`](#parameter-wafpolicydefinitionmanagedrulesmanagedrulesetsrulegroupoverride) | array | Overrides for specific rule groups. |

### Parameter: `wafPolicyDefinition.managedRules.managedRuleSets.type`

Rule set type (e.g., OWASP).

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition.managedRules.managedRuleSets.version`

Rule set version.

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition.managedRules.managedRuleSets.ruleGroupOverride`

Overrides for specific rule groups.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`rule`](#parameter-wafpolicydefinitionmanagedrulesmanagedrulesetsrulegroupoverriderule) | array | Rule overrides within the group. |
| [`ruleGroupName`](#parameter-wafpolicydefinitionmanagedrulesmanagedrulesetsrulegroupoverriderulegroupname) | string | Name of the rule group. |

### Parameter: `wafPolicyDefinition.managedRules.managedRuleSets.ruleGroupOverride.rule`

Rule overrides within the group.

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`action`](#parameter-wafpolicydefinitionmanagedrulesmanagedrulesetsrulegroupoverrideruleaction) | string | Action to take (e.g., Allow, Block, Log). |
| [`enabled`](#parameter-wafpolicydefinitionmanagedrulesmanagedrulesetsrulegroupoverrideruleenabled) | bool | Whether the rule is enabled. |
| [`id`](#parameter-wafpolicydefinitionmanagedrulesmanagedrulesetsrulegroupoverrideruleid) | string | Rule ID. |

### Parameter: `wafPolicyDefinition.managedRules.managedRuleSets.ruleGroupOverride.rule.action`

Action to take (e.g., Allow, Block, Log).

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition.managedRules.managedRuleSets.ruleGroupOverride.rule.enabled`

Whether the rule is enabled.

- Required: Yes
- Type: bool

### Parameter: `wafPolicyDefinition.managedRules.managedRuleSets.ruleGroupOverride.rule.id`

Rule ID.

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition.managedRules.managedRuleSets.ruleGroupOverride.ruleGroupName`

Name of the rule group.

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition.managedRules.exclusions`

Exclusions for specific rules or variables.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`matchVariable`](#parameter-wafpolicydefinitionmanagedrulesexclusionsmatchvariable) | string | Match variable to exclude (e.g., RequestHeaderNames). |
| [`selector`](#parameter-wafpolicydefinitionmanagedrulesexclusionsselector) | string | Selector value for the match variable. |
| [`selectorMatchOperator`](#parameter-wafpolicydefinitionmanagedrulesexclusionsselectormatchoperator) | string | Selector match operator (e.g., Equals, Contains). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`excludedRuleSet`](#parameter-wafpolicydefinitionmanagedrulesexclusionsexcludedruleset) | object | Specific managed rule set exclusion details. |

### Parameter: `wafPolicyDefinition.managedRules.exclusions.matchVariable`

Match variable to exclude (e.g., RequestHeaderNames).

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition.managedRules.exclusions.selector`

Selector value for the match variable.

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition.managedRules.exclusions.selectorMatchOperator`

Selector match operator (e.g., Equals, Contains).

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition.managedRules.exclusions.excludedRuleSet`

Specific managed rule set exclusion details.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`type`](#parameter-wafpolicydefinitionmanagedrulesexclusionsexcludedrulesettype) | string | Rule set type (e.g., OWASP). |
| [`version`](#parameter-wafpolicydefinitionmanagedrulesexclusionsexcludedrulesetversion) | string | Rule set version (e.g., 3.2). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`ruleGroup`](#parameter-wafpolicydefinitionmanagedrulesexclusionsexcludedrulesetrulegroup) | array | Rule groups to exclude. |

### Parameter: `wafPolicyDefinition.managedRules.exclusions.excludedRuleSet.type`

Rule set type (e.g., OWASP).

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition.managedRules.exclusions.excludedRuleSet.version`

Rule set version (e.g., 3.2).

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition.managedRules.exclusions.excludedRuleSet.ruleGroup`

Rule groups to exclude.

- Required: No
- Type: array

### Parameter: `wafPolicyDefinition.name`

Name of the Application Gateway WAF policy.

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition.customRules`

Custom rules inside the policy.

- Required: No
- Type: array

### Parameter: `wafPolicyDefinition.enableTelemetry`

Enable or disable usage telemetry for the module. Default is true.

- Required: No
- Type: bool

### Parameter: `wafPolicyDefinition.location`

Location for all resources. Default is resourceGroup().location.

- Required: No
- Type: string

### Parameter: `wafPolicyDefinition.policySettings`

Policy settings (state, mode, size limits).

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enabledState`](#parameter-wafpolicydefinitionpolicysettingsenabledstate) | string | WAF policy enabled state. |
| [`fileUploadLimitInMb`](#parameter-wafpolicydefinitionpolicysettingsfileuploadlimitinmb) | int | File upload size limit (MB). |
| [`maxRequestBodySizeInKb`](#parameter-wafpolicydefinitionpolicysettingsmaxrequestbodysizeinkb) | int | Maximum request body size (KB). |
| [`mode`](#parameter-wafpolicydefinitionpolicysettingsmode) | string | WAF mode (Prevention or Detection). |
| [`requestBodyCheck`](#parameter-wafpolicydefinitionpolicysettingsrequestbodycheck) | bool | Enable request body inspection. |

### Parameter: `wafPolicyDefinition.policySettings.enabledState`

WAF policy enabled state.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Disabled'
    'Enabled'
  ]
  ```

### Parameter: `wafPolicyDefinition.policySettings.fileUploadLimitInMb`

File upload size limit (MB).

- Required: Yes
- Type: int

### Parameter: `wafPolicyDefinition.policySettings.maxRequestBodySizeInKb`

Maximum request body size (KB).

- Required: Yes
- Type: int

### Parameter: `wafPolicyDefinition.policySettings.mode`

WAF mode (Prevention or Detection).

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Detection'
    'Prevention'
  ]
  ```

### Parameter: `wafPolicyDefinition.policySettings.requestBodyCheck`

Enable request body inspection.

- Required: Yes
- Type: bool

### Parameter: `wafPolicyDefinition.tags`

Resource tags.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-wafpolicydefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `wafPolicyDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition`

AI Foundry project configuration (account/project, networking, associated resources, and deployments).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      baseName: '[parameters(\'baseName\')]'
  }
  ```

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`aiFoundryConfiguration`](#parameter-aifoundrydefinitionaifoundryconfiguration) | object | Custom configuration for the AI Foundry account. |
| [`aiModelDeployments`](#parameter-aifoundrydefinitionaimodeldeployments) | array | Specifies the OpenAI deployments to create. |
| [`aiSearchConfiguration`](#parameter-aifoundrydefinitionaisearchconfiguration) | object | Custom configuration for AI Search. |
| [`baseName`](#parameter-aifoundrydefinitionbasename) | string | A friendly application/environment name to serve as the base when using the default naming for all resources in this deployment. |
| [`baseUniqueName`](#parameter-aifoundrydefinitionbaseuniquename) | string | A unique text value for the application/environment. Used to ensure resource names are unique for global resources. Defaults to a 5-character substring of the unique string generated from the subscription ID, resource group name, and base name. |
| [`cosmosDbConfiguration`](#parameter-aifoundrydefinitioncosmosdbconfiguration) | object | Custom configuration for Cosmos DB. |
| [`enableTelemetry`](#parameter-aifoundrydefinitionenabletelemetry) | bool | Enable/Disable usage telemetry for the module. Default is true. |
| [`includeAssociatedResources`](#parameter-aifoundrydefinitionincludeassociatedresources) | bool | Whether to include associated resources (Key Vault, AI Search, Storage Account, Cosmos DB). Defaults to false. |
| [`keyVaultConfiguration`](#parameter-aifoundrydefinitionkeyvaultconfiguration) | object | Custom configuration for Key Vault. |
| [`location`](#parameter-aifoundrydefinitionlocation) | string | Location for all resources. Defaults to the resource group location. |
| [`lock`](#parameter-aifoundrydefinitionlock) | object | Lock configuration for the AI resources. |
| [`privateEndpointSubnetResourceId`](#parameter-aifoundrydefinitionprivateendpointsubnetresourceid) | string | The Resource ID of the subnet to establish Private Endpoint(s). If provided, private endpoints will be created for the AI Foundry account and associated resources. Each resource will also require supplied private DNS zone resource ID(s). |
| [`storageAccountConfiguration`](#parameter-aifoundrydefinitionstorageaccountconfiguration) | object | Custom configuration for Storage Account. |
| [`tags`](#parameter-aifoundrydefinitiontags) | object | Specifies the resource tags for all the resources. |

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration`

Custom configuration for the AI Foundry account.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`accountName`](#parameter-aifoundrydefinitionaifoundryconfigurationaccountname) | string | The name of the AI Foundry account. |
| [`allowProjectManagement`](#parameter-aifoundrydefinitionaifoundryconfigurationallowprojectmanagement) | bool | Whether to allow project management in the account. Defaults to true. |
| [`createCapabilityHosts`](#parameter-aifoundrydefinitionaifoundryconfigurationcreatecapabilityhosts) | bool | Whether to create capability hosts for the AI Agent Service. Requires includeAssociatedResources = true. Defaults to false. |
| [`location`](#parameter-aifoundrydefinitionaifoundryconfigurationlocation) | string | Location of the AI Foundry account. Defaults to resource group location. |
| [`networking`](#parameter-aifoundrydefinitionaifoundryconfigurationnetworking) | object | Networking configuration for the AI Foundry account and project. |
| [`project`](#parameter-aifoundrydefinitionaifoundryconfigurationproject) | object | Default AI Foundry project. |
| [`roleAssignments`](#parameter-aifoundrydefinitionaifoundryconfigurationroleassignments) | array | Role assignments to apply to the AI Foundry account. |
| [`sku`](#parameter-aifoundrydefinitionaifoundryconfigurationsku) | string | SKU of the AI Foundry / Cognitive Services account. Defaults to S0. |

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.accountName`

The name of the AI Foundry account.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.allowProjectManagement`

Whether to allow project management in the account. Defaults to true.

- Required: No
- Type: bool

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.createCapabilityHosts`

Whether to create capability hosts for the AI Agent Service. Requires includeAssociatedResources = true. Defaults to false.

- Required: No
- Type: bool

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.location`

Location of the AI Foundry account. Defaults to resource group location.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.networking`

Networking configuration for the AI Foundry account and project.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`aiServicesPrivateDnsZoneResourceId`](#parameter-aifoundrydefinitionaifoundryconfigurationnetworkingaiservicesprivatednszoneresourceid) | string | Private DNS Zone Resource ID for Azure AI Services. |
| [`cognitiveServicesPrivateDnsZoneResourceId`](#parameter-aifoundrydefinitionaifoundryconfigurationnetworkingcognitiveservicesprivatednszoneresourceid) | string | Private DNS Zone Resource ID for Cognitive Services. |
| [`openAiPrivateDnsZoneResourceId`](#parameter-aifoundrydefinitionaifoundryconfigurationnetworkingopenaiprivatednszoneresourceid) | string | Private DNS Zone Resource ID for OpenAI. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`agentServiceSubnetResourceId`](#parameter-aifoundrydefinitionaifoundryconfigurationnetworkingagentservicesubnetresourceid) | string | Subnet Resource ID for Azure AI Services. Required if you want to deploy AI Agent Service. |

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.networking.aiServicesPrivateDnsZoneResourceId`

Private DNS Zone Resource ID for Azure AI Services.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.networking.cognitiveServicesPrivateDnsZoneResourceId`

Private DNS Zone Resource ID for Cognitive Services.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.networking.openAiPrivateDnsZoneResourceId`

Private DNS Zone Resource ID for OpenAI.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.networking.agentServiceSubnetResourceId`

Subnet Resource ID for Azure AI Services. Required if you want to deploy AI Agent Service.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.project`

Default AI Foundry project.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`description`](#parameter-aifoundrydefinitionaifoundryconfigurationprojectdescription) | string | Project description. |
| [`displayName`](#parameter-aifoundrydefinitionaifoundryconfigurationprojectdisplayname) | string | Friendly/display name of the project. |
| [`name`](#parameter-aifoundrydefinitionaifoundryconfigurationprojectname) | string | Name of the project. |

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.project.description`

Project description.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.project.displayName`

Friendly/display name of the project.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.project.name`

Name of the project.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.roleAssignments`

Role assignments to apply to the AI Foundry account.

- Required: No
- Type: array

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.sku`

SKU of the AI Foundry / Cognitive Services account. Defaults to S0.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'F0'
    'S0'
  ]
  ```

### Parameter: `aiFoundryDefinition.aiModelDeployments`

Specifies the OpenAI deployments to create.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`model`](#parameter-aifoundrydefinitionaimodeldeploymentsmodel) | object | Deployment model configuration. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-aifoundrydefinitionaimodeldeploymentsname) | string | Name of the deployment. |
| [`raiPolicyName`](#parameter-aifoundrydefinitionaimodeldeploymentsraipolicyname) | string | Responsible AI policy name. |
| [`sku`](#parameter-aifoundrydefinitionaimodeldeploymentssku) | object | SKU configuration for the deployment. |
| [`versionUpgradeOption`](#parameter-aifoundrydefinitionaimodeldeploymentsversionupgradeoption) | string | Version upgrade option. |

### Parameter: `aiFoundryDefinition.aiModelDeployments.model`

Deployment model configuration.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`format`](#parameter-aifoundrydefinitionaimodeldeploymentsmodelformat) | string | Format of the deployment model. |
| [`name`](#parameter-aifoundrydefinitionaimodeldeploymentsmodelname) | string | Name of the deployment model. |
| [`version`](#parameter-aifoundrydefinitionaimodeldeploymentsmodelversion) | string | Version of the deployment model. |

### Parameter: `aiFoundryDefinition.aiModelDeployments.model.format`

Format of the deployment model.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.aiModelDeployments.model.name`

Name of the deployment model.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.aiModelDeployments.model.version`

Version of the deployment model.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.aiModelDeployments.name`

Name of the deployment.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiModelDeployments.raiPolicyName`

Responsible AI policy name.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiModelDeployments.sku`

SKU configuration for the deployment.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-aifoundrydefinitionaimodeldeploymentsskuname) | string | SKU name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`capacity`](#parameter-aifoundrydefinitionaimodeldeploymentsskucapacity) | int | SKU capacity. |
| [`family`](#parameter-aifoundrydefinitionaimodeldeploymentsskufamily) | string | SKU family. |
| [`size`](#parameter-aifoundrydefinitionaimodeldeploymentsskusize) | string | SKU size. |
| [`tier`](#parameter-aifoundrydefinitionaimodeldeploymentsskutier) | string | SKU tier. |

### Parameter: `aiFoundryDefinition.aiModelDeployments.sku.name`

SKU name.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.aiModelDeployments.sku.capacity`

SKU capacity.

- Required: No
- Type: int

### Parameter: `aiFoundryDefinition.aiModelDeployments.sku.family`

SKU family.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiModelDeployments.sku.size`

SKU size.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiModelDeployments.sku.tier`

SKU tier.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiModelDeployments.versionUpgradeOption`

Version upgrade option.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiSearchConfiguration`

Custom configuration for AI Search.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`existingResourceId`](#parameter-aifoundrydefinitionaisearchconfigurationexistingresourceid) | string | Existing AI Search resource ID. If provided, other properties are ignored. |
| [`name`](#parameter-aifoundrydefinitionaisearchconfigurationname) | string | Name for the AI Search resource. |
| [`privateDnsZoneResourceId`](#parameter-aifoundrydefinitionaisearchconfigurationprivatednszoneresourceid) | string | Private DNS Zone Resource ID for AI Search. Required if private endpoints are used. |
| [`roleAssignments`](#parameter-aifoundrydefinitionaisearchconfigurationroleassignments) | array | Role assignments for the AI Search resource. |

### Parameter: `aiFoundryDefinition.aiSearchConfiguration.existingResourceId`

Existing AI Search resource ID. If provided, other properties are ignored.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiSearchConfiguration.name`

Name for the AI Search resource.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiSearchConfiguration.privateDnsZoneResourceId`

Private DNS Zone Resource ID for AI Search. Required if private endpoints are used.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiSearchConfiguration.roleAssignments`

Role assignments for the AI Search resource.

- Required: No
- Type: array

### Parameter: `aiFoundryDefinition.baseName`

A friendly application/environment name to serve as the base when using the default naming for all resources in this deployment.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.baseUniqueName`

A unique text value for the application/environment. Used to ensure resource names are unique for global resources. Defaults to a 5-character substring of the unique string generated from the subscription ID, resource group name, and base name.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.cosmosDbConfiguration`

Custom configuration for Cosmos DB.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`existingResourceId`](#parameter-aifoundrydefinitioncosmosdbconfigurationexistingresourceid) | string | Existing Cosmos DB resource ID. If provided, other properties are ignored. |
| [`name`](#parameter-aifoundrydefinitioncosmosdbconfigurationname) | string | Name for the Cosmos DB resource. |
| [`privateDnsZoneResourceId`](#parameter-aifoundrydefinitioncosmosdbconfigurationprivatednszoneresourceid) | string | Private DNS Zone Resource ID for Cosmos DB. Required if private endpoints are used. |
| [`roleAssignments`](#parameter-aifoundrydefinitioncosmosdbconfigurationroleassignments) | array | Role assignments for the Cosmos DB resource. |

### Parameter: `aiFoundryDefinition.cosmosDbConfiguration.existingResourceId`

Existing Cosmos DB resource ID. If provided, other properties are ignored.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.cosmosDbConfiguration.name`

Name for the Cosmos DB resource.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.cosmosDbConfiguration.privateDnsZoneResourceId`

Private DNS Zone Resource ID for Cosmos DB. Required if private endpoints are used.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.cosmosDbConfiguration.roleAssignments`

Role assignments for the Cosmos DB resource.

- Required: No
- Type: array

### Parameter: `aiFoundryDefinition.enableTelemetry`

Enable/Disable usage telemetry for the module. Default is true.

- Required: No
- Type: bool

### Parameter: `aiFoundryDefinition.includeAssociatedResources`

Whether to include associated resources (Key Vault, AI Search, Storage Account, Cosmos DB). Defaults to false.

- Required: No
- Type: bool

### Parameter: `aiFoundryDefinition.keyVaultConfiguration`

Custom configuration for Key Vault.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`existingResourceId`](#parameter-aifoundrydefinitionkeyvaultconfigurationexistingresourceid) | string | Existing Key Vault resource ID. If provided, other properties are ignored. |
| [`name`](#parameter-aifoundrydefinitionkeyvaultconfigurationname) | string | Name for the Key Vault. |
| [`privateDnsZoneResourceId`](#parameter-aifoundrydefinitionkeyvaultconfigurationprivatednszoneresourceid) | string | Private DNS Zone Resource ID for Key Vault. Required if private endpoints are used. |
| [`roleAssignments`](#parameter-aifoundrydefinitionkeyvaultconfigurationroleassignments) | array | Role assignments for the Key Vault resource. |

### Parameter: `aiFoundryDefinition.keyVaultConfiguration.existingResourceId`

Existing Key Vault resource ID. If provided, other properties are ignored.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.keyVaultConfiguration.name`

Name for the Key Vault.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.keyVaultConfiguration.privateDnsZoneResourceId`

Private DNS Zone Resource ID for Key Vault. Required if private endpoints are used.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.keyVaultConfiguration.roleAssignments`

Role assignments for the Key Vault resource.

- Required: No
- Type: array

### Parameter: `aiFoundryDefinition.location`

Location for all resources. Defaults to the resource group location.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.lock`

Lock configuration for the AI resources.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-aifoundrydefinitionlockkind) | string | Lock type. |
| [`name`](#parameter-aifoundrydefinitionlockname) | string | Lock name. |
| [`notes`](#parameter-aifoundrydefinitionlocknotes) | string | Lock notes. |

### Parameter: `aiFoundryDefinition.lock.kind`

Lock type.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `aiFoundryDefinition.lock.name`

Lock name.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.lock.notes`

Lock notes.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.privateEndpointSubnetResourceId`

The Resource ID of the subnet to establish Private Endpoint(s). If provided, private endpoints will be created for the AI Foundry account and associated resources. Each resource will also require supplied private DNS zone resource ID(s).

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.storageAccountConfiguration`

Custom configuration for Storage Account.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`blobPrivateDnsZoneResourceId`](#parameter-aifoundrydefinitionstorageaccountconfigurationblobprivatednszoneresourceid) | string | Private DNS Zone Resource ID for blob endpoint. Required if private endpoints are used. |
| [`existingResourceId`](#parameter-aifoundrydefinitionstorageaccountconfigurationexistingresourceid) | string | Existing Storage Account resource ID. If provided, other properties are ignored. |
| [`name`](#parameter-aifoundrydefinitionstorageaccountconfigurationname) | string | Name for the Storage Account. |
| [`roleAssignments`](#parameter-aifoundrydefinitionstorageaccountconfigurationroleassignments) | array | Role assignments for the Storage Account. |

### Parameter: `aiFoundryDefinition.storageAccountConfiguration.blobPrivateDnsZoneResourceId`

Private DNS Zone Resource ID for blob endpoint. Required if private endpoints are used.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.storageAccountConfiguration.existingResourceId`

Existing Storage Account resource ID. If provided, other properties are ignored.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.storageAccountConfiguration.name`

Name for the Storage Account.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.storageAccountConfiguration.roleAssignments`

Role assignments for the Storage Account.

- Required: No
- Type: array

### Parameter: `aiFoundryDefinition.tags`

Specifies the resource tags for all the resources.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-aifoundrydefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `aiFoundryDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `azdoPat`

PAT used to register the Azure DevOps agent (when runner = azdo).

- Required: No
- Type: securestring

### Parameter: `baseName`

 Base name to seed resource names; defaults to a 12-char token.

- Required: No
- Type: string
- Default: `[substring(parameters('resourceToken'), 0, 12)]`

### Parameter: `containerAppsList`

List of Container Apps to create.

- Required: No
- Type: array
- Default:
  ```Bicep
  [
    {
      containers: []
      environmentResourceId: ''
      name: 'hello-world'
      workloadProfileName: 'default'
    }
  ]
  ```

### Parameter: `deployToggles`

 Per-service deployment toggles; set false to skip creating a service. Reuse still works via resourceIds.

- Required: No
- Type: object
- Default:
  ```Bicep
  {
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
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`apiManagement`](#parameter-deploytogglesapimanagement) | bool | Toggle to deploy API Management (true) or not (false). |
| [`appConfig`](#parameter-deploytogglesappconfig) | bool | Toggle to deploy App Configuration (true) or not (false). |
| [`appInsights`](#parameter-deploytogglesappinsights) | bool | Toggle to deploy Application Insights (true) or not (false). |
| [`applicationGateway`](#parameter-deploytogglesapplicationgateway) | bool | Toggle to deploy Application Gateway (true) or not (false). |
| [`applicationGatewayPublicIp`](#parameter-deploytogglesapplicationgatewaypublicip) | bool | Toggle to deploy a Public IP address for the Application Gateway (true) or not (false). |
| [`bastionHost`](#parameter-deploytogglesbastionhost) | bool | Toggle to deploy an Azure Bastion host (true) or not (false). |
| [`buildVm`](#parameter-deploytogglesbuildvm) | bool | Toggle to deploy Build VM (true) or not (false). |
| [`containerApps`](#parameter-deploytogglescontainerapps) | bool | Toggle to deploy Container Apps (true) or not (false). |
| [`containerEnv`](#parameter-deploytogglescontainerenv) | bool | Toggle to deploy Container Apps Environment (true) or not (false). |
| [`containerRegistry`](#parameter-deploytogglescontainerregistry) | bool | Toggle to deploy Azure Container Registry (true) or not (false). |
| [`cosmosDb`](#parameter-deploytogglescosmosdb) | bool | Toggle to deploy Cosmos DB (true) or not (false). |
| [`firewall`](#parameter-deploytogglesfirewall) | bool | Toggle to deploy Azure Firewall (true) or not (false). |
| [`groundingWithBingSearch`](#parameter-deploytogglesgroundingwithbingsearch) | bool | Toggle to deploy Bing Grounding with Search (true) or not (false). |
| [`jumpVm`](#parameter-deploytogglesjumpvm) | bool | Toggle to deploy Jump VM (true) or not (false). |
| [`keyVault`](#parameter-deploytoggleskeyvault) | bool | Toggle to deploy Key Vault (true) or not (false). |
| [`logAnalytics`](#parameter-deploytogglesloganalytics) | bool | Toggle to deploy Log Analytics (true) or not (false). |
| [`searchService`](#parameter-deploytogglessearchservice) | bool | Toggle to deploy Azure AI Search (true) or not (false). |
| [`storageAccount`](#parameter-deploytogglesstorageaccount) | bool | Toggle to deploy Storage Account (true) or not (false). |
| [`virtualNetwork`](#parameter-deploytogglesvirtualnetwork) | bool | Toggle to deploy a new Virtual Network (true) or not (false). |
| [`wafPolicy`](#parameter-deploytoggleswafpolicy) | bool | Toggle to deploy an Application Gateway WAF policy (true) or not (false). |

### Parameter: `deployToggles.apiManagement`

Toggle to deploy API Management (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.appConfig`

Toggle to deploy App Configuration (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.appInsights`

Toggle to deploy Application Insights (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.applicationGateway`

Toggle to deploy Application Gateway (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.applicationGatewayPublicIp`

Toggle to deploy a Public IP address for the Application Gateway (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.bastionHost`

Toggle to deploy an Azure Bastion host (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.buildVm`

Toggle to deploy Build VM (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.containerApps`

Toggle to deploy Container Apps (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.containerEnv`

Toggle to deploy Container Apps Environment (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.containerRegistry`

Toggle to deploy Azure Container Registry (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.cosmosDb`

Toggle to deploy Cosmos DB (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.firewall`

Toggle to deploy Azure Firewall (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.groundingWithBingSearch`

Toggle to deploy Bing Grounding with Search (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.jumpVm`

Toggle to deploy Jump VM (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.keyVault`

Toggle to deploy Key Vault (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.logAnalytics`

Toggle to deploy Log Analytics (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.searchService`

Toggle to deploy Azure AI Search (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.storageAccount`

Toggle to deploy Storage Account (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.virtualNetwork`

Toggle to deploy a new Virtual Network (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.wafPolicy`

Toggle to deploy an Application Gateway WAF policy (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `enableTelemetry`

Enable/Disable usage telemetry for module.

- Required: No
- Type: bool
- Default: `True`

### Parameter: `flagPlatformLandingZone`

 Enable platform landing zone integration.

- Required: No
- Type: bool
- Default: `False`

### Parameter: `githubPat`

PAT used to request a GitHub runner registration token (when runner = github).

- Required: No
- Type: securestring

### Parameter: `location`

Azure region for AI LZ resources. Defaults to the resource group location.

- Required: No
- Type: string
- Default: `[resourceGroup().location]`

### Parameter: `nsgDefinitions`

NSG definitions per subnet role; each entry deploys an NSG for that subnet when a non-empty name is provided.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`acaEnvironment`](#parameter-nsgdefinitionsacaenvironment) | object | NSG definition applied to the Azure Container Apps environment (infrastructure) subnet. |
| [`agent`](#parameter-nsgdefinitionsagent) | object | NSG definition applied to the agent (workload) subnet. |
| [`apiManagement`](#parameter-nsgdefinitionsapimanagement) | object | NSG definition applied to the API Management subnet. |
| [`applicationGateway`](#parameter-nsgdefinitionsapplicationgateway) | object | NSG definition applied to the Application Gateway subnet. |
| [`devopsBuildAgents`](#parameter-nsgdefinitionsdevopsbuildagents) | object | NSG definition applied to the DevOps build agents subnet. |
| [`jumpbox`](#parameter-nsgdefinitionsjumpbox) | object | NSG definition applied to the jumpbox (bastion-accessed) subnet. |
| [`pe`](#parameter-nsgdefinitionspe) | object | NSG definition applied to the private endpoints (PE) subnet. |

### Parameter: `nsgDefinitions.acaEnvironment`

NSG definition applied to the Azure Container Apps environment (infrastructure) subnet.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-nsgdefinitionsacaenvironmentname) | string | Name of the Network Security Group. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`diagnosticSettings`](#parameter-nsgdefinitionsacaenvironmentdiagnosticsettings) | array | Diagnostic settings to send NSG logs/metrics to Log Analytics, Event Hub, or Storage. |
| [`enableTelemetry`](#parameter-nsgdefinitionsacaenvironmentenabletelemetry) | bool | Enable or disable usage telemetry for this module. Default: true. |
| [`flushConnection`](#parameter-nsgdefinitionsacaenvironmentflushconnection) | bool | When true, flows created from NSG connections are re-evaluated when rules are updated. Default: false. |
| [`location`](#parameter-nsgdefinitionsacaenvironmentlocation) | string | Azure region for the NSG. Defaults to the resource group location. |
| [`lock`](#parameter-nsgdefinitionsacaenvironmentlock) | object | Management lock configuration for the NSG. |
| [`roleAssignments`](#parameter-nsgdefinitionsacaenvironmentroleassignments) | array | Role assignments to apply on the NSG. |
| [`securityRules`](#parameter-nsgdefinitionsacaenvironmentsecurityrules) | array | Security rules to apply to the NSG. If omitted, only default rules are present. |
| [`tags`](#parameter-nsgdefinitionsacaenvironmenttags) | object | Tags to apply to the NSG. |

### Parameter: `nsgDefinitions.acaEnvironment.name`

Name of the Network Security Group.

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.diagnosticSettings`

Diagnostic settings to send NSG logs/metrics to Log Analytics, Event Hub, or Storage.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`eventHubAuthorizationRuleResourceId`](#parameter-nsgdefinitionsacaenvironmentdiagnosticsettingseventhubauthorizationruleresourceid) | string | Destination Event Hub authorization rule resource ID. |
| [`eventHubName`](#parameter-nsgdefinitionsacaenvironmentdiagnosticsettingseventhubname) | string | Destination Event Hub name when sending to Event Hub. |
| [`logAnalyticsDestinationType`](#parameter-nsgdefinitionsacaenvironmentdiagnosticsettingsloganalyticsdestinationtype) | string | Destination type for Log Analytics (AzureDiagnostics or Dedicated). |
| [`logCategoriesAndGroups`](#parameter-nsgdefinitionsacaenvironmentdiagnosticsettingslogcategoriesandgroups) | array | List of categories and/or category groups to enable. |
| [`marketplacePartnerResourceId`](#parameter-nsgdefinitionsacaenvironmentdiagnosticsettingsmarketplacepartnerresourceid) | string | Marketplace partner destination resource ID (if applicable). |
| [`name`](#parameter-nsgdefinitionsacaenvironmentdiagnosticsettingsname) | string | Name of the diagnostic settings resource. |
| [`storageAccountResourceId`](#parameter-nsgdefinitionsacaenvironmentdiagnosticsettingsstorageaccountresourceid) | string | Destination Storage Account resource ID. |
| [`workspaceResourceId`](#parameter-nsgdefinitionsacaenvironmentdiagnosticsettingsworkspaceresourceid) | string | Destination Log Analytics workspace resource ID. |

### Parameter: `nsgDefinitions.acaEnvironment.diagnosticSettings.eventHubAuthorizationRuleResourceId`

Destination Event Hub authorization rule resource ID.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.diagnosticSettings.eventHubName`

Destination Event Hub name when sending to Event Hub.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.diagnosticSettings.logAnalyticsDestinationType`

Destination type for Log Analytics (AzureDiagnostics or Dedicated).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'AzureDiagnostics'
    'Dedicated'
  ]
  ```

### Parameter: `nsgDefinitions.acaEnvironment.diagnosticSettings.logCategoriesAndGroups`

List of categories and/or category groups to enable.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-nsgdefinitionsacaenvironmentdiagnosticsettingslogcategoriesandgroupscategory) | string | Single diagnostic log category to enable. |
| [`categoryGroup`](#parameter-nsgdefinitionsacaenvironmentdiagnosticsettingslogcategoriesandgroupscategorygroup) | string | Category group (e.g., AllMetrics) to enable. |
| [`enabled`](#parameter-nsgdefinitionsacaenvironmentdiagnosticsettingslogcategoriesandgroupsenabled) | bool | Whether this category/category group is enabled. |

### Parameter: `nsgDefinitions.acaEnvironment.diagnosticSettings.logCategoriesAndGroups.category`

Single diagnostic log category to enable.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.diagnosticSettings.logCategoriesAndGroups.categoryGroup`

Category group (e.g., AllMetrics) to enable.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.diagnosticSettings.logCategoriesAndGroups.enabled`

Whether this category/category group is enabled.

- Required: No
- Type: bool

### Parameter: `nsgDefinitions.acaEnvironment.diagnosticSettings.marketplacePartnerResourceId`

Marketplace partner destination resource ID (if applicable).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.diagnosticSettings.name`

Name of the diagnostic settings resource.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.diagnosticSettings.storageAccountResourceId`

Destination Storage Account resource ID.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.diagnosticSettings.workspaceResourceId`

Destination Log Analytics workspace resource ID.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.enableTelemetry`

Enable or disable usage telemetry for this module. Default: true.

- Required: No
- Type: bool

### Parameter: `nsgDefinitions.acaEnvironment.flushConnection`

When true, flows created from NSG connections are re-evaluated when rules are updated. Default: false.

- Required: No
- Type: bool

### Parameter: `nsgDefinitions.acaEnvironment.location`

Azure region for the NSG. Defaults to the resource group location.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.lock`

Management lock configuration for the NSG.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-nsgdefinitionsacaenvironmentlockkind) | string | Lock type (None, CanNotDelete, or ReadOnly). |
| [`name`](#parameter-nsgdefinitionsacaenvironmentlockname) | string | Name of the management lock. |
| [`notes`](#parameter-nsgdefinitionsacaenvironmentlocknotes) | string | Notes describing the reason for the lock. |

### Parameter: `nsgDefinitions.acaEnvironment.lock.kind`

Lock type (None, CanNotDelete, or ReadOnly).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `nsgDefinitions.acaEnvironment.lock.name`

Name of the management lock.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.lock.notes`

Notes describing the reason for the lock.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.roleAssignments`

Role assignments to apply on the NSG.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-nsgdefinitionsacaenvironmentroleassignmentsprincipalid) | string | Principal (object) ID for the assignment. |
| [`roleDefinitionIdOrName`](#parameter-nsgdefinitionsacaenvironmentroleassignmentsroledefinitionidorname) | string | Role to assign (name, GUID, or fully qualified role definition ID). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-nsgdefinitionsacaenvironmentroleassignmentscondition) | string | Advanced condition expression for the assignment. |
| [`conditionVersion`](#parameter-nsgdefinitionsacaenvironmentroleassignmentsconditionversion) | string | Condition version. Use 2.0 when condition is provided. |
| [`delegatedManagedIdentityResourceId`](#parameter-nsgdefinitionsacaenvironmentroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID (for cross-tenant scenarios). |
| [`description`](#parameter-nsgdefinitionsacaenvironmentroleassignmentsdescription) | string | Description for the role assignment. |
| [`name`](#parameter-nsgdefinitionsacaenvironmentroleassignmentsname) | string | Stable GUID name of the role assignment (omit to auto-generate). |
| [`principalType`](#parameter-nsgdefinitionsacaenvironmentroleassignmentsprincipaltype) | string | Principal type for the assignment. |

### Parameter: `nsgDefinitions.acaEnvironment.roleAssignments.principalId`

Principal (object) ID for the assignment.

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.roleAssignments.roleDefinitionIdOrName`

Role to assign (name, GUID, or fully qualified role definition ID).

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.roleAssignments.condition`

Advanced condition expression for the assignment.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.roleAssignments.conditionVersion`

Condition version. Use 2.0 when condition is provided.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `nsgDefinitions.acaEnvironment.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID (for cross-tenant scenarios).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.roleAssignments.description`

Description for the role assignment.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.roleAssignments.name`

Stable GUID name of the role assignment (omit to auto-generate).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.roleAssignments.principalType`

Principal type for the assignment.

- Required: No
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

### Parameter: `nsgDefinitions.acaEnvironment.securityRules`

Security rules to apply to the NSG. If omitted, only default rules are present.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-nsgdefinitionsacaenvironmentsecurityrulesname) | string | Name of the security rule. |
| [`properties`](#parameter-nsgdefinitionsacaenvironmentsecurityrulesproperties) | object | Properties that define the behavior of the security rule. |

### Parameter: `nsgDefinitions.acaEnvironment.securityRules.name`

Name of the security rule.

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.securityRules.properties`

Properties that define the behavior of the security rule.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`access`](#parameter-nsgdefinitionsacaenvironmentsecurityrulespropertiesaccess) | string | Whether matching traffic is allowed or denied. |
| [`direction`](#parameter-nsgdefinitionsacaenvironmentsecurityrulespropertiesdirection) | string | Direction of the rule (Inbound or Outbound). |
| [`priority`](#parameter-nsgdefinitionsacaenvironmentsecurityrulespropertiespriority) | int | Priority of the rule (100–4096). Must be unique per rule in the NSG. |
| [`protocol`](#parameter-nsgdefinitionsacaenvironmentsecurityrulespropertiesprotocol) | string | Network protocol to match. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`description`](#parameter-nsgdefinitionsacaenvironmentsecurityrulespropertiesdescription) | string | Free-form description for the rule. |
| [`destinationAddressPrefix`](#parameter-nsgdefinitionsacaenvironmentsecurityrulespropertiesdestinationaddressprefix) | string | Single destination address prefix (e.g., 10.0.0.0/24, VirtualNetwork). |
| [`destinationAddressPrefixes`](#parameter-nsgdefinitionsacaenvironmentsecurityrulespropertiesdestinationaddressprefixes) | array | Multiple destination address prefixes. |
| [`destinationApplicationSecurityGroupResourceIds`](#parameter-nsgdefinitionsacaenvironmentsecurityrulespropertiesdestinationapplicationsecuritygroupresourceids) | array | Destination Application Security Group (ASG) resource IDs. |
| [`destinationPortRange`](#parameter-nsgdefinitionsacaenvironmentsecurityrulespropertiesdestinationportrange) | string | Single destination port or port range (e.g., 443, 1000-2000). |
| [`destinationPortRanges`](#parameter-nsgdefinitionsacaenvironmentsecurityrulespropertiesdestinationportranges) | array | Multiple destination ports or port ranges. |
| [`sourceAddressPrefix`](#parameter-nsgdefinitionsacaenvironmentsecurityrulespropertiessourceaddressprefix) | string | Single source address prefix (e.g., Internet, 10.0.0.0/24). |
| [`sourceAddressPrefixes`](#parameter-nsgdefinitionsacaenvironmentsecurityrulespropertiessourceaddressprefixes) | array | Multiple source address prefixes. |
| [`sourceApplicationSecurityGroupResourceIds`](#parameter-nsgdefinitionsacaenvironmentsecurityrulespropertiessourceapplicationsecuritygroupresourceids) | array | Source Application Security Group (ASG) resource IDs. |
| [`sourcePortRange`](#parameter-nsgdefinitionsacaenvironmentsecurityrulespropertiessourceportrange) | string | Single source port or port range. |
| [`sourcePortRanges`](#parameter-nsgdefinitionsacaenvironmentsecurityrulespropertiessourceportranges) | array | Multiple source ports or port ranges. |

### Parameter: `nsgDefinitions.acaEnvironment.securityRules.properties.access`

Whether matching traffic is allowed or denied.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Allow'
    'Deny'
  ]
  ```

### Parameter: `nsgDefinitions.acaEnvironment.securityRules.properties.direction`

Direction of the rule (Inbound or Outbound).

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Inbound'
    'Outbound'
  ]
  ```

### Parameter: `nsgDefinitions.acaEnvironment.securityRules.properties.priority`

Priority of the rule (100–4096). Must be unique per rule in the NSG.

- Required: Yes
- Type: int

### Parameter: `nsgDefinitions.acaEnvironment.securityRules.properties.protocol`

Network protocol to match.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    '*'
    'Ah'
    'Esp'
    'Icmp'
    'Tcp'
    'Udp'
  ]
  ```

### Parameter: `nsgDefinitions.acaEnvironment.securityRules.properties.description`

Free-form description for the rule.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.securityRules.properties.destinationAddressPrefix`

Single destination address prefix (e.g., 10.0.0.0/24, VirtualNetwork).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.securityRules.properties.destinationAddressPrefixes`

Multiple destination address prefixes.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.acaEnvironment.securityRules.properties.destinationApplicationSecurityGroupResourceIds`

Destination Application Security Group (ASG) resource IDs.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.acaEnvironment.securityRules.properties.destinationPortRange`

Single destination port or port range (e.g., 443, 1000-2000).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.securityRules.properties.destinationPortRanges`

Multiple destination ports or port ranges.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.acaEnvironment.securityRules.properties.sourceAddressPrefix`

Single source address prefix (e.g., Internet, 10.0.0.0/24).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.securityRules.properties.sourceAddressPrefixes`

Multiple source address prefixes.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.acaEnvironment.securityRules.properties.sourceApplicationSecurityGroupResourceIds`

Source Application Security Group (ASG) resource IDs.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.acaEnvironment.securityRules.properties.sourcePortRange`

Single source port or port range.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.acaEnvironment.securityRules.properties.sourcePortRanges`

Multiple source ports or port ranges.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.acaEnvironment.tags`

Tags to apply to the NSG.

- Required: No
- Type: object

### Parameter: `nsgDefinitions.agent`

NSG definition applied to the agent (workload) subnet.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-nsgdefinitionsagentname) | string | Name of the Network Security Group. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`diagnosticSettings`](#parameter-nsgdefinitionsagentdiagnosticsettings) | array | Diagnostic settings to send NSG logs/metrics to Log Analytics, Event Hub, or Storage. |
| [`enableTelemetry`](#parameter-nsgdefinitionsagentenabletelemetry) | bool | Enable or disable usage telemetry for this module. Default: true. |
| [`flushConnection`](#parameter-nsgdefinitionsagentflushconnection) | bool | When true, flows created from NSG connections are re-evaluated when rules are updated. Default: false. |
| [`location`](#parameter-nsgdefinitionsagentlocation) | string | Azure region for the NSG. Defaults to the resource group location. |
| [`lock`](#parameter-nsgdefinitionsagentlock) | object | Management lock configuration for the NSG. |
| [`roleAssignments`](#parameter-nsgdefinitionsagentroleassignments) | array | Role assignments to apply on the NSG. |
| [`securityRules`](#parameter-nsgdefinitionsagentsecurityrules) | array | Security rules to apply to the NSG. If omitted, only default rules are present. |
| [`tags`](#parameter-nsgdefinitionsagenttags) | object | Tags to apply to the NSG. |

### Parameter: `nsgDefinitions.agent.name`

Name of the Network Security Group.

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.agent.diagnosticSettings`

Diagnostic settings to send NSG logs/metrics to Log Analytics, Event Hub, or Storage.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`eventHubAuthorizationRuleResourceId`](#parameter-nsgdefinitionsagentdiagnosticsettingseventhubauthorizationruleresourceid) | string | Destination Event Hub authorization rule resource ID. |
| [`eventHubName`](#parameter-nsgdefinitionsagentdiagnosticsettingseventhubname) | string | Destination Event Hub name when sending to Event Hub. |
| [`logAnalyticsDestinationType`](#parameter-nsgdefinitionsagentdiagnosticsettingsloganalyticsdestinationtype) | string | Destination type for Log Analytics (AzureDiagnostics or Dedicated). |
| [`logCategoriesAndGroups`](#parameter-nsgdefinitionsagentdiagnosticsettingslogcategoriesandgroups) | array | List of categories and/or category groups to enable. |
| [`marketplacePartnerResourceId`](#parameter-nsgdefinitionsagentdiagnosticsettingsmarketplacepartnerresourceid) | string | Marketplace partner destination resource ID (if applicable). |
| [`name`](#parameter-nsgdefinitionsagentdiagnosticsettingsname) | string | Name of the diagnostic settings resource. |
| [`storageAccountResourceId`](#parameter-nsgdefinitionsagentdiagnosticsettingsstorageaccountresourceid) | string | Destination Storage Account resource ID. |
| [`workspaceResourceId`](#parameter-nsgdefinitionsagentdiagnosticsettingsworkspaceresourceid) | string | Destination Log Analytics workspace resource ID. |

### Parameter: `nsgDefinitions.agent.diagnosticSettings.eventHubAuthorizationRuleResourceId`

Destination Event Hub authorization rule resource ID.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.agent.diagnosticSettings.eventHubName`

Destination Event Hub name when sending to Event Hub.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.agent.diagnosticSettings.logAnalyticsDestinationType`

Destination type for Log Analytics (AzureDiagnostics or Dedicated).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'AzureDiagnostics'
    'Dedicated'
  ]
  ```

### Parameter: `nsgDefinitions.agent.diagnosticSettings.logCategoriesAndGroups`

List of categories and/or category groups to enable.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-nsgdefinitionsagentdiagnosticsettingslogcategoriesandgroupscategory) | string | Single diagnostic log category to enable. |
| [`categoryGroup`](#parameter-nsgdefinitionsagentdiagnosticsettingslogcategoriesandgroupscategorygroup) | string | Category group (e.g., AllMetrics) to enable. |
| [`enabled`](#parameter-nsgdefinitionsagentdiagnosticsettingslogcategoriesandgroupsenabled) | bool | Whether this category/category group is enabled. |

### Parameter: `nsgDefinitions.agent.diagnosticSettings.logCategoriesAndGroups.category`

Single diagnostic log category to enable.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.agent.diagnosticSettings.logCategoriesAndGroups.categoryGroup`

Category group (e.g., AllMetrics) to enable.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.agent.diagnosticSettings.logCategoriesAndGroups.enabled`

Whether this category/category group is enabled.

- Required: No
- Type: bool

### Parameter: `nsgDefinitions.agent.diagnosticSettings.marketplacePartnerResourceId`

Marketplace partner destination resource ID (if applicable).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.agent.diagnosticSettings.name`

Name of the diagnostic settings resource.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.agent.diagnosticSettings.storageAccountResourceId`

Destination Storage Account resource ID.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.agent.diagnosticSettings.workspaceResourceId`

Destination Log Analytics workspace resource ID.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.agent.enableTelemetry`

Enable or disable usage telemetry for this module. Default: true.

- Required: No
- Type: bool

### Parameter: `nsgDefinitions.agent.flushConnection`

When true, flows created from NSG connections are re-evaluated when rules are updated. Default: false.

- Required: No
- Type: bool

### Parameter: `nsgDefinitions.agent.location`

Azure region for the NSG. Defaults to the resource group location.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.agent.lock`

Management lock configuration for the NSG.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-nsgdefinitionsagentlockkind) | string | Lock type (None, CanNotDelete, or ReadOnly). |
| [`name`](#parameter-nsgdefinitionsagentlockname) | string | Name of the management lock. |
| [`notes`](#parameter-nsgdefinitionsagentlocknotes) | string | Notes describing the reason for the lock. |

### Parameter: `nsgDefinitions.agent.lock.kind`

Lock type (None, CanNotDelete, or ReadOnly).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `nsgDefinitions.agent.lock.name`

Name of the management lock.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.agent.lock.notes`

Notes describing the reason for the lock.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.agent.roleAssignments`

Role assignments to apply on the NSG.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-nsgdefinitionsagentroleassignmentsprincipalid) | string | Principal (object) ID for the assignment. |
| [`roleDefinitionIdOrName`](#parameter-nsgdefinitionsagentroleassignmentsroledefinitionidorname) | string | Role to assign (name, GUID, or fully qualified role definition ID). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-nsgdefinitionsagentroleassignmentscondition) | string | Advanced condition expression for the assignment. |
| [`conditionVersion`](#parameter-nsgdefinitionsagentroleassignmentsconditionversion) | string | Condition version. Use 2.0 when condition is provided. |
| [`delegatedManagedIdentityResourceId`](#parameter-nsgdefinitionsagentroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID (for cross-tenant scenarios). |
| [`description`](#parameter-nsgdefinitionsagentroleassignmentsdescription) | string | Description for the role assignment. |
| [`name`](#parameter-nsgdefinitionsagentroleassignmentsname) | string | Stable GUID name of the role assignment (omit to auto-generate). |
| [`principalType`](#parameter-nsgdefinitionsagentroleassignmentsprincipaltype) | string | Principal type for the assignment. |

### Parameter: `nsgDefinitions.agent.roleAssignments.principalId`

Principal (object) ID for the assignment.

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.agent.roleAssignments.roleDefinitionIdOrName`

Role to assign (name, GUID, or fully qualified role definition ID).

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.agent.roleAssignments.condition`

Advanced condition expression for the assignment.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.agent.roleAssignments.conditionVersion`

Condition version. Use 2.0 when condition is provided.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `nsgDefinitions.agent.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID (for cross-tenant scenarios).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.agent.roleAssignments.description`

Description for the role assignment.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.agent.roleAssignments.name`

Stable GUID name of the role assignment (omit to auto-generate).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.agent.roleAssignments.principalType`

Principal type for the assignment.

- Required: No
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

### Parameter: `nsgDefinitions.agent.securityRules`

Security rules to apply to the NSG. If omitted, only default rules are present.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-nsgdefinitionsagentsecurityrulesname) | string | Name of the security rule. |
| [`properties`](#parameter-nsgdefinitionsagentsecurityrulesproperties) | object | Properties that define the behavior of the security rule. |

### Parameter: `nsgDefinitions.agent.securityRules.name`

Name of the security rule.

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.agent.securityRules.properties`

Properties that define the behavior of the security rule.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`access`](#parameter-nsgdefinitionsagentsecurityrulespropertiesaccess) | string | Whether matching traffic is allowed or denied. |
| [`direction`](#parameter-nsgdefinitionsagentsecurityrulespropertiesdirection) | string | Direction of the rule (Inbound or Outbound). |
| [`priority`](#parameter-nsgdefinitionsagentsecurityrulespropertiespriority) | int | Priority of the rule (100–4096). Must be unique per rule in the NSG. |
| [`protocol`](#parameter-nsgdefinitionsagentsecurityrulespropertiesprotocol) | string | Network protocol to match. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`description`](#parameter-nsgdefinitionsagentsecurityrulespropertiesdescription) | string | Free-form description for the rule. |
| [`destinationAddressPrefix`](#parameter-nsgdefinitionsagentsecurityrulespropertiesdestinationaddressprefix) | string | Single destination address prefix (e.g., 10.0.0.0/24, VirtualNetwork). |
| [`destinationAddressPrefixes`](#parameter-nsgdefinitionsagentsecurityrulespropertiesdestinationaddressprefixes) | array | Multiple destination address prefixes. |
| [`destinationApplicationSecurityGroupResourceIds`](#parameter-nsgdefinitionsagentsecurityrulespropertiesdestinationapplicationsecuritygroupresourceids) | array | Destination Application Security Group (ASG) resource IDs. |
| [`destinationPortRange`](#parameter-nsgdefinitionsagentsecurityrulespropertiesdestinationportrange) | string | Single destination port or port range (e.g., 443, 1000-2000). |
| [`destinationPortRanges`](#parameter-nsgdefinitionsagentsecurityrulespropertiesdestinationportranges) | array | Multiple destination ports or port ranges. |
| [`sourceAddressPrefix`](#parameter-nsgdefinitionsagentsecurityrulespropertiessourceaddressprefix) | string | Single source address prefix (e.g., Internet, 10.0.0.0/24). |
| [`sourceAddressPrefixes`](#parameter-nsgdefinitionsagentsecurityrulespropertiessourceaddressprefixes) | array | Multiple source address prefixes. |
| [`sourceApplicationSecurityGroupResourceIds`](#parameter-nsgdefinitionsagentsecurityrulespropertiessourceapplicationsecuritygroupresourceids) | array | Source Application Security Group (ASG) resource IDs. |
| [`sourcePortRange`](#parameter-nsgdefinitionsagentsecurityrulespropertiessourceportrange) | string | Single source port or port range. |
| [`sourcePortRanges`](#parameter-nsgdefinitionsagentsecurityrulespropertiessourceportranges) | array | Multiple source ports or port ranges. |

### Parameter: `nsgDefinitions.agent.securityRules.properties.access`

Whether matching traffic is allowed or denied.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Allow'
    'Deny'
  ]
  ```

### Parameter: `nsgDefinitions.agent.securityRules.properties.direction`

Direction of the rule (Inbound or Outbound).

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Inbound'
    'Outbound'
  ]
  ```

### Parameter: `nsgDefinitions.agent.securityRules.properties.priority`

Priority of the rule (100–4096). Must be unique per rule in the NSG.

- Required: Yes
- Type: int

### Parameter: `nsgDefinitions.agent.securityRules.properties.protocol`

Network protocol to match.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    '*'
    'Ah'
    'Esp'
    'Icmp'
    'Tcp'
    'Udp'
  ]
  ```

### Parameter: `nsgDefinitions.agent.securityRules.properties.description`

Free-form description for the rule.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.agent.securityRules.properties.destinationAddressPrefix`

Single destination address prefix (e.g., 10.0.0.0/24, VirtualNetwork).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.agent.securityRules.properties.destinationAddressPrefixes`

Multiple destination address prefixes.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.agent.securityRules.properties.destinationApplicationSecurityGroupResourceIds`

Destination Application Security Group (ASG) resource IDs.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.agent.securityRules.properties.destinationPortRange`

Single destination port or port range (e.g., 443, 1000-2000).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.agent.securityRules.properties.destinationPortRanges`

Multiple destination ports or port ranges.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.agent.securityRules.properties.sourceAddressPrefix`

Single source address prefix (e.g., Internet, 10.0.0.0/24).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.agent.securityRules.properties.sourceAddressPrefixes`

Multiple source address prefixes.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.agent.securityRules.properties.sourceApplicationSecurityGroupResourceIds`

Source Application Security Group (ASG) resource IDs.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.agent.securityRules.properties.sourcePortRange`

Single source port or port range.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.agent.securityRules.properties.sourcePortRanges`

Multiple source ports or port ranges.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.agent.tags`

Tags to apply to the NSG.

- Required: No
- Type: object

### Parameter: `nsgDefinitions.apiManagement`

NSG definition applied to the API Management subnet.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-nsgdefinitionsapimanagementname) | string | Name of the Network Security Group. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`diagnosticSettings`](#parameter-nsgdefinitionsapimanagementdiagnosticsettings) | array | Diagnostic settings to send NSG logs/metrics to Log Analytics, Event Hub, or Storage. |
| [`enableTelemetry`](#parameter-nsgdefinitionsapimanagementenabletelemetry) | bool | Enable or disable usage telemetry for this module. Default: true. |
| [`flushConnection`](#parameter-nsgdefinitionsapimanagementflushconnection) | bool | When true, flows created from NSG connections are re-evaluated when rules are updated. Default: false. |
| [`location`](#parameter-nsgdefinitionsapimanagementlocation) | string | Azure region for the NSG. Defaults to the resource group location. |
| [`lock`](#parameter-nsgdefinitionsapimanagementlock) | object | Management lock configuration for the NSG. |
| [`roleAssignments`](#parameter-nsgdefinitionsapimanagementroleassignments) | array | Role assignments to apply on the NSG. |
| [`securityRules`](#parameter-nsgdefinitionsapimanagementsecurityrules) | array | Security rules to apply to the NSG. If omitted, only default rules are present. |
| [`tags`](#parameter-nsgdefinitionsapimanagementtags) | object | Tags to apply to the NSG. |

### Parameter: `nsgDefinitions.apiManagement.name`

Name of the Network Security Group.

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.apiManagement.diagnosticSettings`

Diagnostic settings to send NSG logs/metrics to Log Analytics, Event Hub, or Storage.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`eventHubAuthorizationRuleResourceId`](#parameter-nsgdefinitionsapimanagementdiagnosticsettingseventhubauthorizationruleresourceid) | string | Destination Event Hub authorization rule resource ID. |
| [`eventHubName`](#parameter-nsgdefinitionsapimanagementdiagnosticsettingseventhubname) | string | Destination Event Hub name when sending to Event Hub. |
| [`logAnalyticsDestinationType`](#parameter-nsgdefinitionsapimanagementdiagnosticsettingsloganalyticsdestinationtype) | string | Destination type for Log Analytics (AzureDiagnostics or Dedicated). |
| [`logCategoriesAndGroups`](#parameter-nsgdefinitionsapimanagementdiagnosticsettingslogcategoriesandgroups) | array | List of categories and/or category groups to enable. |
| [`marketplacePartnerResourceId`](#parameter-nsgdefinitionsapimanagementdiagnosticsettingsmarketplacepartnerresourceid) | string | Marketplace partner destination resource ID (if applicable). |
| [`name`](#parameter-nsgdefinitionsapimanagementdiagnosticsettingsname) | string | Name of the diagnostic settings resource. |
| [`storageAccountResourceId`](#parameter-nsgdefinitionsapimanagementdiagnosticsettingsstorageaccountresourceid) | string | Destination Storage Account resource ID. |
| [`workspaceResourceId`](#parameter-nsgdefinitionsapimanagementdiagnosticsettingsworkspaceresourceid) | string | Destination Log Analytics workspace resource ID. |

### Parameter: `nsgDefinitions.apiManagement.diagnosticSettings.eventHubAuthorizationRuleResourceId`

Destination Event Hub authorization rule resource ID.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.apiManagement.diagnosticSettings.eventHubName`

Destination Event Hub name when sending to Event Hub.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.apiManagement.diagnosticSettings.logAnalyticsDestinationType`

Destination type for Log Analytics (AzureDiagnostics or Dedicated).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'AzureDiagnostics'
    'Dedicated'
  ]
  ```

### Parameter: `nsgDefinitions.apiManagement.diagnosticSettings.logCategoriesAndGroups`

List of categories and/or category groups to enable.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-nsgdefinitionsapimanagementdiagnosticsettingslogcategoriesandgroupscategory) | string | Single diagnostic log category to enable. |
| [`categoryGroup`](#parameter-nsgdefinitionsapimanagementdiagnosticsettingslogcategoriesandgroupscategorygroup) | string | Category group (e.g., AllMetrics) to enable. |
| [`enabled`](#parameter-nsgdefinitionsapimanagementdiagnosticsettingslogcategoriesandgroupsenabled) | bool | Whether this category/category group is enabled. |

### Parameter: `nsgDefinitions.apiManagement.diagnosticSettings.logCategoriesAndGroups.category`

Single diagnostic log category to enable.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.apiManagement.diagnosticSettings.logCategoriesAndGroups.categoryGroup`

Category group (e.g., AllMetrics) to enable.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.apiManagement.diagnosticSettings.logCategoriesAndGroups.enabled`

Whether this category/category group is enabled.

- Required: No
- Type: bool

### Parameter: `nsgDefinitions.apiManagement.diagnosticSettings.marketplacePartnerResourceId`

Marketplace partner destination resource ID (if applicable).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.apiManagement.diagnosticSettings.name`

Name of the diagnostic settings resource.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.apiManagement.diagnosticSettings.storageAccountResourceId`

Destination Storage Account resource ID.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.apiManagement.diagnosticSettings.workspaceResourceId`

Destination Log Analytics workspace resource ID.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.apiManagement.enableTelemetry`

Enable or disable usage telemetry for this module. Default: true.

- Required: No
- Type: bool

### Parameter: `nsgDefinitions.apiManagement.flushConnection`

When true, flows created from NSG connections are re-evaluated when rules are updated. Default: false.

- Required: No
- Type: bool

### Parameter: `nsgDefinitions.apiManagement.location`

Azure region for the NSG. Defaults to the resource group location.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.apiManagement.lock`

Management lock configuration for the NSG.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-nsgdefinitionsapimanagementlockkind) | string | Lock type (None, CanNotDelete, or ReadOnly). |
| [`name`](#parameter-nsgdefinitionsapimanagementlockname) | string | Name of the management lock. |
| [`notes`](#parameter-nsgdefinitionsapimanagementlocknotes) | string | Notes describing the reason for the lock. |

### Parameter: `nsgDefinitions.apiManagement.lock.kind`

Lock type (None, CanNotDelete, or ReadOnly).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `nsgDefinitions.apiManagement.lock.name`

Name of the management lock.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.apiManagement.lock.notes`

Notes describing the reason for the lock.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.apiManagement.roleAssignments`

Role assignments to apply on the NSG.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-nsgdefinitionsapimanagementroleassignmentsprincipalid) | string | Principal (object) ID for the assignment. |
| [`roleDefinitionIdOrName`](#parameter-nsgdefinitionsapimanagementroleassignmentsroledefinitionidorname) | string | Role to assign (name, GUID, or fully qualified role definition ID). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-nsgdefinitionsapimanagementroleassignmentscondition) | string | Advanced condition expression for the assignment. |
| [`conditionVersion`](#parameter-nsgdefinitionsapimanagementroleassignmentsconditionversion) | string | Condition version. Use 2.0 when condition is provided. |
| [`delegatedManagedIdentityResourceId`](#parameter-nsgdefinitionsapimanagementroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID (for cross-tenant scenarios). |
| [`description`](#parameter-nsgdefinitionsapimanagementroleassignmentsdescription) | string | Description for the role assignment. |
| [`name`](#parameter-nsgdefinitionsapimanagementroleassignmentsname) | string | Stable GUID name of the role assignment (omit to auto-generate). |
| [`principalType`](#parameter-nsgdefinitionsapimanagementroleassignmentsprincipaltype) | string | Principal type for the assignment. |

### Parameter: `nsgDefinitions.apiManagement.roleAssignments.principalId`

Principal (object) ID for the assignment.

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.apiManagement.roleAssignments.roleDefinitionIdOrName`

Role to assign (name, GUID, or fully qualified role definition ID).

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.apiManagement.roleAssignments.condition`

Advanced condition expression for the assignment.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.apiManagement.roleAssignments.conditionVersion`

Condition version. Use 2.0 when condition is provided.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `nsgDefinitions.apiManagement.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID (for cross-tenant scenarios).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.apiManagement.roleAssignments.description`

Description for the role assignment.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.apiManagement.roleAssignments.name`

Stable GUID name of the role assignment (omit to auto-generate).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.apiManagement.roleAssignments.principalType`

Principal type for the assignment.

- Required: No
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

### Parameter: `nsgDefinitions.apiManagement.securityRules`

Security rules to apply to the NSG. If omitted, only default rules are present.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-nsgdefinitionsapimanagementsecurityrulesname) | string | Name of the security rule. |
| [`properties`](#parameter-nsgdefinitionsapimanagementsecurityrulesproperties) | object | Properties that define the behavior of the security rule. |

### Parameter: `nsgDefinitions.apiManagement.securityRules.name`

Name of the security rule.

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.apiManagement.securityRules.properties`

Properties that define the behavior of the security rule.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`access`](#parameter-nsgdefinitionsapimanagementsecurityrulespropertiesaccess) | string | Whether matching traffic is allowed or denied. |
| [`direction`](#parameter-nsgdefinitionsapimanagementsecurityrulespropertiesdirection) | string | Direction of the rule (Inbound or Outbound). |
| [`priority`](#parameter-nsgdefinitionsapimanagementsecurityrulespropertiespriority) | int | Priority of the rule (100–4096). Must be unique per rule in the NSG. |
| [`protocol`](#parameter-nsgdefinitionsapimanagementsecurityrulespropertiesprotocol) | string | Network protocol to match. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`description`](#parameter-nsgdefinitionsapimanagementsecurityrulespropertiesdescription) | string | Free-form description for the rule. |
| [`destinationAddressPrefix`](#parameter-nsgdefinitionsapimanagementsecurityrulespropertiesdestinationaddressprefix) | string | Single destination address prefix (e.g., 10.0.0.0/24, VirtualNetwork). |
| [`destinationAddressPrefixes`](#parameter-nsgdefinitionsapimanagementsecurityrulespropertiesdestinationaddressprefixes) | array | Multiple destination address prefixes. |
| [`destinationApplicationSecurityGroupResourceIds`](#parameter-nsgdefinitionsapimanagementsecurityrulespropertiesdestinationapplicationsecuritygroupresourceids) | array | Destination Application Security Group (ASG) resource IDs. |
| [`destinationPortRange`](#parameter-nsgdefinitionsapimanagementsecurityrulespropertiesdestinationportrange) | string | Single destination port or port range (e.g., 443, 1000-2000). |
| [`destinationPortRanges`](#parameter-nsgdefinitionsapimanagementsecurityrulespropertiesdestinationportranges) | array | Multiple destination ports or port ranges. |
| [`sourceAddressPrefix`](#parameter-nsgdefinitionsapimanagementsecurityrulespropertiessourceaddressprefix) | string | Single source address prefix (e.g., Internet, 10.0.0.0/24). |
| [`sourceAddressPrefixes`](#parameter-nsgdefinitionsapimanagementsecurityrulespropertiessourceaddressprefixes) | array | Multiple source address prefixes. |
| [`sourceApplicationSecurityGroupResourceIds`](#parameter-nsgdefinitionsapimanagementsecurityrulespropertiessourceapplicationsecuritygroupresourceids) | array | Source Application Security Group (ASG) resource IDs. |
| [`sourcePortRange`](#parameter-nsgdefinitionsapimanagementsecurityrulespropertiessourceportrange) | string | Single source port or port range. |
| [`sourcePortRanges`](#parameter-nsgdefinitionsapimanagementsecurityrulespropertiessourceportranges) | array | Multiple source ports or port ranges. |

### Parameter: `nsgDefinitions.apiManagement.securityRules.properties.access`

Whether matching traffic is allowed or denied.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Allow'
    'Deny'
  ]
  ```

### Parameter: `nsgDefinitions.apiManagement.securityRules.properties.direction`

Direction of the rule (Inbound or Outbound).

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Inbound'
    'Outbound'
  ]
  ```

### Parameter: `nsgDefinitions.apiManagement.securityRules.properties.priority`

Priority of the rule (100–4096). Must be unique per rule in the NSG.

- Required: Yes
- Type: int

### Parameter: `nsgDefinitions.apiManagement.securityRules.properties.protocol`

Network protocol to match.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    '*'
    'Ah'
    'Esp'
    'Icmp'
    'Tcp'
    'Udp'
  ]
  ```

### Parameter: `nsgDefinitions.apiManagement.securityRules.properties.description`

Free-form description for the rule.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.apiManagement.securityRules.properties.destinationAddressPrefix`

Single destination address prefix (e.g., 10.0.0.0/24, VirtualNetwork).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.apiManagement.securityRules.properties.destinationAddressPrefixes`

Multiple destination address prefixes.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.apiManagement.securityRules.properties.destinationApplicationSecurityGroupResourceIds`

Destination Application Security Group (ASG) resource IDs.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.apiManagement.securityRules.properties.destinationPortRange`

Single destination port or port range (e.g., 443, 1000-2000).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.apiManagement.securityRules.properties.destinationPortRanges`

Multiple destination ports or port ranges.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.apiManagement.securityRules.properties.sourceAddressPrefix`

Single source address prefix (e.g., Internet, 10.0.0.0/24).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.apiManagement.securityRules.properties.sourceAddressPrefixes`

Multiple source address prefixes.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.apiManagement.securityRules.properties.sourceApplicationSecurityGroupResourceIds`

Source Application Security Group (ASG) resource IDs.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.apiManagement.securityRules.properties.sourcePortRange`

Single source port or port range.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.apiManagement.securityRules.properties.sourcePortRanges`

Multiple source ports or port ranges.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.apiManagement.tags`

Tags to apply to the NSG.

- Required: No
- Type: object

### Parameter: `nsgDefinitions.applicationGateway`

NSG definition applied to the Application Gateway subnet.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-nsgdefinitionsapplicationgatewayname) | string | Name of the Network Security Group. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`diagnosticSettings`](#parameter-nsgdefinitionsapplicationgatewaydiagnosticsettings) | array | Diagnostic settings to send NSG logs/metrics to Log Analytics, Event Hub, or Storage. |
| [`enableTelemetry`](#parameter-nsgdefinitionsapplicationgatewayenabletelemetry) | bool | Enable or disable usage telemetry for this module. Default: true. |
| [`flushConnection`](#parameter-nsgdefinitionsapplicationgatewayflushconnection) | bool | When true, flows created from NSG connections are re-evaluated when rules are updated. Default: false. |
| [`location`](#parameter-nsgdefinitionsapplicationgatewaylocation) | string | Azure region for the NSG. Defaults to the resource group location. |
| [`lock`](#parameter-nsgdefinitionsapplicationgatewaylock) | object | Management lock configuration for the NSG. |
| [`roleAssignments`](#parameter-nsgdefinitionsapplicationgatewayroleassignments) | array | Role assignments to apply on the NSG. |
| [`securityRules`](#parameter-nsgdefinitionsapplicationgatewaysecurityrules) | array | Security rules to apply to the NSG. If omitted, only default rules are present. |
| [`tags`](#parameter-nsgdefinitionsapplicationgatewaytags) | object | Tags to apply to the NSG. |

### Parameter: `nsgDefinitions.applicationGateway.name`

Name of the Network Security Group.

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.diagnosticSettings`

Diagnostic settings to send NSG logs/metrics to Log Analytics, Event Hub, or Storage.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`eventHubAuthorizationRuleResourceId`](#parameter-nsgdefinitionsapplicationgatewaydiagnosticsettingseventhubauthorizationruleresourceid) | string | Destination Event Hub authorization rule resource ID. |
| [`eventHubName`](#parameter-nsgdefinitionsapplicationgatewaydiagnosticsettingseventhubname) | string | Destination Event Hub name when sending to Event Hub. |
| [`logAnalyticsDestinationType`](#parameter-nsgdefinitionsapplicationgatewaydiagnosticsettingsloganalyticsdestinationtype) | string | Destination type for Log Analytics (AzureDiagnostics or Dedicated). |
| [`logCategoriesAndGroups`](#parameter-nsgdefinitionsapplicationgatewaydiagnosticsettingslogcategoriesandgroups) | array | List of categories and/or category groups to enable. |
| [`marketplacePartnerResourceId`](#parameter-nsgdefinitionsapplicationgatewaydiagnosticsettingsmarketplacepartnerresourceid) | string | Marketplace partner destination resource ID (if applicable). |
| [`name`](#parameter-nsgdefinitionsapplicationgatewaydiagnosticsettingsname) | string | Name of the diagnostic settings resource. |
| [`storageAccountResourceId`](#parameter-nsgdefinitionsapplicationgatewaydiagnosticsettingsstorageaccountresourceid) | string | Destination Storage Account resource ID. |
| [`workspaceResourceId`](#parameter-nsgdefinitionsapplicationgatewaydiagnosticsettingsworkspaceresourceid) | string | Destination Log Analytics workspace resource ID. |

### Parameter: `nsgDefinitions.applicationGateway.diagnosticSettings.eventHubAuthorizationRuleResourceId`

Destination Event Hub authorization rule resource ID.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.diagnosticSettings.eventHubName`

Destination Event Hub name when sending to Event Hub.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.diagnosticSettings.logAnalyticsDestinationType`

Destination type for Log Analytics (AzureDiagnostics or Dedicated).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'AzureDiagnostics'
    'Dedicated'
  ]
  ```

### Parameter: `nsgDefinitions.applicationGateway.diagnosticSettings.logCategoriesAndGroups`

List of categories and/or category groups to enable.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-nsgdefinitionsapplicationgatewaydiagnosticsettingslogcategoriesandgroupscategory) | string | Single diagnostic log category to enable. |
| [`categoryGroup`](#parameter-nsgdefinitionsapplicationgatewaydiagnosticsettingslogcategoriesandgroupscategorygroup) | string | Category group (e.g., AllMetrics) to enable. |
| [`enabled`](#parameter-nsgdefinitionsapplicationgatewaydiagnosticsettingslogcategoriesandgroupsenabled) | bool | Whether this category/category group is enabled. |

### Parameter: `nsgDefinitions.applicationGateway.diagnosticSettings.logCategoriesAndGroups.category`

Single diagnostic log category to enable.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.diagnosticSettings.logCategoriesAndGroups.categoryGroup`

Category group (e.g., AllMetrics) to enable.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.diagnosticSettings.logCategoriesAndGroups.enabled`

Whether this category/category group is enabled.

- Required: No
- Type: bool

### Parameter: `nsgDefinitions.applicationGateway.diagnosticSettings.marketplacePartnerResourceId`

Marketplace partner destination resource ID (if applicable).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.diagnosticSettings.name`

Name of the diagnostic settings resource.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.diagnosticSettings.storageAccountResourceId`

Destination Storage Account resource ID.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.diagnosticSettings.workspaceResourceId`

Destination Log Analytics workspace resource ID.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.enableTelemetry`

Enable or disable usage telemetry for this module. Default: true.

- Required: No
- Type: bool

### Parameter: `nsgDefinitions.applicationGateway.flushConnection`

When true, flows created from NSG connections are re-evaluated when rules are updated. Default: false.

- Required: No
- Type: bool

### Parameter: `nsgDefinitions.applicationGateway.location`

Azure region for the NSG. Defaults to the resource group location.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.lock`

Management lock configuration for the NSG.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-nsgdefinitionsapplicationgatewaylockkind) | string | Lock type (None, CanNotDelete, or ReadOnly). |
| [`name`](#parameter-nsgdefinitionsapplicationgatewaylockname) | string | Name of the management lock. |
| [`notes`](#parameter-nsgdefinitionsapplicationgatewaylocknotes) | string | Notes describing the reason for the lock. |

### Parameter: `nsgDefinitions.applicationGateway.lock.kind`

Lock type (None, CanNotDelete, or ReadOnly).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `nsgDefinitions.applicationGateway.lock.name`

Name of the management lock.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.lock.notes`

Notes describing the reason for the lock.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.roleAssignments`

Role assignments to apply on the NSG.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-nsgdefinitionsapplicationgatewayroleassignmentsprincipalid) | string | Principal (object) ID for the assignment. |
| [`roleDefinitionIdOrName`](#parameter-nsgdefinitionsapplicationgatewayroleassignmentsroledefinitionidorname) | string | Role to assign (name, GUID, or fully qualified role definition ID). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-nsgdefinitionsapplicationgatewayroleassignmentscondition) | string | Advanced condition expression for the assignment. |
| [`conditionVersion`](#parameter-nsgdefinitionsapplicationgatewayroleassignmentsconditionversion) | string | Condition version. Use 2.0 when condition is provided. |
| [`delegatedManagedIdentityResourceId`](#parameter-nsgdefinitionsapplicationgatewayroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID (for cross-tenant scenarios). |
| [`description`](#parameter-nsgdefinitionsapplicationgatewayroleassignmentsdescription) | string | Description for the role assignment. |
| [`name`](#parameter-nsgdefinitionsapplicationgatewayroleassignmentsname) | string | Stable GUID name of the role assignment (omit to auto-generate). |
| [`principalType`](#parameter-nsgdefinitionsapplicationgatewayroleassignmentsprincipaltype) | string | Principal type for the assignment. |

### Parameter: `nsgDefinitions.applicationGateway.roleAssignments.principalId`

Principal (object) ID for the assignment.

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.roleAssignments.roleDefinitionIdOrName`

Role to assign (name, GUID, or fully qualified role definition ID).

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.roleAssignments.condition`

Advanced condition expression for the assignment.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.roleAssignments.conditionVersion`

Condition version. Use 2.0 when condition is provided.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `nsgDefinitions.applicationGateway.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID (for cross-tenant scenarios).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.roleAssignments.description`

Description for the role assignment.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.roleAssignments.name`

Stable GUID name of the role assignment (omit to auto-generate).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.roleAssignments.principalType`

Principal type for the assignment.

- Required: No
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

### Parameter: `nsgDefinitions.applicationGateway.securityRules`

Security rules to apply to the NSG. If omitted, only default rules are present.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-nsgdefinitionsapplicationgatewaysecurityrulesname) | string | Name of the security rule. |
| [`properties`](#parameter-nsgdefinitionsapplicationgatewaysecurityrulesproperties) | object | Properties that define the behavior of the security rule. |

### Parameter: `nsgDefinitions.applicationGateway.securityRules.name`

Name of the security rule.

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.securityRules.properties`

Properties that define the behavior of the security rule.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`access`](#parameter-nsgdefinitionsapplicationgatewaysecurityrulespropertiesaccess) | string | Whether matching traffic is allowed or denied. |
| [`direction`](#parameter-nsgdefinitionsapplicationgatewaysecurityrulespropertiesdirection) | string | Direction of the rule (Inbound or Outbound). |
| [`priority`](#parameter-nsgdefinitionsapplicationgatewaysecurityrulespropertiespriority) | int | Priority of the rule (100–4096). Must be unique per rule in the NSG. |
| [`protocol`](#parameter-nsgdefinitionsapplicationgatewaysecurityrulespropertiesprotocol) | string | Network protocol to match. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`description`](#parameter-nsgdefinitionsapplicationgatewaysecurityrulespropertiesdescription) | string | Free-form description for the rule. |
| [`destinationAddressPrefix`](#parameter-nsgdefinitionsapplicationgatewaysecurityrulespropertiesdestinationaddressprefix) | string | Single destination address prefix (e.g., 10.0.0.0/24, VirtualNetwork). |
| [`destinationAddressPrefixes`](#parameter-nsgdefinitionsapplicationgatewaysecurityrulespropertiesdestinationaddressprefixes) | array | Multiple destination address prefixes. |
| [`destinationApplicationSecurityGroupResourceIds`](#parameter-nsgdefinitionsapplicationgatewaysecurityrulespropertiesdestinationapplicationsecuritygroupresourceids) | array | Destination Application Security Group (ASG) resource IDs. |
| [`destinationPortRange`](#parameter-nsgdefinitionsapplicationgatewaysecurityrulespropertiesdestinationportrange) | string | Single destination port or port range (e.g., 443, 1000-2000). |
| [`destinationPortRanges`](#parameter-nsgdefinitionsapplicationgatewaysecurityrulespropertiesdestinationportranges) | array | Multiple destination ports or port ranges. |
| [`sourceAddressPrefix`](#parameter-nsgdefinitionsapplicationgatewaysecurityrulespropertiessourceaddressprefix) | string | Single source address prefix (e.g., Internet, 10.0.0.0/24). |
| [`sourceAddressPrefixes`](#parameter-nsgdefinitionsapplicationgatewaysecurityrulespropertiessourceaddressprefixes) | array | Multiple source address prefixes. |
| [`sourceApplicationSecurityGroupResourceIds`](#parameter-nsgdefinitionsapplicationgatewaysecurityrulespropertiessourceapplicationsecuritygroupresourceids) | array | Source Application Security Group (ASG) resource IDs. |
| [`sourcePortRange`](#parameter-nsgdefinitionsapplicationgatewaysecurityrulespropertiessourceportrange) | string | Single source port or port range. |
| [`sourcePortRanges`](#parameter-nsgdefinitionsapplicationgatewaysecurityrulespropertiessourceportranges) | array | Multiple source ports or port ranges. |

### Parameter: `nsgDefinitions.applicationGateway.securityRules.properties.access`

Whether matching traffic is allowed or denied.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Allow'
    'Deny'
  ]
  ```

### Parameter: `nsgDefinitions.applicationGateway.securityRules.properties.direction`

Direction of the rule (Inbound or Outbound).

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Inbound'
    'Outbound'
  ]
  ```

### Parameter: `nsgDefinitions.applicationGateway.securityRules.properties.priority`

Priority of the rule (100–4096). Must be unique per rule in the NSG.

- Required: Yes
- Type: int

### Parameter: `nsgDefinitions.applicationGateway.securityRules.properties.protocol`

Network protocol to match.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    '*'
    'Ah'
    'Esp'
    'Icmp'
    'Tcp'
    'Udp'
  ]
  ```

### Parameter: `nsgDefinitions.applicationGateway.securityRules.properties.description`

Free-form description for the rule.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.securityRules.properties.destinationAddressPrefix`

Single destination address prefix (e.g., 10.0.0.0/24, VirtualNetwork).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.securityRules.properties.destinationAddressPrefixes`

Multiple destination address prefixes.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.applicationGateway.securityRules.properties.destinationApplicationSecurityGroupResourceIds`

Destination Application Security Group (ASG) resource IDs.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.applicationGateway.securityRules.properties.destinationPortRange`

Single destination port or port range (e.g., 443, 1000-2000).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.securityRules.properties.destinationPortRanges`

Multiple destination ports or port ranges.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.applicationGateway.securityRules.properties.sourceAddressPrefix`

Single source address prefix (e.g., Internet, 10.0.0.0/24).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.securityRules.properties.sourceAddressPrefixes`

Multiple source address prefixes.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.applicationGateway.securityRules.properties.sourceApplicationSecurityGroupResourceIds`

Source Application Security Group (ASG) resource IDs.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.applicationGateway.securityRules.properties.sourcePortRange`

Single source port or port range.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.applicationGateway.securityRules.properties.sourcePortRanges`

Multiple source ports or port ranges.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.applicationGateway.tags`

Tags to apply to the NSG.

- Required: No
- Type: object

### Parameter: `nsgDefinitions.devopsBuildAgents`

NSG definition applied to the DevOps build agents subnet.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-nsgdefinitionsdevopsbuildagentsname) | string | Name of the Network Security Group. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`diagnosticSettings`](#parameter-nsgdefinitionsdevopsbuildagentsdiagnosticsettings) | array | Diagnostic settings to send NSG logs/metrics to Log Analytics, Event Hub, or Storage. |
| [`enableTelemetry`](#parameter-nsgdefinitionsdevopsbuildagentsenabletelemetry) | bool | Enable or disable usage telemetry for this module. Default: true. |
| [`flushConnection`](#parameter-nsgdefinitionsdevopsbuildagentsflushconnection) | bool | When true, flows created from NSG connections are re-evaluated when rules are updated. Default: false. |
| [`location`](#parameter-nsgdefinitionsdevopsbuildagentslocation) | string | Azure region for the NSG. Defaults to the resource group location. |
| [`lock`](#parameter-nsgdefinitionsdevopsbuildagentslock) | object | Management lock configuration for the NSG. |
| [`roleAssignments`](#parameter-nsgdefinitionsdevopsbuildagentsroleassignments) | array | Role assignments to apply on the NSG. |
| [`securityRules`](#parameter-nsgdefinitionsdevopsbuildagentssecurityrules) | array | Security rules to apply to the NSG. If omitted, only default rules are present. |
| [`tags`](#parameter-nsgdefinitionsdevopsbuildagentstags) | object | Tags to apply to the NSG. |

### Parameter: `nsgDefinitions.devopsBuildAgents.name`

Name of the Network Security Group.

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.diagnosticSettings`

Diagnostic settings to send NSG logs/metrics to Log Analytics, Event Hub, or Storage.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`eventHubAuthorizationRuleResourceId`](#parameter-nsgdefinitionsdevopsbuildagentsdiagnosticsettingseventhubauthorizationruleresourceid) | string | Destination Event Hub authorization rule resource ID. |
| [`eventHubName`](#parameter-nsgdefinitionsdevopsbuildagentsdiagnosticsettingseventhubname) | string | Destination Event Hub name when sending to Event Hub. |
| [`logAnalyticsDestinationType`](#parameter-nsgdefinitionsdevopsbuildagentsdiagnosticsettingsloganalyticsdestinationtype) | string | Destination type for Log Analytics (AzureDiagnostics or Dedicated). |
| [`logCategoriesAndGroups`](#parameter-nsgdefinitionsdevopsbuildagentsdiagnosticsettingslogcategoriesandgroups) | array | List of categories and/or category groups to enable. |
| [`marketplacePartnerResourceId`](#parameter-nsgdefinitionsdevopsbuildagentsdiagnosticsettingsmarketplacepartnerresourceid) | string | Marketplace partner destination resource ID (if applicable). |
| [`name`](#parameter-nsgdefinitionsdevopsbuildagentsdiagnosticsettingsname) | string | Name of the diagnostic settings resource. |
| [`storageAccountResourceId`](#parameter-nsgdefinitionsdevopsbuildagentsdiagnosticsettingsstorageaccountresourceid) | string | Destination Storage Account resource ID. |
| [`workspaceResourceId`](#parameter-nsgdefinitionsdevopsbuildagentsdiagnosticsettingsworkspaceresourceid) | string | Destination Log Analytics workspace resource ID. |

### Parameter: `nsgDefinitions.devopsBuildAgents.diagnosticSettings.eventHubAuthorizationRuleResourceId`

Destination Event Hub authorization rule resource ID.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.diagnosticSettings.eventHubName`

Destination Event Hub name when sending to Event Hub.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.diagnosticSettings.logAnalyticsDestinationType`

Destination type for Log Analytics (AzureDiagnostics or Dedicated).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'AzureDiagnostics'
    'Dedicated'
  ]
  ```

### Parameter: `nsgDefinitions.devopsBuildAgents.diagnosticSettings.logCategoriesAndGroups`

List of categories and/or category groups to enable.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-nsgdefinitionsdevopsbuildagentsdiagnosticsettingslogcategoriesandgroupscategory) | string | Single diagnostic log category to enable. |
| [`categoryGroup`](#parameter-nsgdefinitionsdevopsbuildagentsdiagnosticsettingslogcategoriesandgroupscategorygroup) | string | Category group (e.g., AllMetrics) to enable. |
| [`enabled`](#parameter-nsgdefinitionsdevopsbuildagentsdiagnosticsettingslogcategoriesandgroupsenabled) | bool | Whether this category/category group is enabled. |

### Parameter: `nsgDefinitions.devopsBuildAgents.diagnosticSettings.logCategoriesAndGroups.category`

Single diagnostic log category to enable.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.diagnosticSettings.logCategoriesAndGroups.categoryGroup`

Category group (e.g., AllMetrics) to enable.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.diagnosticSettings.logCategoriesAndGroups.enabled`

Whether this category/category group is enabled.

- Required: No
- Type: bool

### Parameter: `nsgDefinitions.devopsBuildAgents.diagnosticSettings.marketplacePartnerResourceId`

Marketplace partner destination resource ID (if applicable).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.diagnosticSettings.name`

Name of the diagnostic settings resource.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.diagnosticSettings.storageAccountResourceId`

Destination Storage Account resource ID.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.diagnosticSettings.workspaceResourceId`

Destination Log Analytics workspace resource ID.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.enableTelemetry`

Enable or disable usage telemetry for this module. Default: true.

- Required: No
- Type: bool

### Parameter: `nsgDefinitions.devopsBuildAgents.flushConnection`

When true, flows created from NSG connections are re-evaluated when rules are updated. Default: false.

- Required: No
- Type: bool

### Parameter: `nsgDefinitions.devopsBuildAgents.location`

Azure region for the NSG. Defaults to the resource group location.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.lock`

Management lock configuration for the NSG.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-nsgdefinitionsdevopsbuildagentslockkind) | string | Lock type (None, CanNotDelete, or ReadOnly). |
| [`name`](#parameter-nsgdefinitionsdevopsbuildagentslockname) | string | Name of the management lock. |
| [`notes`](#parameter-nsgdefinitionsdevopsbuildagentslocknotes) | string | Notes describing the reason for the lock. |

### Parameter: `nsgDefinitions.devopsBuildAgents.lock.kind`

Lock type (None, CanNotDelete, or ReadOnly).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `nsgDefinitions.devopsBuildAgents.lock.name`

Name of the management lock.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.lock.notes`

Notes describing the reason for the lock.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.roleAssignments`

Role assignments to apply on the NSG.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-nsgdefinitionsdevopsbuildagentsroleassignmentsprincipalid) | string | Principal (object) ID for the assignment. |
| [`roleDefinitionIdOrName`](#parameter-nsgdefinitionsdevopsbuildagentsroleassignmentsroledefinitionidorname) | string | Role to assign (name, GUID, or fully qualified role definition ID). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-nsgdefinitionsdevopsbuildagentsroleassignmentscondition) | string | Advanced condition expression for the assignment. |
| [`conditionVersion`](#parameter-nsgdefinitionsdevopsbuildagentsroleassignmentsconditionversion) | string | Condition version. Use 2.0 when condition is provided. |
| [`delegatedManagedIdentityResourceId`](#parameter-nsgdefinitionsdevopsbuildagentsroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID (for cross-tenant scenarios). |
| [`description`](#parameter-nsgdefinitionsdevopsbuildagentsroleassignmentsdescription) | string | Description for the role assignment. |
| [`name`](#parameter-nsgdefinitionsdevopsbuildagentsroleassignmentsname) | string | Stable GUID name of the role assignment (omit to auto-generate). |
| [`principalType`](#parameter-nsgdefinitionsdevopsbuildagentsroleassignmentsprincipaltype) | string | Principal type for the assignment. |

### Parameter: `nsgDefinitions.devopsBuildAgents.roleAssignments.principalId`

Principal (object) ID for the assignment.

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.roleAssignments.roleDefinitionIdOrName`

Role to assign (name, GUID, or fully qualified role definition ID).

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.roleAssignments.condition`

Advanced condition expression for the assignment.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.roleAssignments.conditionVersion`

Condition version. Use 2.0 when condition is provided.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `nsgDefinitions.devopsBuildAgents.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID (for cross-tenant scenarios).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.roleAssignments.description`

Description for the role assignment.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.roleAssignments.name`

Stable GUID name of the role assignment (omit to auto-generate).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.roleAssignments.principalType`

Principal type for the assignment.

- Required: No
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

### Parameter: `nsgDefinitions.devopsBuildAgents.securityRules`

Security rules to apply to the NSG. If omitted, only default rules are present.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-nsgdefinitionsdevopsbuildagentssecurityrulesname) | string | Name of the security rule. |
| [`properties`](#parameter-nsgdefinitionsdevopsbuildagentssecurityrulesproperties) | object | Properties that define the behavior of the security rule. |

### Parameter: `nsgDefinitions.devopsBuildAgents.securityRules.name`

Name of the security rule.

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.securityRules.properties`

Properties that define the behavior of the security rule.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`access`](#parameter-nsgdefinitionsdevopsbuildagentssecurityrulespropertiesaccess) | string | Whether matching traffic is allowed or denied. |
| [`direction`](#parameter-nsgdefinitionsdevopsbuildagentssecurityrulespropertiesdirection) | string | Direction of the rule (Inbound or Outbound). |
| [`priority`](#parameter-nsgdefinitionsdevopsbuildagentssecurityrulespropertiespriority) | int | Priority of the rule (100–4096). Must be unique per rule in the NSG. |
| [`protocol`](#parameter-nsgdefinitionsdevopsbuildagentssecurityrulespropertiesprotocol) | string | Network protocol to match. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`description`](#parameter-nsgdefinitionsdevopsbuildagentssecurityrulespropertiesdescription) | string | Free-form description for the rule. |
| [`destinationAddressPrefix`](#parameter-nsgdefinitionsdevopsbuildagentssecurityrulespropertiesdestinationaddressprefix) | string | Single destination address prefix (e.g., 10.0.0.0/24, VirtualNetwork). |
| [`destinationAddressPrefixes`](#parameter-nsgdefinitionsdevopsbuildagentssecurityrulespropertiesdestinationaddressprefixes) | array | Multiple destination address prefixes. |
| [`destinationApplicationSecurityGroupResourceIds`](#parameter-nsgdefinitionsdevopsbuildagentssecurityrulespropertiesdestinationapplicationsecuritygroupresourceids) | array | Destination Application Security Group (ASG) resource IDs. |
| [`destinationPortRange`](#parameter-nsgdefinitionsdevopsbuildagentssecurityrulespropertiesdestinationportrange) | string | Single destination port or port range (e.g., 443, 1000-2000). |
| [`destinationPortRanges`](#parameter-nsgdefinitionsdevopsbuildagentssecurityrulespropertiesdestinationportranges) | array | Multiple destination ports or port ranges. |
| [`sourceAddressPrefix`](#parameter-nsgdefinitionsdevopsbuildagentssecurityrulespropertiessourceaddressprefix) | string | Single source address prefix (e.g., Internet, 10.0.0.0/24). |
| [`sourceAddressPrefixes`](#parameter-nsgdefinitionsdevopsbuildagentssecurityrulespropertiessourceaddressprefixes) | array | Multiple source address prefixes. |
| [`sourceApplicationSecurityGroupResourceIds`](#parameter-nsgdefinitionsdevopsbuildagentssecurityrulespropertiessourceapplicationsecuritygroupresourceids) | array | Source Application Security Group (ASG) resource IDs. |
| [`sourcePortRange`](#parameter-nsgdefinitionsdevopsbuildagentssecurityrulespropertiessourceportrange) | string | Single source port or port range. |
| [`sourcePortRanges`](#parameter-nsgdefinitionsdevopsbuildagentssecurityrulespropertiessourceportranges) | array | Multiple source ports or port ranges. |

### Parameter: `nsgDefinitions.devopsBuildAgents.securityRules.properties.access`

Whether matching traffic is allowed or denied.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Allow'
    'Deny'
  ]
  ```

### Parameter: `nsgDefinitions.devopsBuildAgents.securityRules.properties.direction`

Direction of the rule (Inbound or Outbound).

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Inbound'
    'Outbound'
  ]
  ```

### Parameter: `nsgDefinitions.devopsBuildAgents.securityRules.properties.priority`

Priority of the rule (100–4096). Must be unique per rule in the NSG.

- Required: Yes
- Type: int

### Parameter: `nsgDefinitions.devopsBuildAgents.securityRules.properties.protocol`

Network protocol to match.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    '*'
    'Ah'
    'Esp'
    'Icmp'
    'Tcp'
    'Udp'
  ]
  ```

### Parameter: `nsgDefinitions.devopsBuildAgents.securityRules.properties.description`

Free-form description for the rule.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.securityRules.properties.destinationAddressPrefix`

Single destination address prefix (e.g., 10.0.0.0/24, VirtualNetwork).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.securityRules.properties.destinationAddressPrefixes`

Multiple destination address prefixes.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.devopsBuildAgents.securityRules.properties.destinationApplicationSecurityGroupResourceIds`

Destination Application Security Group (ASG) resource IDs.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.devopsBuildAgents.securityRules.properties.destinationPortRange`

Single destination port or port range (e.g., 443, 1000-2000).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.securityRules.properties.destinationPortRanges`

Multiple destination ports or port ranges.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.devopsBuildAgents.securityRules.properties.sourceAddressPrefix`

Single source address prefix (e.g., Internet, 10.0.0.0/24).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.securityRules.properties.sourceAddressPrefixes`

Multiple source address prefixes.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.devopsBuildAgents.securityRules.properties.sourceApplicationSecurityGroupResourceIds`

Source Application Security Group (ASG) resource IDs.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.devopsBuildAgents.securityRules.properties.sourcePortRange`

Single source port or port range.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.devopsBuildAgents.securityRules.properties.sourcePortRanges`

Multiple source ports or port ranges.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.devopsBuildAgents.tags`

Tags to apply to the NSG.

- Required: No
- Type: object

### Parameter: `nsgDefinitions.jumpbox`

NSG definition applied to the jumpbox (bastion-accessed) subnet.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-nsgdefinitionsjumpboxname) | string | Name of the Network Security Group. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`diagnosticSettings`](#parameter-nsgdefinitionsjumpboxdiagnosticsettings) | array | Diagnostic settings to send NSG logs/metrics to Log Analytics, Event Hub, or Storage. |
| [`enableTelemetry`](#parameter-nsgdefinitionsjumpboxenabletelemetry) | bool | Enable or disable usage telemetry for this module. Default: true. |
| [`flushConnection`](#parameter-nsgdefinitionsjumpboxflushconnection) | bool | When true, flows created from NSG connections are re-evaluated when rules are updated. Default: false. |
| [`location`](#parameter-nsgdefinitionsjumpboxlocation) | string | Azure region for the NSG. Defaults to the resource group location. |
| [`lock`](#parameter-nsgdefinitionsjumpboxlock) | object | Management lock configuration for the NSG. |
| [`roleAssignments`](#parameter-nsgdefinitionsjumpboxroleassignments) | array | Role assignments to apply on the NSG. |
| [`securityRules`](#parameter-nsgdefinitionsjumpboxsecurityrules) | array | Security rules to apply to the NSG. If omitted, only default rules are present. |
| [`tags`](#parameter-nsgdefinitionsjumpboxtags) | object | Tags to apply to the NSG. |

### Parameter: `nsgDefinitions.jumpbox.name`

Name of the Network Security Group.

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.jumpbox.diagnosticSettings`

Diagnostic settings to send NSG logs/metrics to Log Analytics, Event Hub, or Storage.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`eventHubAuthorizationRuleResourceId`](#parameter-nsgdefinitionsjumpboxdiagnosticsettingseventhubauthorizationruleresourceid) | string | Destination Event Hub authorization rule resource ID. |
| [`eventHubName`](#parameter-nsgdefinitionsjumpboxdiagnosticsettingseventhubname) | string | Destination Event Hub name when sending to Event Hub. |
| [`logAnalyticsDestinationType`](#parameter-nsgdefinitionsjumpboxdiagnosticsettingsloganalyticsdestinationtype) | string | Destination type for Log Analytics (AzureDiagnostics or Dedicated). |
| [`logCategoriesAndGroups`](#parameter-nsgdefinitionsjumpboxdiagnosticsettingslogcategoriesandgroups) | array | List of categories and/or category groups to enable. |
| [`marketplacePartnerResourceId`](#parameter-nsgdefinitionsjumpboxdiagnosticsettingsmarketplacepartnerresourceid) | string | Marketplace partner destination resource ID (if applicable). |
| [`name`](#parameter-nsgdefinitionsjumpboxdiagnosticsettingsname) | string | Name of the diagnostic settings resource. |
| [`storageAccountResourceId`](#parameter-nsgdefinitionsjumpboxdiagnosticsettingsstorageaccountresourceid) | string | Destination Storage Account resource ID. |
| [`workspaceResourceId`](#parameter-nsgdefinitionsjumpboxdiagnosticsettingsworkspaceresourceid) | string | Destination Log Analytics workspace resource ID. |

### Parameter: `nsgDefinitions.jumpbox.diagnosticSettings.eventHubAuthorizationRuleResourceId`

Destination Event Hub authorization rule resource ID.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.jumpbox.diagnosticSettings.eventHubName`

Destination Event Hub name when sending to Event Hub.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.jumpbox.diagnosticSettings.logAnalyticsDestinationType`

Destination type for Log Analytics (AzureDiagnostics or Dedicated).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'AzureDiagnostics'
    'Dedicated'
  ]
  ```

### Parameter: `nsgDefinitions.jumpbox.diagnosticSettings.logCategoriesAndGroups`

List of categories and/or category groups to enable.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-nsgdefinitionsjumpboxdiagnosticsettingslogcategoriesandgroupscategory) | string | Single diagnostic log category to enable. |
| [`categoryGroup`](#parameter-nsgdefinitionsjumpboxdiagnosticsettingslogcategoriesandgroupscategorygroup) | string | Category group (e.g., AllMetrics) to enable. |
| [`enabled`](#parameter-nsgdefinitionsjumpboxdiagnosticsettingslogcategoriesandgroupsenabled) | bool | Whether this category/category group is enabled. |

### Parameter: `nsgDefinitions.jumpbox.diagnosticSettings.logCategoriesAndGroups.category`

Single diagnostic log category to enable.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.jumpbox.diagnosticSettings.logCategoriesAndGroups.categoryGroup`

Category group (e.g., AllMetrics) to enable.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.jumpbox.diagnosticSettings.logCategoriesAndGroups.enabled`

Whether this category/category group is enabled.

- Required: No
- Type: bool

### Parameter: `nsgDefinitions.jumpbox.diagnosticSettings.marketplacePartnerResourceId`

Marketplace partner destination resource ID (if applicable).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.jumpbox.diagnosticSettings.name`

Name of the diagnostic settings resource.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.jumpbox.diagnosticSettings.storageAccountResourceId`

Destination Storage Account resource ID.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.jumpbox.diagnosticSettings.workspaceResourceId`

Destination Log Analytics workspace resource ID.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.jumpbox.enableTelemetry`

Enable or disable usage telemetry for this module. Default: true.

- Required: No
- Type: bool

### Parameter: `nsgDefinitions.jumpbox.flushConnection`

When true, flows created from NSG connections are re-evaluated when rules are updated. Default: false.

- Required: No
- Type: bool

### Parameter: `nsgDefinitions.jumpbox.location`

Azure region for the NSG. Defaults to the resource group location.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.jumpbox.lock`

Management lock configuration for the NSG.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-nsgdefinitionsjumpboxlockkind) | string | Lock type (None, CanNotDelete, or ReadOnly). |
| [`name`](#parameter-nsgdefinitionsjumpboxlockname) | string | Name of the management lock. |
| [`notes`](#parameter-nsgdefinitionsjumpboxlocknotes) | string | Notes describing the reason for the lock. |

### Parameter: `nsgDefinitions.jumpbox.lock.kind`

Lock type (None, CanNotDelete, or ReadOnly).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `nsgDefinitions.jumpbox.lock.name`

Name of the management lock.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.jumpbox.lock.notes`

Notes describing the reason for the lock.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.jumpbox.roleAssignments`

Role assignments to apply on the NSG.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-nsgdefinitionsjumpboxroleassignmentsprincipalid) | string | Principal (object) ID for the assignment. |
| [`roleDefinitionIdOrName`](#parameter-nsgdefinitionsjumpboxroleassignmentsroledefinitionidorname) | string | Role to assign (name, GUID, or fully qualified role definition ID). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-nsgdefinitionsjumpboxroleassignmentscondition) | string | Advanced condition expression for the assignment. |
| [`conditionVersion`](#parameter-nsgdefinitionsjumpboxroleassignmentsconditionversion) | string | Condition version. Use 2.0 when condition is provided. |
| [`delegatedManagedIdentityResourceId`](#parameter-nsgdefinitionsjumpboxroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID (for cross-tenant scenarios). |
| [`description`](#parameter-nsgdefinitionsjumpboxroleassignmentsdescription) | string | Description for the role assignment. |
| [`name`](#parameter-nsgdefinitionsjumpboxroleassignmentsname) | string | Stable GUID name of the role assignment (omit to auto-generate). |
| [`principalType`](#parameter-nsgdefinitionsjumpboxroleassignmentsprincipaltype) | string | Principal type for the assignment. |

### Parameter: `nsgDefinitions.jumpbox.roleAssignments.principalId`

Principal (object) ID for the assignment.

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.jumpbox.roleAssignments.roleDefinitionIdOrName`

Role to assign (name, GUID, or fully qualified role definition ID).

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.jumpbox.roleAssignments.condition`

Advanced condition expression for the assignment.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.jumpbox.roleAssignments.conditionVersion`

Condition version. Use 2.0 when condition is provided.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `nsgDefinitions.jumpbox.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID (for cross-tenant scenarios).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.jumpbox.roleAssignments.description`

Description for the role assignment.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.jumpbox.roleAssignments.name`

Stable GUID name of the role assignment (omit to auto-generate).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.jumpbox.roleAssignments.principalType`

Principal type for the assignment.

- Required: No
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

### Parameter: `nsgDefinitions.jumpbox.securityRules`

Security rules to apply to the NSG. If omitted, only default rules are present.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-nsgdefinitionsjumpboxsecurityrulesname) | string | Name of the security rule. |
| [`properties`](#parameter-nsgdefinitionsjumpboxsecurityrulesproperties) | object | Properties that define the behavior of the security rule. |

### Parameter: `nsgDefinitions.jumpbox.securityRules.name`

Name of the security rule.

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.jumpbox.securityRules.properties`

Properties that define the behavior of the security rule.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`access`](#parameter-nsgdefinitionsjumpboxsecurityrulespropertiesaccess) | string | Whether matching traffic is allowed or denied. |
| [`direction`](#parameter-nsgdefinitionsjumpboxsecurityrulespropertiesdirection) | string | Direction of the rule (Inbound or Outbound). |
| [`priority`](#parameter-nsgdefinitionsjumpboxsecurityrulespropertiespriority) | int | Priority of the rule (100–4096). Must be unique per rule in the NSG. |
| [`protocol`](#parameter-nsgdefinitionsjumpboxsecurityrulespropertiesprotocol) | string | Network protocol to match. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`description`](#parameter-nsgdefinitionsjumpboxsecurityrulespropertiesdescription) | string | Free-form description for the rule. |
| [`destinationAddressPrefix`](#parameter-nsgdefinitionsjumpboxsecurityrulespropertiesdestinationaddressprefix) | string | Single destination address prefix (e.g., 10.0.0.0/24, VirtualNetwork). |
| [`destinationAddressPrefixes`](#parameter-nsgdefinitionsjumpboxsecurityrulespropertiesdestinationaddressprefixes) | array | Multiple destination address prefixes. |
| [`destinationApplicationSecurityGroupResourceIds`](#parameter-nsgdefinitionsjumpboxsecurityrulespropertiesdestinationapplicationsecuritygroupresourceids) | array | Destination Application Security Group (ASG) resource IDs. |
| [`destinationPortRange`](#parameter-nsgdefinitionsjumpboxsecurityrulespropertiesdestinationportrange) | string | Single destination port or port range (e.g., 443, 1000-2000). |
| [`destinationPortRanges`](#parameter-nsgdefinitionsjumpboxsecurityrulespropertiesdestinationportranges) | array | Multiple destination ports or port ranges. |
| [`sourceAddressPrefix`](#parameter-nsgdefinitionsjumpboxsecurityrulespropertiessourceaddressprefix) | string | Single source address prefix (e.g., Internet, 10.0.0.0/24). |
| [`sourceAddressPrefixes`](#parameter-nsgdefinitionsjumpboxsecurityrulespropertiessourceaddressprefixes) | array | Multiple source address prefixes. |
| [`sourceApplicationSecurityGroupResourceIds`](#parameter-nsgdefinitionsjumpboxsecurityrulespropertiessourceapplicationsecuritygroupresourceids) | array | Source Application Security Group (ASG) resource IDs. |
| [`sourcePortRange`](#parameter-nsgdefinitionsjumpboxsecurityrulespropertiessourceportrange) | string | Single source port or port range. |
| [`sourcePortRanges`](#parameter-nsgdefinitionsjumpboxsecurityrulespropertiessourceportranges) | array | Multiple source ports or port ranges. |

### Parameter: `nsgDefinitions.jumpbox.securityRules.properties.access`

Whether matching traffic is allowed or denied.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Allow'
    'Deny'
  ]
  ```

### Parameter: `nsgDefinitions.jumpbox.securityRules.properties.direction`

Direction of the rule (Inbound or Outbound).

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Inbound'
    'Outbound'
  ]
  ```

### Parameter: `nsgDefinitions.jumpbox.securityRules.properties.priority`

Priority of the rule (100–4096). Must be unique per rule in the NSG.

- Required: Yes
- Type: int

### Parameter: `nsgDefinitions.jumpbox.securityRules.properties.protocol`

Network protocol to match.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    '*'
    'Ah'
    'Esp'
    'Icmp'
    'Tcp'
    'Udp'
  ]
  ```

### Parameter: `nsgDefinitions.jumpbox.securityRules.properties.description`

Free-form description for the rule.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.jumpbox.securityRules.properties.destinationAddressPrefix`

Single destination address prefix (e.g., 10.0.0.0/24, VirtualNetwork).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.jumpbox.securityRules.properties.destinationAddressPrefixes`

Multiple destination address prefixes.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.jumpbox.securityRules.properties.destinationApplicationSecurityGroupResourceIds`

Destination Application Security Group (ASG) resource IDs.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.jumpbox.securityRules.properties.destinationPortRange`

Single destination port or port range (e.g., 443, 1000-2000).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.jumpbox.securityRules.properties.destinationPortRanges`

Multiple destination ports or port ranges.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.jumpbox.securityRules.properties.sourceAddressPrefix`

Single source address prefix (e.g., Internet, 10.0.0.0/24).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.jumpbox.securityRules.properties.sourceAddressPrefixes`

Multiple source address prefixes.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.jumpbox.securityRules.properties.sourceApplicationSecurityGroupResourceIds`

Source Application Security Group (ASG) resource IDs.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.jumpbox.securityRules.properties.sourcePortRange`

Single source port or port range.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.jumpbox.securityRules.properties.sourcePortRanges`

Multiple source ports or port ranges.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.jumpbox.tags`

Tags to apply to the NSG.

- Required: No
- Type: object

### Parameter: `nsgDefinitions.pe`

NSG definition applied to the private endpoints (PE) subnet.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-nsgdefinitionspename) | string | Name of the Network Security Group. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`diagnosticSettings`](#parameter-nsgdefinitionspediagnosticsettings) | array | Diagnostic settings to send NSG logs/metrics to Log Analytics, Event Hub, or Storage. |
| [`enableTelemetry`](#parameter-nsgdefinitionspeenabletelemetry) | bool | Enable or disable usage telemetry for this module. Default: true. |
| [`flushConnection`](#parameter-nsgdefinitionspeflushconnection) | bool | When true, flows created from NSG connections are re-evaluated when rules are updated. Default: false. |
| [`location`](#parameter-nsgdefinitionspelocation) | string | Azure region for the NSG. Defaults to the resource group location. |
| [`lock`](#parameter-nsgdefinitionspelock) | object | Management lock configuration for the NSG. |
| [`roleAssignments`](#parameter-nsgdefinitionsperoleassignments) | array | Role assignments to apply on the NSG. |
| [`securityRules`](#parameter-nsgdefinitionspesecurityrules) | array | Security rules to apply to the NSG. If omitted, only default rules are present. |
| [`tags`](#parameter-nsgdefinitionspetags) | object | Tags to apply to the NSG. |

### Parameter: `nsgDefinitions.pe.name`

Name of the Network Security Group.

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.pe.diagnosticSettings`

Diagnostic settings to send NSG logs/metrics to Log Analytics, Event Hub, or Storage.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`eventHubAuthorizationRuleResourceId`](#parameter-nsgdefinitionspediagnosticsettingseventhubauthorizationruleresourceid) | string | Destination Event Hub authorization rule resource ID. |
| [`eventHubName`](#parameter-nsgdefinitionspediagnosticsettingseventhubname) | string | Destination Event Hub name when sending to Event Hub. |
| [`logAnalyticsDestinationType`](#parameter-nsgdefinitionspediagnosticsettingsloganalyticsdestinationtype) | string | Destination type for Log Analytics (AzureDiagnostics or Dedicated). |
| [`logCategoriesAndGroups`](#parameter-nsgdefinitionspediagnosticsettingslogcategoriesandgroups) | array | List of categories and/or category groups to enable. |
| [`marketplacePartnerResourceId`](#parameter-nsgdefinitionspediagnosticsettingsmarketplacepartnerresourceid) | string | Marketplace partner destination resource ID (if applicable). |
| [`name`](#parameter-nsgdefinitionspediagnosticsettingsname) | string | Name of the diagnostic settings resource. |
| [`storageAccountResourceId`](#parameter-nsgdefinitionspediagnosticsettingsstorageaccountresourceid) | string | Destination Storage Account resource ID. |
| [`workspaceResourceId`](#parameter-nsgdefinitionspediagnosticsettingsworkspaceresourceid) | string | Destination Log Analytics workspace resource ID. |

### Parameter: `nsgDefinitions.pe.diagnosticSettings.eventHubAuthorizationRuleResourceId`

Destination Event Hub authorization rule resource ID.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.pe.diagnosticSettings.eventHubName`

Destination Event Hub name when sending to Event Hub.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.pe.diagnosticSettings.logAnalyticsDestinationType`

Destination type for Log Analytics (AzureDiagnostics or Dedicated).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'AzureDiagnostics'
    'Dedicated'
  ]
  ```

### Parameter: `nsgDefinitions.pe.diagnosticSettings.logCategoriesAndGroups`

List of categories and/or category groups to enable.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-nsgdefinitionspediagnosticsettingslogcategoriesandgroupscategory) | string | Single diagnostic log category to enable. |
| [`categoryGroup`](#parameter-nsgdefinitionspediagnosticsettingslogcategoriesandgroupscategorygroup) | string | Category group (e.g., AllMetrics) to enable. |
| [`enabled`](#parameter-nsgdefinitionspediagnosticsettingslogcategoriesandgroupsenabled) | bool | Whether this category/category group is enabled. |

### Parameter: `nsgDefinitions.pe.diagnosticSettings.logCategoriesAndGroups.category`

Single diagnostic log category to enable.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.pe.diagnosticSettings.logCategoriesAndGroups.categoryGroup`

Category group (e.g., AllMetrics) to enable.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.pe.diagnosticSettings.logCategoriesAndGroups.enabled`

Whether this category/category group is enabled.

- Required: No
- Type: bool

### Parameter: `nsgDefinitions.pe.diagnosticSettings.marketplacePartnerResourceId`

Marketplace partner destination resource ID (if applicable).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.pe.diagnosticSettings.name`

Name of the diagnostic settings resource.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.pe.diagnosticSettings.storageAccountResourceId`

Destination Storage Account resource ID.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.pe.diagnosticSettings.workspaceResourceId`

Destination Log Analytics workspace resource ID.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.pe.enableTelemetry`

Enable or disable usage telemetry for this module. Default: true.

- Required: No
- Type: bool

### Parameter: `nsgDefinitions.pe.flushConnection`

When true, flows created from NSG connections are re-evaluated when rules are updated. Default: false.

- Required: No
- Type: bool

### Parameter: `nsgDefinitions.pe.location`

Azure region for the NSG. Defaults to the resource group location.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.pe.lock`

Management lock configuration for the NSG.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-nsgdefinitionspelockkind) | string | Lock type (None, CanNotDelete, or ReadOnly). |
| [`name`](#parameter-nsgdefinitionspelockname) | string | Name of the management lock. |
| [`notes`](#parameter-nsgdefinitionspelocknotes) | string | Notes describing the reason for the lock. |

### Parameter: `nsgDefinitions.pe.lock.kind`

Lock type (None, CanNotDelete, or ReadOnly).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `nsgDefinitions.pe.lock.name`

Name of the management lock.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.pe.lock.notes`

Notes describing the reason for the lock.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.pe.roleAssignments`

Role assignments to apply on the NSG.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-nsgdefinitionsperoleassignmentsprincipalid) | string | Principal (object) ID for the assignment. |
| [`roleDefinitionIdOrName`](#parameter-nsgdefinitionsperoleassignmentsroledefinitionidorname) | string | Role to assign (name, GUID, or fully qualified role definition ID). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-nsgdefinitionsperoleassignmentscondition) | string | Advanced condition expression for the assignment. |
| [`conditionVersion`](#parameter-nsgdefinitionsperoleassignmentsconditionversion) | string | Condition version. Use 2.0 when condition is provided. |
| [`delegatedManagedIdentityResourceId`](#parameter-nsgdefinitionsperoleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID (for cross-tenant scenarios). |
| [`description`](#parameter-nsgdefinitionsperoleassignmentsdescription) | string | Description for the role assignment. |
| [`name`](#parameter-nsgdefinitionsperoleassignmentsname) | string | Stable GUID name of the role assignment (omit to auto-generate). |
| [`principalType`](#parameter-nsgdefinitionsperoleassignmentsprincipaltype) | string | Principal type for the assignment. |

### Parameter: `nsgDefinitions.pe.roleAssignments.principalId`

Principal (object) ID for the assignment.

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.pe.roleAssignments.roleDefinitionIdOrName`

Role to assign (name, GUID, or fully qualified role definition ID).

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.pe.roleAssignments.condition`

Advanced condition expression for the assignment.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.pe.roleAssignments.conditionVersion`

Condition version. Use 2.0 when condition is provided.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `nsgDefinitions.pe.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID (for cross-tenant scenarios).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.pe.roleAssignments.description`

Description for the role assignment.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.pe.roleAssignments.name`

Stable GUID name of the role assignment (omit to auto-generate).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.pe.roleAssignments.principalType`

Principal type for the assignment.

- Required: No
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

### Parameter: `nsgDefinitions.pe.securityRules`

Security rules to apply to the NSG. If omitted, only default rules are present.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-nsgdefinitionspesecurityrulesname) | string | Name of the security rule. |
| [`properties`](#parameter-nsgdefinitionspesecurityrulesproperties) | object | Properties that define the behavior of the security rule. |

### Parameter: `nsgDefinitions.pe.securityRules.name`

Name of the security rule.

- Required: Yes
- Type: string

### Parameter: `nsgDefinitions.pe.securityRules.properties`

Properties that define the behavior of the security rule.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`access`](#parameter-nsgdefinitionspesecurityrulespropertiesaccess) | string | Whether matching traffic is allowed or denied. |
| [`direction`](#parameter-nsgdefinitionspesecurityrulespropertiesdirection) | string | Direction of the rule (Inbound or Outbound). |
| [`priority`](#parameter-nsgdefinitionspesecurityrulespropertiespriority) | int | Priority of the rule (100–4096). Must be unique per rule in the NSG. |
| [`protocol`](#parameter-nsgdefinitionspesecurityrulespropertiesprotocol) | string | Network protocol to match. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`description`](#parameter-nsgdefinitionspesecurityrulespropertiesdescription) | string | Free-form description for the rule. |
| [`destinationAddressPrefix`](#parameter-nsgdefinitionspesecurityrulespropertiesdestinationaddressprefix) | string | Single destination address prefix (e.g., 10.0.0.0/24, VirtualNetwork). |
| [`destinationAddressPrefixes`](#parameter-nsgdefinitionspesecurityrulespropertiesdestinationaddressprefixes) | array | Multiple destination address prefixes. |
| [`destinationApplicationSecurityGroupResourceIds`](#parameter-nsgdefinitionspesecurityrulespropertiesdestinationapplicationsecuritygroupresourceids) | array | Destination Application Security Group (ASG) resource IDs. |
| [`destinationPortRange`](#parameter-nsgdefinitionspesecurityrulespropertiesdestinationportrange) | string | Single destination port or port range (e.g., 443, 1000-2000). |
| [`destinationPortRanges`](#parameter-nsgdefinitionspesecurityrulespropertiesdestinationportranges) | array | Multiple destination ports or port ranges. |
| [`sourceAddressPrefix`](#parameter-nsgdefinitionspesecurityrulespropertiessourceaddressprefix) | string | Single source address prefix (e.g., Internet, 10.0.0.0/24). |
| [`sourceAddressPrefixes`](#parameter-nsgdefinitionspesecurityrulespropertiessourceaddressprefixes) | array | Multiple source address prefixes. |
| [`sourceApplicationSecurityGroupResourceIds`](#parameter-nsgdefinitionspesecurityrulespropertiessourceapplicationsecuritygroupresourceids) | array | Source Application Security Group (ASG) resource IDs. |
| [`sourcePortRange`](#parameter-nsgdefinitionspesecurityrulespropertiessourceportrange) | string | Single source port or port range. |
| [`sourcePortRanges`](#parameter-nsgdefinitionspesecurityrulespropertiessourceportranges) | array | Multiple source ports or port ranges. |

### Parameter: `nsgDefinitions.pe.securityRules.properties.access`

Whether matching traffic is allowed or denied.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Allow'
    'Deny'
  ]
  ```

### Parameter: `nsgDefinitions.pe.securityRules.properties.direction`

Direction of the rule (Inbound or Outbound).

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Inbound'
    'Outbound'
  ]
  ```

### Parameter: `nsgDefinitions.pe.securityRules.properties.priority`

Priority of the rule (100–4096). Must be unique per rule in the NSG.

- Required: Yes
- Type: int

### Parameter: `nsgDefinitions.pe.securityRules.properties.protocol`

Network protocol to match.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    '*'
    'Ah'
    'Esp'
    'Icmp'
    'Tcp'
    'Udp'
  ]
  ```

### Parameter: `nsgDefinitions.pe.securityRules.properties.description`

Free-form description for the rule.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.pe.securityRules.properties.destinationAddressPrefix`

Single destination address prefix (e.g., 10.0.0.0/24, VirtualNetwork).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.pe.securityRules.properties.destinationAddressPrefixes`

Multiple destination address prefixes.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.pe.securityRules.properties.destinationApplicationSecurityGroupResourceIds`

Destination Application Security Group (ASG) resource IDs.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.pe.securityRules.properties.destinationPortRange`

Single destination port or port range (e.g., 443, 1000-2000).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.pe.securityRules.properties.destinationPortRanges`

Multiple destination ports or port ranges.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.pe.securityRules.properties.sourceAddressPrefix`

Single source address prefix (e.g., Internet, 10.0.0.0/24).

- Required: No
- Type: string

### Parameter: `nsgDefinitions.pe.securityRules.properties.sourceAddressPrefixes`

Multiple source address prefixes.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.pe.securityRules.properties.sourceApplicationSecurityGroupResourceIds`

Source Application Security Group (ASG) resource IDs.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.pe.securityRules.properties.sourcePortRange`

Single source port or port range.

- Required: No
- Type: string

### Parameter: `nsgDefinitions.pe.securityRules.properties.sourcePortRanges`

Multiple source ports or port ranges.

- Required: No
- Type: array

### Parameter: `nsgDefinitions.pe.tags`

Tags to apply to the NSG.

- Required: No
- Type: object

### Parameter: `resourceIds`

 Existing resource IDs to reuse; leave empty to create new resources.

- Required: No
- Type: object
- Default:
  ```Bicep
  {
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
  ```

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`apimServiceResourceId`](#parameter-resourceidsapimserviceresourceid) | string | Existing API Management service resource ID to reuse. |
| [`appConfigResourceId`](#parameter-resourceidsappconfigresourceid) | string | Existing App Configuration store resource ID to reuse. |
| [`appInsightsResourceId`](#parameter-resourceidsappinsightsresourceid) | string | Existing Application Insights resource ID to reuse. |
| [`applicationGatewayResourceId`](#parameter-resourceidsapplicationgatewayresourceid) | string | Existing Application Gateway resource ID to reuse. |
| [`bastionHostResourceId`](#parameter-resourceidsbastionhostresourceid) | string | Existing Azure Bastion resource ID to reuse; leave empty to skip. |
| [`containerEnvResourceId`](#parameter-resourceidscontainerenvresourceid) | string | Existing Container Apps Environment resource ID to reuse. |
| [`containerRegistryResourceId`](#parameter-resourceidscontainerregistryresourceid) | string | Existing Azure Container Registry resource ID to reuse. |
| [`dbAccountResourceId`](#parameter-resourceidsdbaccountresourceid) | string | Existing Cosmos DB account resource ID to reuse. |
| [`firewallResourceId`](#parameter-resourceidsfirewallresourceid) | string | Existing Azure Firewall resource ID to reuse. |
| [`groundingServiceResourceId`](#parameter-resourceidsgroundingserviceresourceid) | string | Existing Grounding service resource ID to reuse. |
| [`keyVaultResourceId`](#parameter-resourceidskeyvaultresourceid) | string | Existing Key Vault resource ID to reuse. |
| [`logAnalyticsWorkspaceResourceId`](#parameter-resourceidsloganalyticsworkspaceresourceid) | string | Existing Log Analytics Workspace resource ID to reuse. |
| [`searchServiceResourceId`](#parameter-resourceidssearchserviceresourceid) | string | Existing Azure AI Search service resource ID to reuse. |
| [`storageAccountResourceId`](#parameter-resourceidsstorageaccountresourceid) | string | Existing Storage Account resource ID to reuse. |
| [`virtualNetworkResourceId`](#parameter-resourceidsvirtualnetworkresourceid) | string | Existing VNet resource ID to reuse; leave empty to create a new VNet. |

### Parameter: `resourceIds.apimServiceResourceId`

Existing API Management service resource ID to reuse.

- Required: No
- Type: string

### Parameter: `resourceIds.appConfigResourceId`

Existing App Configuration store resource ID to reuse.

- Required: No
- Type: string

### Parameter: `resourceIds.appInsightsResourceId`

Existing Application Insights resource ID to reuse.

- Required: No
- Type: string

### Parameter: `resourceIds.applicationGatewayResourceId`

Existing Application Gateway resource ID to reuse.

- Required: No
- Type: string

### Parameter: `resourceIds.bastionHostResourceId`

Existing Azure Bastion resource ID to reuse; leave empty to skip.

- Required: No
- Type: string

### Parameter: `resourceIds.containerEnvResourceId`

Existing Container Apps Environment resource ID to reuse.

- Required: No
- Type: string

### Parameter: `resourceIds.containerRegistryResourceId`

Existing Azure Container Registry resource ID to reuse.

- Required: No
- Type: string

### Parameter: `resourceIds.dbAccountResourceId`

Existing Cosmos DB account resource ID to reuse.

- Required: No
- Type: string

### Parameter: `resourceIds.firewallResourceId`

Existing Azure Firewall resource ID to reuse.

- Required: No
- Type: string

### Parameter: `resourceIds.groundingServiceResourceId`

Existing Grounding service resource ID to reuse.

- Required: No
- Type: string

### Parameter: `resourceIds.keyVaultResourceId`

Existing Key Vault resource ID to reuse.

- Required: No
- Type: string

### Parameter: `resourceIds.logAnalyticsWorkspaceResourceId`

Existing Log Analytics Workspace resource ID to reuse.

- Required: No
- Type: string

### Parameter: `resourceIds.searchServiceResourceId`

Existing Azure AI Search service resource ID to reuse.

- Required: No
- Type: string

### Parameter: `resourceIds.storageAccountResourceId`

Existing Storage Account resource ID to reuse.

- Required: No
- Type: string

### Parameter: `resourceIds.virtualNetworkResourceId`

Existing VNet resource ID to reuse; leave empty to create a new VNet.

- Required: No
- Type: string

### Parameter: `resourceToken`

 Deterministic token for resource names; auto-generated if not provided.

- Required: No
- Type: string
- Default: `[toLower(uniqueString(subscription().id, resourceGroup().name, parameters('location')))]`

### Parameter: `tags`

 Tags applied to all deployed resources.

- Required: No
- Type: object
- Default: `{}`

## Outputs

| Output | Type | Description |
| :-- | :-- | :-- |
| `apimServiceResourceId` | string | API Management service resource ID. |
| `appConfigResourceId` | string | App Configuration store resource ID. |
| `applicationGatewayResourceId` | string | Application Gateway resource ID. |
| `applicationInsightsResourceId` | string | Application Insights resource ID. |
| `containerEnvResourceId` | string | Container Apps Environment resource ID. |
| `containerRegistryResourceId` | string | Container registry resource ID. |
| `dbAccountResourceId` | string | Cosmos DB account resource ID. |
| `firewallResourceId` | string | Azure Firewall resource ID. |
| `groundingServiceResourceId` | string | Grounding (Bing Search) resource ID. |
| `keyVaultResourceId` | string | Key Vault resource ID. |
| `location` | string | Deployment location. |
| `logAnalyticsWorkspaceResourceId` | string | Log Analytics workspace resource ID. |
| `resourceGroupName` | string | Resource group name. |
| `searchServiceResourceId` | string | Azure AI Search service resource ID. |
| `storageAccountResourceId` | string | Storage account resource ID. |
| `subscriptionId` | string | Subscription ID. |
| `tenantId` | string | Tenant ID. |
| `virtualNetworkResourceId` | string | Virtual network resource ID. |
| `wafPolicyResourceId` | string | Web Application Firewall (WAF) policy resource ID. |

## Cross-referenced modules

This section gives you an overview of all local-referenced module files (i.e., other modules that are referenced in this module) and all remote-referenced files (i.e., Bicep modules that are referenced from a Bicep Registry or Template Specs).

| Reference | Type |
| :-- | :-- |
| `br/public:avm/ptn/ai-ml/ai-foundry:0.3.0` | Remote reference |
| `br/public:avm/res/api-management/service:0.11.0` | Remote reference |
| `br/public:avm/res/app-configuration/configuration-store:0.9.2` | Remote reference |
| `br/public:avm/res/app/container-app:0.18.1` | Remote reference |
| `br/public:avm/res/app/managed-environment:0.11.3` | Remote reference |
| `br/public:avm/res/compute/virtual-machine:0.20.0` | Remote reference |
| `br/public:avm/res/container-registry/registry:0.9.3` | Remote reference |
| `br/public:avm/res/document-db/database-account:0.16.0` | Remote reference |
| `br/public:avm/res/insights/component:0.6.0` | Remote reference |
| `br/public:avm/res/key-vault/vault:0.13.3` | Remote reference |
| `br/public:avm/res/maintenance/maintenance-configuration:0.3.1` | Remote reference |
| `br/public:avm/res/network/application-gateway-web-application-firewall-policy:0.2.0` | Remote reference |
| `br/public:avm/res/network/application-gateway:0.7.1` | Remote reference |
| `br/public:avm/res/network/azure-firewall:0.8.0` | Remote reference |
| `br/public:avm/res/network/firewall-policy:0.3.1` | Remote reference |
| `br/public:avm/res/network/network-security-group:0.5.1` | Remote reference |
| `br/public:avm/res/network/private-dns-zone:0.8.0` | Remote reference |
| `br/public:avm/res/network/private-endpoint:0.11.0` | Remote reference |
| `br/public:avm/res/network/public-ip-address:0.9.0` | Remote reference |
| `br/public:avm/res/network/virtual-network:0.7.0` | Remote reference |
| `br/public:avm/res/operational-insights/workspace:0.12.0` | Remote reference |
| `br/public:avm/res/search/search-service:0.11.1` | Remote reference |
| `br/public:avm/res/storage/storage-account:0.26.2` | Remote reference |

## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the [repository](https://aka.ms/avm/telemetry). There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
