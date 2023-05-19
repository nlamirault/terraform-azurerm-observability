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

resource "azurerm_dashboard_grafana" "this" {
  name                              = local.service_name
  resource_group_name               = azurerm_resource_group.this.name
  location                          = azurerm_resource_group.this.location
  api_key_enabled                   = true
  deterministic_outbound_ip_enabled = true
  public_network_access_enabled     = true
  sku                               = "Standard"
  zone_redundancy_enabled           = true

  azure_monitor_workspace_integrations {
    resource_id = azapi_resource.prometheus.id
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

# Give Managed Grafana instances access to read monitoring data in current subscription.
resource "azurerm_role_assignment" "monitoring_reader" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Monitoring Reader"
  principal_id         = azurerm_dashboard_grafana.this.identity[0].principal_id
}

# https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/prometheus-grafana
resource "azurerm_role_assignment" "monitoring_data_reader" {
  scope                = azurerm_resource_group.this.id
  role_definition_name = "Monitoring Data Reader"
  principal_id         = azurerm_dashboard_grafana.this.identity[0].principal_id
}

# Give current client admin access to Managed Grafana instance.
resource "azurerm_role_assignment" "grafana_admin" {
  scope                = azurerm_dashboard_grafana.this.id
  role_definition_name = "Grafana Admin"
  principal_id         = data.azurerm_client_config.current.object_id
}
