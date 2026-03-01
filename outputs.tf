output "api_app_name" {
  value = azurerm_linux_web_app.api.name
}

output "api_app_url" {
  value = "https://${azurerm_linux_web_app.api.default_hostname}"
}

output "ui_app_name" {
  value = azurerm_linux_web_app.ui.name
}

output "ui_app_url" {
  value = "https://${azurerm_linux_web_app.ui.default_hostname}"
}

output "app_service_plan_name" {
  value = azurerm_service_plan.asp.name
}

output "application_insights_connection_string" {
  value     = azurerm_application_insights.appi.connection_string
  sensitive = true
}

output "key_vault_name" {
  value = azurerm_key_vault.kv.name
}