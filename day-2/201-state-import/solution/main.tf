terraform {
  required_version = ">= 0.14.8"
  required_providers {
    azurerm = {
      source  = "registry.terraform.io/hashicorp/azurerm"
      version = "> 2.74.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "plistotestrg"
  location = "australiaeast"
}

resource "azurerm_container_registry" "main" {
  name                = "plistotestregistry"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = "Standard"
}
