#!/bin/bash

set -e

clear

echo "========================================="
echo " STATE LOSS SIMULATION"
echo "========================================="
echo

read -p "Primary Bucket Name: " BUCKET_NAME
read -p "State File Key: " STATE_FILE

echo
echo "WARNING: State file will be deleted."
echo

read -p "Continue? (yes/no): " CONFIRM

if [[ "$CONFIRM" != "yes" ]]; then
    echo "Operation cancelled."
    exit 0
fi

aws s3 rm s3://${BUCKET_NAME}/${STATE_FILE}

echo
echo "State loss simulation completed."
