#  `[AiMl/LandingZoneTests]`


## Navigation

- [Resource Types](#Resource-Types)
- [Usage examples](#Usage-examples)
- [Parameters](#Parameters)
- [Outputs](#Outputs)

## Resource Types

_None_

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
  "parameters": {}
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/ptn/ai-ml/landing-zone/tests:<version>'


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
  "parameters": {}
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/ptn/ai-ml/landing-zone/tests:<version>'


```

</details>
<p>

## Parameters

_None_

## Outputs

_None_
