provider "azurerm" {
  features {}
}

# Data source to fetch information about an existing Azure resource group
data "azurerm_resource_group" "existing" {
  name = "CST8918-DEMO" # Name of the existing resource group
}

# Resource block to create an Azure Storage Account
resource "azurerm_storage_account" "example" {
  name                     = "arpitstorageaccount"
  resource_group_name      = data.azurerm_resource_group.existing.name # Reference to the existing resource group
  location                 = "canadacentral"                          # Location where the storage account will be created
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Output block to display the name of the created storage account
output "storage_account_name" {
  value = azurerm_storage_account.example.name
}
