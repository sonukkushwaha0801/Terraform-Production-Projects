#!/bin/bash

set -e

clear

echo "========================================="
echo " SECURITY POSTURE VALIDATION"
echo "========================================="
echo

terraform init

terraform validate

checkov -d . --external-checks-dir policies

echo
echo "Security posture validation completed."
