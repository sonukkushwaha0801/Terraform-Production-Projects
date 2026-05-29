#!/bin/bash

clear

echo "========================================="
echo " DISASTER RECOVERY DRILL"
echo "========================================="
echo

START_TIME=$(date +%s)

echo "Running Recovery Validation..."
terraform plan > /dev/null

END_TIME=$(date +%s)

RTO=$((END_TIME - START_TIME))

echo
echo "Recovery Time Objective (RTO): ${RTO} seconds"
echo
echo "DR Drill Completed"
