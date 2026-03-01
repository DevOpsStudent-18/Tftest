terraform {
#  cloud {
 #   organization = "testtfproj"

   # workspaces {
    #  name = "testcliworkspace"
    #}
  #}

  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.47"
    }
  }
}