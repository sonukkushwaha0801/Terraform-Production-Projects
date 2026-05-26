#!/bin/bash

set -euo pipefail

echo
echo "========================================="
echo "Terraform Validation"
echo "========================================="

terraform fmt -recursive
terraform validate

echo
echo "========================================="
echo "Importing Infrastructure into Terraform"
echo "========================================="

terraform apply

echo
echo "========================================="
echo "Migration Completed Successfully"
echo "========================================="
