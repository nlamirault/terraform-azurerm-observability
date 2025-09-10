
# SPDX-FileCopyrightText: Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
# SPDX-License-Identifier: Apache-2.0

#############################################################################
# Prometheus

variable "resource_group_name" {
  type        = string
  description = "The Name which should be used for this Resource Group"
}

variable "resource_group_location" {
  type        = string
  description = "The Azure Region where the Resource Group should exist"
}

variable "prometheus_name" {
  type        = string
  description = "The Prometheus managed name"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default = {
    "made-by" = "terraform"
  }
}
