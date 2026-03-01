
variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region for resources."
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account."
  type        = string
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan."
  type        = string
}

variable "webapp_name" {
  description = "Name of the Web App."
  type        = string
}

variable "key_vault_name" {
  description = "Name of the Key Vault."
  type        = string
}

variable "tenant_id" {
  description = "Azure AD tenant ID."
  type        = string
}
variable "length" {
  type = number
}

variable "resource_group_name" {
  description = "Name of the Azure resource group."
  type        = string
}

variable "location" {
  description = "Azure region for resources."
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "Name of the storage account."
  type        = string
}

variable "app_service_plan_name" {
  description = "Name of the App Service plan."
  type        = string
}

variable "api_app_name" {
  description = "Name of the API App Service."
  type        = string
}

variable "ui_app_name" {
  description = "Name of the UI App Service."
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics Workspace."
  type        = string
}

variable "app_insights_name" {
  description = "Name of the Application Insights resource."
  type        = string
}

variable "key_vault_name" {
  description = "Name of the Key Vault."
  type        = string
}

variable "tenant_id" {
  description = "Azure AD tenant ID."
  type        = string
}