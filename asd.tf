resource "azurerm_role_assignment" "monitoring_reader" {
  principal_id         = "1120-112132-32321-23121"
  role_definition_name = "Monitoring Reader"
  scope                = data.azurerm_subscription.current.id
}