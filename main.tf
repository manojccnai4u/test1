terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
  required_version = "~> 1.2"
}

provider "azurerm" {
  # Configuration options
  features {
    
  }
}

# Create a resourec Group 
resource "azurerm_resource_group" "rg" {
  name     = "rg_tf_state"
  location = "Central India"
}

# Create a Storage Account 
resource "azurerm_storage_account" "tfstorage" {
  name                     = "storagetfstorage540540"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location # Implicit depency
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "Terraform State file"
  }
  depends_on = [ azurerm_resource_group.rg ]
}
