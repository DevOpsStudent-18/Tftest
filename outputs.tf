
output "app_service_default_site_hostname" {
  value = azurerm_app_service.webapp.default_site_hostname
}

output "key_vault_uri" {
  value = azurerm_key_vault.kv.vault_uri
}
