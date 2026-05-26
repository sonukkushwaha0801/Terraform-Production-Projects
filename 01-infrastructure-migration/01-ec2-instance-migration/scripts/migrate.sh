#!/bin/bash

clear

echo "========================================="
echo "Terraform EC2 Migration Utility"
echo "========================================="

echo
echo "Checking Terraform Installation"

if ! command -v terraform &> /dev/null; then
    echo "Terraform is not installed"
    exit 1
fi

echo
echo "========================================="
echo "Initializing Terraform"
echo "========================================="

terraform init

echo
echo "========================================="
echo "Validating Terraform Configuration"
echo "========================================="

terraform validate

echo
echo "========================================="
echo "Generating Terraform Configuration"
echo "========================================="

terraform plan \
-generate-config-out=main.tf \
-out=tfplan > /dev/null 2>&1

PLAN_EXIT_CODE=$?

if [ $PLAN_EXIT_CODE -ne 0 ]; then
    echo
    echo "Terraform generated configuration with conflicts"
    echo "Manual refactoring required"
fi

echo
echo "========================================="
echo "Generated Configuration Location"
echo "========================================="

echo "main.tf"

echo
echo "========================================="
echo "Next Step"
echo "========================================="

echo "Review and refactor generated configuration into main.tf"
