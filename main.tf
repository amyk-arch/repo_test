terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
    backend "azurerm" {
        resource_group_name  = "dowd-devops-rg"
        storage_account_name = "dowdtf"
        container_name       = "tfstatedowd"
        key                  = "terraform.tfstate"
    }

}

provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "dowd-rg" {
  name     = "dowd-tf"
  location = "uksouth"
}

resource "azurerm_storage_account" "dowdsa" {
  name                     = "dowdsatf"
  resource_group_name      = azurerm_resource_group.dowd-rg.name
  location                 = azurerm_resource_group.dowd-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
