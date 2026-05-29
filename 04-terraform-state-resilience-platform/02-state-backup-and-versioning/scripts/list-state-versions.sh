#!/bin/bash

set -e

clear

echo "========================================="
echo " TERRAFORM STATE VERSION EXPLORER"
echo "========================================="
echo

read -p "Enter Backup Bucket Name: " BUCKET_NAME
read -p "Enter State File Key: " STATE_FILE

echo
echo "Available Versions"
echo

aws s3api list-object-versions \
  --bucket "$BUCKET_NAME" \
  --prefix "$STATE_FILE" \
  --query 'Versions[].{VersionId:VersionId,LastModified:LastModified,Size:Size}' \
  --output table
