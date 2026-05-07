resource "azurerm_role_assignment" "monitoring_reader" {
  principal_id         = "hhasass--11=ssdsda1"
  role_definition_name = "Monitoring Reader"
  scope                = data.azurerm_subscription.current.id
}