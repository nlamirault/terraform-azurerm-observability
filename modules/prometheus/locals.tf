
# SPDX-FileCopyrightText: Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
# SPDX-License-Identifier: Apache-2.0

locals {
  service_name    = format("%s-prometheus", var.resource_group_name)
  storage_account = replace(local.service_name, "-", "")
  list_tags       = [for k, v in var.tags : "${k}:${v}"]
}
