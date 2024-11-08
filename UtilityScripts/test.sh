#!/bin/bash

# RETRIEVAL OF REQUIRED INFORMATION (resource names)

cd "/home/user/AzureDataLakeTour/DataLakeDeployment"
RESOURCE_GROUP=$(terraform  output -raw ResourcegGroupName)
CONTAINER_NAME=$(terraform  output -raw DataLake_ContainerName)
DIRECTORY_PATH=$(terraform  output -raw DataLake_Dir1)
STORAGE_ACCOUNT=$(terraform output -raw DataLakeName)
LOCAL_FILE_PATH="/home/user/AzureDataLakeTour/Resources/*sample_data_files.zip"

echo "Resource names retrieved successfully !"
# MAKING AN AUTHORIZATION KEY TO BE GRANTED BY AZURE TO PERFORM FILES DELETION
STORAGE_ACCOUNT_KEY=$(az storage account keys list        \
                         --resource-group $RESOURCE_GROUP \
                         --account-name $STORAGE_ACCOUNT  \
                         --query '[0].value'              \
                         --output tsv)

echo "Storage account key generated successfully"

# # Set n to the number of minutes you want to add
# n=65  # Example: Adding 5 minutes

# # Generate the dynamic date + 'n' minutes
# expiry_date=$(date -u -d "+$n minutes" +"%Y-%m-%dT%H:%M:%SZ")

# # Output the result
# echo "Expiration date for resources access: $expiry_date"


# SAS_Token=$(az storage account generate-sas \
#            --account-name $STORAGE_ACCOUNT \
#            --account-key $STORAGE_ACCOUNT_KEY \
#            --services f \
#            --resource-types sco \
#            --permissions rwdlacup \
#            --expiry $expiry_date \
#            --https-only \
#            | jq -r '.'
#         )
# echo "SAS token generated successfully"

# # echo $token
# # gaston="https://adlspesenti.blob.core.windows.net/datastorage/input_data_azcopy?sp=racwdlmeop&st=2024-11-07T13:50:22Z&se=2024-11-07T21:50:22Z&spr=https&sv=2022-11-02&sr=d&sig=wbqz5EqSudAxIvJX5RgWjcemFsVpyv%2BkchY%2BCGcoR6A%3D&sdd=1"

# # echo $STORAGE_ACCOUNT

# # SET THE DESTINATION URL
# DESTINATION_URL="https://$STORAGE_ACCOUNT.dfs.core.windows.net/$CONTAINER_NAME/$DIRECTORY_PATH?$token"
# #DESTINATION_URL="https://$STORAGE_ACCOUNT.dfs.core.windows.net/$CONTAINER_NAME/$DIRECTORY_PATH?$gaston"
# echo "Destination URL set successfully"
# echo ">>> Starting transfert..."

# # # UPLOAD DATA TO THE DESTINATION LOCATION
# #azcopy copy "$LOCAL_FILE_PATH" "$DESTINATION_URL" #--account-key $STORAGE_ACCOUNT_KEY
# #cd "/home/user/AzureDataLakeTour/Resources"
# #pwd
# #echo $LOCAL_FILE_PATH
# #azcopy copy "/home/user/AzureDataLakeTour/Resources/sample_data_files.zip" "https://adlsvangansberg.blob.core.windows.net/inputdata/test?sp=racwdlmeop&st=2024-11-08T07:31:15Z&se=2024-11-08T15:31:15Z&spr=https&sv=2022-11-02&sr=d&sig=9b56GymBohxb%2FHSq9F8t0wrR5VeIOqp35Vg4pbgJ56Y%3D&sdd=1" --recursive #--account-key $STORAGE_ACCOUNT_KEY
# #azcopy copy "/home/user/AzureDataLakeTour/Resources/sample_data_files.zip" "https://adlsdolet.blob.core.windows.net/datastorage?sp=racwdlmeop&st=2024-11-08T08:45:47Z&se=2024-11-08T16:45:47Z&spr=https&sv=2022-11-02&sr=c&sig=E2GjW37VRiPRcV7NPbtfHZRY%2F40zuju1ml8Dk7q4W2o%3D"# --recursive=true #--account-key $STORAGE_ACCOUNT_KEY

# #azcopy copy "/home/user/AzureDataLakeTour/Resources/sample_data_files.zip" "https://adlspesenti.blob.core.windows.net/datastorage/input_data_azcopy?sp=racwdlmeop&st=2024-11-08T10:38:44Z&se=2024-11-08T18:38:44Z&sv=2022-11-02&sr=d&sig=Ht4mbunjwGHALv4UGBdgDKXWK1DBXcRNQ87AlMEK4aE%3D&sdd=1" --recursive=true
# #azcopy copy "/home/user/AzureDataLakeTour/Resources/transfert_Arnaud/*sample_data_files.zip" "https://adlspesenti.blob.core.windows.net/datastorage/input_data_azcopy?sp=racwdlmeop&st=2024-11-08T10:45:39Z&se=2024-11-08T18:45:39Z&spr=https&sv=2022-11-02&sr=d&sig=YCaS8yLiDwjLhFJ%2BC9uegpslt6kP5ew%2F%2BPdHwJ80bDE%3D&sdd=1" --recursive=true
# #azcopy copy "$LOCAL_FILE_PATH" "https://adlspesenti.blob.core.windows.net/datastorage/input_data_azcopy?sp=racwdlmeop&st=2024-11-08T10:45:39Z&se=2024-11-08T18:45:39Z&spr=https&sv=2022-11-02&sr=d&sig=YCaS8yLiDwjLhFJ%2BC9uegpslt6kP5ew%2F%2BPdHwJ80bDE%3D&sdd=1" --recursive=true

# azcopy copy "$LOCAL_FILE_PATH" "$DESTINATION_URL" --recursive=true


