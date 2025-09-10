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
  for_each = toset(local.buckets_names)

  name                  = format("%s-%s", var.bucket_name, each.value)
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}


# resource "azurerm_private_endpoint" "tempo_storage" {
#   name                = local.storage_account
#   resource_group_name = azurerm_resource_group.this.name
#   location            = azurerm_resource_group.this.location

#   subnet_id = data.azurerm_subnet.resources.id

#   private_dns_zone_group {
#     name                 = "tempostoragepep-dzg"
#     private_dns_zone_ids = [data.azurerm_private_dns_zone.blob.id]
#   }

#   private_service_connection {
#     name                           = "tempostoragepep-cnx"
#     private_connection_resource_id = azurerm_storage_account.this.id
#     subresource_names              = ["blob"]
#     is_manual_connection           = false
#   }

#   tags = var.tags
# }
