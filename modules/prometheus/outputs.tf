
# SPDX-FileCopyrightText: Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
# SPDX-License-Identifier: Apache-2.0

output "azurerm_federated_identity_credential_id" {
  value       = azurerm_federated_identity_credential.this.id
  description = "ID of the user assigned identity"
}

output "user_assigned_identity_name" {
  value       = azurerm_user_assigned_identity.this.name
  description = "Name of the user assigned identity"
}
