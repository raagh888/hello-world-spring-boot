terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.71.0"
    }
  }
}
 
provider "azurerm" {
   features{}
subscription_id = "1243d544-ad22-44ab-bef0-8aec664e363b"
client_id = "f3aa07eb-bb29-4ed9-a532-25be81bfff57"
client_secret = "cf08297e-3a7e-4a5a-9e4a-16676a0fda56"
tenant_id  = "5ea239d0-800c-44d2-bc76-de2fcf2fccb5"
}
resource "azurerm_resource_group" "rg" {
  name     = "RaghavRG"
  location = "West Europe"
  }
resource "azurerm_app_service_plan" "appserv" {
  name                = "RaghavApp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
 
  sku {
    tier = "Standard"
    size = "S1"
  }
}
resource "azurerm_app_service" "webapptf" {
  name                = "Raghav9990"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.appserv.id
  }