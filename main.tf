# Entra ID (Azure AD) App Registration and SSO
# Note: App registration for Entra ID (Azure AD) is typically done via Azure Portal or CLI.
# You can use the Azure CLI or Terraform provider for AzureAD to automate this if needed.
# Example (not included here):
# resource "azuread_application" "frontend" { ... }
# resource "azuread_application" "backend" { ... }
# resource "azuread_service_principal" ...
# resource "azuread_app_role_assignment" ...
#
# For SSO, configure authentication settings in App Service to use Entra ID.
# See Azure documentation for details on App Service authentication/authorization.

# Azure provider
provider "azurerm" {
  features {}
}

# Resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Storage account (required for App Service)
terraform {
  cloud {
    organization = "testtfproj"
    workspaces {
      name = "testcliworkspace"
    }
  }
}
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# App Service Plan
resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Basic"
    size = "B1"
  }
}

# App Service (API)
resource "azurerm_app_service" "api" {
  name                = var.api_app_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id
}

# App Service (UI)
resource "azurerm_app_service" "ui" {
  name                = var.ui_app_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id
}

# Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = var.log_analytics_workspace_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# Application Insights
resource "azurerm_application_insights" "appinsights" {
  name                = var.app_insights_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"
  workspace_id        = azurerm_log_analytics_workspace.log_analytics.id
}

# Key Vault
resource "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = var.tenant_id
  sku_name            = "standard"
}
