# SPDX-FileCopyrightText: Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
# SPDX-License-Identifier: Apache-2.0

data "azurerm_kubernetes_cluster" "this" {
  name                = var.cluster_name
  resource_group_name = var.cluster_rg_name
}

# data "azurerm_subnet" "this" {
#   name                 = "ResourcesSubnet"
#   virtual_network_name = "using-system"
#   resource_group_name  = "using-system-vnet-rg"
# }

# data "azurerm_private_dns_zone" "this" {
#   name                = var.dns_zone_name
#   resource_group_name = "using-system-vnet-rg"
# }
