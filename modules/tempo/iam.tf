# Copyright (C) 2020 Nicolas Lamirault <nicolas.lamirault@gmail.com>
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

resource "azuread_application" "tempo" {
  name = "tempo-k8s"
}

resource "azuread_service_principal" "tempo" {
  application_id               = azuread_application.tempo.application_id
  app_role_assignment_required = true
}

resource "random_string" "tempo" {
  length  = 36
  special = false

  keepers = {
    service_principal = azuread_service_principal.tempo.id
  }
}

resource "azuread_service_principal_password" "tempo" {
  service_principal_id = azuread_service_principal.tempo.id
  value                = random_string.tempo.result
  end_date             = timeadd(timestamp(), "8760h")

  # This stops be 'end_date' changing on each run and causing a new password to be set
  # to get the date to change here you would have to manually taint this resource...
  lifecycle {
    ignore_changes = [end_date]
  }
}

resource "azurerm_role_assignment" "aks" {
  scope                            = data.azurerm_resource_group.aks.id
  role_definition_name             = "Contributor"
  principal_id                     = azuread_service_principal.tempo.id
  skip_service_principal_aad_check = true
}

resource "azurerm_role_assignment" "tempo" {
  scope                            = azurerm_storage_account.tempo.id
  role_definition_name             = "Contributor"
  principal_id                     = azuread_service_principal.tempo.id
  skip_service_principal_aad_check = true
}
