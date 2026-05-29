#!/bin/bash

set -e

clear

echo "========================================="
echo " TERRAFORM STATE VERSION RESTORE"
echo "========================================="
echo

read -p "Enter Backup Bucket Name: " BUCKET_NAME
read -p "Enter State File Key: " STATE_FILE

echo
echo "Fetching Available Versions..."
echo

aws s3api list-object-versions \
  --bucket "$BUCKET_NAME" \
  --prefix "$STATE_FILE" \
  --query 'Versions[].{VersionId:VersionId,LastModified:LastModified}' \
  --output table

echo

read -p "Enter Version ID to Restore: " VERSION_ID

aws s3api get-object \
  --bucket "$BUCKET_NAME" \
  --key "$STATE_FILE" \
  --version-id "$VERSION_ID" \
  recovered.tfstate

aws s3 cp recovered.tfstate "s3://${BUCKET_NAME}/${STATE_FILE}"

rm -f recovered.tfstate

echo
echo "State version restored successfully."
