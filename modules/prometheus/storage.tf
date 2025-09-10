# SPDX-FileCopyrightText: Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
# SPDX-License-Identifier: Apache-2.0

resource "azurerm_storage_account" "this" {
  name                     = local.storage_account
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "ZRS"
  min_tls_version          = "TLS1_2"

  shared_access_key_enabled       = true
  public_network_access_enabled   = false
  allow_nested_items_to_be_public = false

  blob_properties {
    delete_retention_policy {
      days = 30
    }
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

resource "azurerm_storage_container" "this" {
  name                  = local.service_name
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}
