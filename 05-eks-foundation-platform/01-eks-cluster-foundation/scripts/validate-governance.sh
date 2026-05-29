#!/bin/bash

echo "Running governance validation..."

checkov -d . --external-checks-dir policies

echo "Validation completed."
