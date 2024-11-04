# DEFINITION OF TERRAFORM SETTINGS
terraform {
    required_version = ">=0.12"

    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~>3.0"
    }
    }
}

# LOADING PROVIDERS
provider "azurerm" {
  features {}
}