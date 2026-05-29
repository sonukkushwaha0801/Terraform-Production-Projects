#!/bin/bash

clear

echo "========================================="
echo " STATE FAILOVER"
echo "========================================="
echo

read -p "Replica Bucket Name: " REPLICA_BUCKET

echo
echo "Use the following backend configuration:"
echo

echo "bucket = ${REPLICA_BUCKET}"

echo
echo "Failover procedure completed."
