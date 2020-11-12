# Observability / Prometheus

Terraform module which configure Prometheus resources on Microsoft Azure.

## Terraform versions

Use Terraform `0.13` and Terraform Microsoft Azure `3.45+`.

These types of resources are supported:

* [azurerm_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group)
* [azurerm_storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account)
* [azurerm_storage_container](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container)
* [azuread_application](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application)
* [azuread_service_principal](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal)

## Usage

```hcl
module "prometheus" {
  source  = "nlamirault/observability/azure//modules/prometheus"
  version = "X.Y.Z"


}
```

and variables :

```hcl
project  = "...."
region = "...."


```

This module creates :

* a Resource Group
* an Application within Azure Active Directory.
* a Service Principal associated with an Application within Azure Active Directory

## Documentation

