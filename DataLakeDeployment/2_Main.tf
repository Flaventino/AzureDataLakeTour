


# RESOURCES GROUP SETUP
resource "azurerm_resource_group" "ResourcesGroup" {
    name        = var.ResourceGroupName
    location    = var.ResourceGroupLocation
}




# # Step 1: Provider configuration
# provider "azurerm" {
#   features {}
# }

# # Step 2: Define Variables (Optional)
# variable "resource_group_name" {
#   default = "myResourceGroup"
# }

# variable "location" {
#   default = "East US"
# }

# variable "storage_account_name" {
#   default = "mystorageaccountgen2"  # Must be unique
# }

# variable "file_system_name" {
#   default = "mydatalakefilesystem"
# }

# resource "azurerm_resource_group" "rg" {
#   name     = var.StorageAccountName
#   location = var.ResourceGroupLocation
# }

# DATA LAKE SETTING UP (created as a 'special' storage account with Hierarchical Namespace Enabled)
resource "azurerm_storage_account" "storage" {
  name                      = var.StorageAccountName
  resource_group_name       = azurerm_resource_group.ResourcesGroup.name
  location                  = azurerm_resource_group.ResourcesGroup.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"

  # Changes standard storage account into a data lake type storage
  account_kind              = "StorageV2"
  is_hns_enabled            = true # Enabling Hierarchical Namespace as it is necessary for Data Lake Gen2
}

# # Step 5: Create a File System (Container) within the Storage Account
# resource "azurerm_storage_data_lake_gen2_filesystem" "filesystem" {
#   name               = var.file_system_name
#   storage_account_id = azurerm_storage_account.storage.id
# }

# # Step 6: Output the Storage Account details for confirmation
# output "storage_account_name" {
#   value = azurerm_storage_account.storage.name
# }

# output "storage_account_id" {
#   value = azurerm_storage_account.storage.id
# }

# output "file_system_name" {
#   value = azurerm_storage_data_lake_gen2_filesystem.filesystem.name
# }

# output "file_system_id" {
#   value = azurerm_storage_data_lake_gen2_filesystem.filesystem.id
# }