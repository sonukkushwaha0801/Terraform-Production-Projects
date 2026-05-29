#!/bin/bash

set -e

clear

echo "========================================="
echo " TERRAFORM STATE CORRUPTION SIMULATOR"
echo "========================================="
echo

read -p "Enter State Bucket Name: " BUCKET_NAME
read -p "Enter State File Key: " STATE_FILE

echo
echo "WARNING: This will intentionally corrupt the state file."
echo

read -p "Continue? (yes/no): " CONFIRM

if [[ "$CONFIRM" != "yes" ]]; then
  echo "Operation cancelled."
  exit 0
fi

echo "CORRUPTED STATE FILE" > corrupted.tfstate

aws s3 cp corrupted.tfstate \
  s3://${BUCKET_NAME}/${STATE_FILE}

rm -f corrupted.tfstate

echo
echo "State corruption completed."
