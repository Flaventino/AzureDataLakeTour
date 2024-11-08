# Define outputs to expose these values
output "ResourcegGroupName" {
  value       = azurerm_resource_group.ResourcesGroup.name
  description = "Name of the current resource group"
}

output "DataLakeName" {
  value       = azurerm_storage_account.DataLake.name
  description = "Name of the current daa lake"
}

output "DataLake_ContainerName" {
  value       = azurerm_storage_data_lake_gen2_filesystem.datastorage.name
  description = "Name of the main (unique so far) container within the datalake"
}

output "DataLake_Dir1" {
  value       = azurerm_storage_data_lake_gen2_path.datastorageDir1.path
  description = "Name of (path to) the 3rd directory within the main (unique so far) container within the datalake"
}

output "DataLake_Dir2" {
  value       = azurerm_storage_data_lake_gen2_path.datastorageDir2.path
  description = "Name of (path to) the 3rd directory within the main (unique so far) container within the datalake"
}

output "DataLake_Dir3" {
  value       = azurerm_storage_data_lake_gen2_path.datastorageDir3.path
  description = "Name of (path to) the 3rd directory within the main (unique so far) container within the datalake"
}