# SPDX-FileCopyrightText: Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
# SPDX-License-Identifier: Apache-2.0

resource "azuread_application" "this" {
  display_name = local.service_name
  tags         = var.tags
}

resource "azuread_service_principal" "this" {
  client_id   = azuread_application.this.client_id
  description = local.service_name
  tags        = var.tags
}

resource "azuread_application_federated_identity_credential" "this" {
  application_id      = azuread_application.this.id
  display_name        = local.service_name
  resource_group_name = azurerm_resource_group.this.name
  audiences           = ["api://AzureADTokenExchange"]
  issuer              = data.azurerm_kubernetes_cluster.this.oidc_issuer_url
  subject             = "system:serviceaccount:${var.namespace}:${var.service_account}"
}

resource "azurerm_role_assignment" "this" {

  principal_id         = azuread_service_principal.this.object_id
  scope                = azurerm_storage_account.this.id
  role_definition_name = "Storage Blob Data Contributor"
}
