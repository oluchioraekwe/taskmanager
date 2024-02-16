terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }

    backend "azurerm" {
    resource_group_name  = "storage"
    storage_account_name = "aksstore"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_oidc = true
  }
}


# Configure the Microsoft Azure Provider
provider "azurerm" {
  # use_oidc = true
  features {}
}