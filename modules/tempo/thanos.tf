# Copyright (C) 2020 Nicolas Lamirault <nicolas.lamirault@gmail.com>

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

resource "azurerm_resource_group" "tempo" {
  name     = var.tempo_resource_group_name
  location = var.tempo_resource_group_location
}

resource "azurerm_storage_account" "tempo" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.tempo.name
  location                 = azurerm_resource_group.tempo.location
  account_kind             = "BlobStorage"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  access_tier              = "Hot"

  enable_https_traffic_only = true

  tags = var.tags
}

resource "azurerm_storage_container" "tempo" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.tempo.name
  container_access_type = "private"
}
