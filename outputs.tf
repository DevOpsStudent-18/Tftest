

output "api_app_service_default_hostname" {
  value = azurerm_app_service.api.default_site_hostname
}

output "ui_app_service_default_hostname" {
  value = azurerm_app_service.ui.default_site_hostname
}

output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.log_analytics.id
}

output "app_insights_instrumentation_key" {
  value = azurerm_application_insights.appinsights.instrumentation_key
}

output "key_vault_uri" {
  value = azurerm_key_vault.kv.vault_uri
}
