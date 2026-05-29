#!/bin/bash

set -e

clear

echo "========================================="
echo " RECOVERY VALIDATION"
echo "========================================="
echo

terraform init

terraform plan

echo
echo "State recovery validation completed."
