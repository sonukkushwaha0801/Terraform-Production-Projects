#!/bin/bash

set -e

clear

echo "========================================="
echo " AUDIT LOGGING VALIDATION"
echo "========================================="
echo

read -p "State Bucket Name: " BUCKET_NAME

echo

aws s3api get-bucket-logging \
  --bucket "$BUCKET_NAME"

echo
echo "Audit logging validation completed."
