


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

# BASIC BLOB STORAGE SETTING UP
# >>> created as a 'standard' storage account.
resource "azurerm_storage_account" "BlobStorage" {
  name                      = var.BasicBlobStorageName
  resource_group_name       = azurerm_resource_group.ResourcesGroup.name
  location                  = azurerm_resource_group.ResourcesGroup.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  access_tier               = "Hot" # 'hot' means frequent accessed data.

  # Keeps standard storage account
  account_kind              = "BlobStorage"
  is_hns_enabled            = false # Hierarchical Namespace not required here.
}


# DATA LAKE SETTING UP
# >>> created as a 'standard' storage account with Hierarchical Namespace Enabled.
resource "azurerm_storage_account" "DataLake" {
  name                      = var.DataLakeName
  resource_group_name       = azurerm_resource_group.ResourcesGroup.name
  location                  = azurerm_resource_group.ResourcesGroup.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  access_tier               = "Hot" # 'hot' means frequent accessed data.

  # Changes standard storage account into a data lake type storage.
  account_kind              = "StorageV2"
  is_hns_enabled            = true # Enabling Hierarchical Namespace as it is necessary for Data Lake Gen2.
}
# >>> Adds a container called "datastorage" within the data lake.
resource "azurerm_storage_data_lake_gen2_filesystem" "datastorage" {
  name                      = "datastorage"
  storage_account_id        = azurerm_storage_account.DataLake.id
}
# >>> Adds a directory called "input_data_portal" whithin the "datastorage" container.
resource "azurerm_storage_data_lake_gen2_path" "datastorageDir1" {
  path               = "input_data_portal"
  filesystem_name    = azurerm_storage_data_lake_gen2_filesystem.datastorage.name
  storage_account_id = azurerm_storage_account.DataLake.id
  resource           = "directory"    # Resource type. So 'directory' here!
}

# output "storage_account_id" {
#   value = azurerm_storage_account.storage.id
# }

# output "file_system_name" {
#   value = azurerm_storage_data_lake_gen2_filesystem.filesystem.name
# }

# output "file_system_id" {
#   value = azurerm_storage_data_lake_gen2_filesystem.filesystem.id
# }