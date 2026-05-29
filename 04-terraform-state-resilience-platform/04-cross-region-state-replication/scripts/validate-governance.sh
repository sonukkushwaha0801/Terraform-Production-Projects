#!/bin/bash

set -e

clear

echo "========================================="
echo " GOVERNANCE VALIDATION"
echo "========================================="
echo

checkov -d . --external-checks-dir policies

echo
echo "Governance validation completed."
