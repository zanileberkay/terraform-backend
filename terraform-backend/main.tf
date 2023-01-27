terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "deneme-rg" {
  name     = "example"
  location = "East Us"
  tags = {
    "environment" = "dev"
  }
}

resource "azurerm_virtual_network" "metc-vn" {
  name                = "mtc-network"
  resource_group_name = azurerm_resource_group.deneme-rg.name
  location            = azurerm_resource_group.deneme-rg.location
  address_space       = ["10.123.0.0/16"]

  tags = {
    environment = "dev"
  }
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.deneme-rg.name
  virtual_network_name = azurerm_virtual_network.metc-vn.name
  address_prefixes     = ["10.123.0.0/24"]
}