# Observability / Tempo

Terraform module which configure Tempo resources on Microsoft Azure.

## Usage

```hcl
module "tempo" {
  source  = "nlamirault/observability/azure//modules/tempo"
  version = "X.Y.Z"


}
```

and variables :

```hcl
project  = "...."
region = "...."


```

## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14.0 |
| azurerm | 2.48.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | 2.48.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [azurerm_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/2.48.0/docs/resources/resource_group) |
| [azurerm_role_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/2.48.0/docs/resources/role_assignment) |
| [azurerm_storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/2.48.0/docs/resources/storage_account) |
| [azurerm_storage_container](https://registry.terraform.io/providers/hashicorp/azurerm/2.48.0/docs/resources/storage_container) |
| [azurerm_user_assigned_identity](https://registry.terraform.io/providers/hashicorp/azurerm/2.48.0/docs/resources/user_assigned_identity) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aks\_resource\_group\_name | The Name which should be used for the AKS Resource Group | `string` | n/a | yes |
| storage\_account\_name | Specifies the name of the storage account | `string` | n/a | yes |
| storage\_container\_name | The name of the Container which should be created within the Storage Account | `string` | n/a | yes |
| tags | A mapping of tags to assign to the resource. | `map(string)` | <pre>{<br>  "made-by": "terraform"<br>}</pre> | no |
| tempo\_resource\_group\_location | The Azure Region where the Resource Group should exist | `string` | n/a | yes |
| tempo\_resource\_group\_name | The Name which should be used for this Resource Group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| user\_assigned\_identity\_id | ID of the user assigned identity |
| user\_assigned\_identity\_name | Name of the user assigned identity |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
