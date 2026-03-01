
variable "app_service_plan_name" {
  description = "App Service Plan Name"
  type        = string
}

variable "api_app_name" {
  description = "Backend API App Name"
  type        = string
}

variable "ui_app_name" {
  description = "Frontend UI App Name"
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "Log Analytics Workspace Name"
  type        = string
}

variable "app_insights_name" {
  description = "Application Insights Name"
  type        = string
}

variable "key_vault_name" {
  description = "Key Vault Name"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}