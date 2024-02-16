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
    subscription_id      = "416f0a23-14c4-4f97-990a-ebe5379b3d48"
    tenant_id            = "0755a81e-ca57-47de-a8e8-8dc64b559dfc"
  }
}


# Configure the Microsoft Azure Provider
provider "azurerm" {
  # use_oidc = true
  features {}
}