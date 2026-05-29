#!/bin/bash

set -e

clear

echo "========================================="
echo " FAILOVER VALIDATION"
echo "========================================="
echo

terraform init

terraform plan

echo
echo "Failover validation completed."
