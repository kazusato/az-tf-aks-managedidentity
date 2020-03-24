provider "azurerm" {
  features {}
}

terraform {
  required_version = ">= 0.12"
}

locals {
  location = "japaneast"
  vnet_range = "10.10.0.0/16"
  cluster_subnet_range = "10.10.0.0/20"
}

resource "azurerm_resource_group" "aks-mi-rg" {
  location = local.location
  name = "aks-mi-rg"
}

resource "azurerm_virtual_network" "aks-mi-vnet" {
  address_space = [local.vnet_range]
  location = local.location
  name = "aks-mi-vnet"
  resource_group_name = azurerm_resource_group.aks-mi-rg.name
}

resource "azurerm_subnet" "aks-mi-cluster-subnet" {
  address_prefix = local.cluster_subnet_range
  name = "aks-mi-cluster-subnet"
  resource_group_name = azurerm_resource_group.aks-mi-rg.name
  virtual_network_name = azurerm_virtual_network.aks-mi-vnet.name
}