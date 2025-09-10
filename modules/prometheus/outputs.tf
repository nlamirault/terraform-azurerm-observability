
# SPDX-FileCopyrightText: Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
# SPDX-License-Identifier: Apache-2.0

output "azurerm_federated_identity_credential_id" {
  value       = azuread_application_federated_identity_credential.this.id
  description = "ID of the application federated identity"
}
