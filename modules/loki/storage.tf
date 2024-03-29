# Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
#
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
#
# SPDX-License-Identifier: Apache-2.0

resource "azurerm_storage_account" "this" {
  name                      = local.storage_account
  resource_group_name       = azurerm_resource_group.this.name
  location                  = azurerm_resource_group.this.location
  account_kind              = "BlobStorage"
  account_tier              = "Standard"
  account_replication_type  = "GRS"
  access_tier               = "Hot"
  min_tls_version           = "TLS1_2"
  enable_https_traffic_only = true

  tags = var.tags
}

resource "azurerm_storage_container" "this" {
  for_each = toset(local.buckets_names)

  name                  = format("%s-%s", var.bucket_name, each.value)
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}
