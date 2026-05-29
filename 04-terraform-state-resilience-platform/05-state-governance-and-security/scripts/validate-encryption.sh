#!/bin/bash

set -e

clear

echo "========================================="
echo " ENCRYPTION VALIDATION"
echo "========================================="
echo

read -p "State Bucket Name: " BUCKET_NAME

echo

aws s3api get-bucket-encryption \
  --bucket "$BUCKET_NAME"

echo
echo "Encryption validation completed."
