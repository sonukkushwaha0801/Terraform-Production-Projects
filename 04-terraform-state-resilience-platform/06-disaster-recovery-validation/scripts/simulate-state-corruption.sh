#!/bin/bash

set -e

clear

echo "========================================="
echo " STATE CORRUPTION SIMULATION"
echo "========================================="
echo

read -p "Primary Bucket Name: " BUCKET_NAME
read -p "State File Key: " STATE_FILE

echo
echo "WARNING: State file will be corrupted."
echo

read -p "Continue? (yes/no): " CONFIRM

if [[ "$CONFIRM" != "yes" ]]; then
    echo "Operation cancelled."
    exit 0
fi

echo "CORRUPTED TERRAFORM STATE" > corrupted.tfstate

aws s3 cp \
  corrupted.tfstate \
  s3://${BUCKET_NAME}/${STATE_FILE}

rm -f corrupted.tfstate

echo
echo "State corruption simulation completed."
