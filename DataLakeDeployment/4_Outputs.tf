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