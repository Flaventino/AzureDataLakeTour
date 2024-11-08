#!/bin/bash
echo "TERRAFORM PROJECT RESET"
echo ">>> All automatically created files and/or directories will be deleted."

# CHANGING WORKING DIRECTORY (In case of the script would be called from anywhere else...)
cd "$(dirname "$0")"

# DELETING DIRETORIES & FILES
rm -rf .terraform
rm -f  ./.terraform.lock.hcl
rm -f  ./terraform.tfstate
rm -f  ./terraform.tfstate.backup

# LEAVING MESSAGE
echo ">>> Reset done successfully!"