#!/bin/bash

set -e

clear

echo "========================================="
echo " ACCESS CONTROL VALIDATION"
echo "========================================="
echo

terraform init

terraform validate

echo
echo "Review IAM Roles:"
echo

aws iam list-roles \
  --query 'Roles[*].[RoleName]' \
  --output table

echo
echo "Access control validation completed."
