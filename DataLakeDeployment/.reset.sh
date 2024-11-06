#!/bin/bash
echo "TERRAFORM PROJECT RESET"
echo ">>> All automatically created files and/or directories will be deleted."

rm -rf .terraform
rm -f  ./.terraform.lock.hcl
rm -f  ./terraform.tfstate
rm -f  ./terraform.tfstate.backup

echo ">>> Reset done successfully!"