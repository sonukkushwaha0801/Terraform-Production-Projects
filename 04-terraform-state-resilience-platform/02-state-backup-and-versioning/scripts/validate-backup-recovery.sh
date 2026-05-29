#!/bin/bash

set -e

clear

echo "========================================="
echo " BACKUP RECOVERY VALIDATION"
echo "========================================="
echo

echo "Initializing Terraform..."
terraform init

echo
echo "Validating Infrastructure State..."
terraform plan

echo
echo "Backup recovery validation completed."
