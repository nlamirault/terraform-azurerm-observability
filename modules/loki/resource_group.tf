
# SPDX-FileCopyrightText: Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
# SPDX-License-Identifier: Apache-2.0

resource "azurerm_resource_group" "this" {
  name     = local.service_name
  location = var.resource_group_location
  tags     = var.tags
}
