#!/bin/bash

clear

echo "========================================="
echo "Terraform S3 Bucket Migration Utility"
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

terraform plan -generate-config-out=main.tf > /dev/null 2>&1

PLAN_EXIT_CODE=$?

if [ $PLAN_EXIT_CODE -ne 0 ]; then
    echo
    echo "Terraform generated configuration with conflicts"
    echo "Manual refactoring required in main.tf"
    echo "Continuing execution..."
fi

echo
echo "========================================="
echo "Refactor Terraform Configuration"
echo "========================================="

echo "Review generated configuration in main.tf"
