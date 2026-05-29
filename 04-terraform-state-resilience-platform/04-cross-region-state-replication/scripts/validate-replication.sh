#!/bin/bash

set -e

clear

echo "========================================="
echo " REPLICATION VALIDATION"
echo "========================================="
echo

read -p "Primary Bucket Name: " PRIMARY_BUCKET
read -p "Replica Bucket Name: " REPLICA_BUCKET

echo
echo "Uploading replication test object..."
echo

echo "Replication Test" > replication-test.txt

aws s3 cp \
  replication-test.txt \
  s3://${PRIMARY_BUCKET}/replication-test.txt

rm -f replication-test.txt

echo
echo "Waiting for replication..."
sleep 30

echo
echo "Checking replica bucket..."
echo

aws s3 ls \
  s3://${REPLICA_BUCKET}/replication-test.txt

echo
echo "Replication validation completed."
