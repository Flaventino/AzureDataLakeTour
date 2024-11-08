#!/bin/bash

# SCRIPT PURPOSE
# Performing a complete `terraform destroy` command without exception caused by any files being stored in the deployed containers & sub directories.
# 1. Removes/Deletes files from the containers
# 2. Run `terraform destroy`

# CHANGING WORKING DIRECTORY (In case of the script would be called from anywhere else...)
cd "$(dirname "$0")"

# RETRIEVAL OF REQUIRED INFORMATION (resource names)
RESOURCE_GROUP=$(terraform  output -raw ResourcegGroupName)
CONTAINER_NAME=$(terraform  output -raw DataLake_ContainerName)
STORAGE_ACCOUNT=$(terraform output -raw DataLakeName)

# MAKING AN AUTHORIZATION KEY IN ORDER TO BE GRANTED BY AZURE TO PERFORM FILES DELETION
STORAGE_ACCOUNT_KEY=$(az storage account keys list --account-name $STORAGE_ACCOUNT --query '[0].value' --output tsv)

# CONTAINERS CLEANING
az storage blob delete-batch --account-name $STORAGE_ACCOUNT --source $CONTAINER_NAME --pattern "*" --auth-mode key --account-key $STORAGE_ACCOUNT_KEY

# # Destroy the Terraform infrastructure
terraform destroy -auto-approve