# RESOURCES GROUP SETUP
resource "azurerm_resource_group" "ResourcesGroup" {
    name        = var.ResourceGroupName
    location    = var.ResourceGroupLocation
}



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

# >>> Adds a directory called "input_data_portal_images" whithin the "datastorage" container.
resource "azurerm_storage_data_lake_gen2_path" "datastorageDir2" {
  path               = "input_data_portal_images"
  filesystem_name    = azurerm_storage_data_lake_gen2_filesystem.datastorage.name
  storage_account_id = azurerm_storage_account.DataLake.id
  resource           = "directory"    # Resource type. So 'directory' here!
}