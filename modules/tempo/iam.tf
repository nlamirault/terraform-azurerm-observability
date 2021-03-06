# Copyright (C) 2021 Nicolas Lamirault <nicolas.lamirault@gmail.com>
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

resource "azurerm_user_assigned_identity" "tempo" {
  name                = local.service_name
  resource_group_name = azurerm_resource_group.tempo.name
  location            = azurerm_resource_group.tempo.location
  tags                = var.tags
}

resource "azurerm_role_assignment" "tempo" {
  scope                = azurerm_storage_account.tempo.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.tempo.principal_id
}
