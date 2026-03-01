###################################
# Use Existing Resource Group
###################################
locals {
  rg_name   = "kml_rg_main-8a1bac3ffa694e5d"        # Hardcoded resource group name
  location  = "East US"       # Optional: location here too
}

###################################
# App Service Plan (Linux)
###################################
resource "azurerm_service_plan" "asp" {
  name                = var.app_service_plan_name
  location            = local.location
  resource_group_name = local.rg_name
  os_type             = "Linux"
  sku_name            = "B1"
}

###################################
# Log Analytics
###################################
resource "azurerm_log_analytics_workspace" "law" {
  name                = var.log_analytics_workspace_name
  location            = local.location
  resource_group_name = local.rg_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

###################################
# Application Insights
###################################
resource "azurerm_application_insights" "appi" {
  name                = var.app_insights_name
  location            = local.location
  resource_group_name = local.rg_name
  application_type    = "web"
  workspace_id        = azurerm_log_analytics_workspace.law.id
}

###################################
# Backend API (.NET 8)
###################################
resource "azurerm_linux_web_app" "api" {
  name                = var.api_app_name
  location            = local.location
  resource_group_name = local.rg_name
  service_plan_id     = azurerm_service_plan.asp.id
  https_only          = true

  identity {
    type = "SystemAssigned"
  }

  site_config {
    application_stack {
      dotnet_version = "8.0"
    }
  }

  app_settings = {
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = azurerm_application_insights.appi.connection_string
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"   = "false"
  }
}

###################################
# Frontend UI (Angular - Node 18)
###################################
resource "azurerm_linux_web_app" "ui" {
  name                = var.ui_app_name
  location            = local.location
  resource_group_name = local.rg_name
  service_plan_id     = azurerm_service_plan.asp.id
  https_only          = true

  identity {
    type = "SystemAssigned"
  }

  site_config {
    application_stack {
      node_version = "18-lts"
    }
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }
}

###################################
# Key Vault
###################################
resource "azurerm_key_vault" "kv" {
  name                       = var.key_vault_name
  location                   = local.location
  resource_group_name        = local.rg_name
  tenant_id                  = var.tenant_id
  sku_name                   = "standard"
  purge_protection_enabled   = false
  soft_delete_retention_days = 7
}