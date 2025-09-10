
# SPDX-FileCopyrightText: Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
# SPDX-License-Identifier: Apache-2.0

resource "azapi_resource" "prometheus" {
  type      = "microsoft.monitor/accounts@2021-06-03-preview"
  name      = var.prometheus_name
  parent_id = azurerm_resource_group.this.id
  location  = azurerm_resource_group.this.location

  response_export_values = ["*"]
}
