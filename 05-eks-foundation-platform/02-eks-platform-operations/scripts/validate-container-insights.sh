#!/bin/bash

echo "=================================="
echo "CloudWatch Container Insights"
echo "=================================="

read -p "Enter Cluster Name: " CLUSTER_NAME

aws logs describe-log-groups \
--log-group-name-prefix "/aws/containerinsights/${CLUSTER_NAME}"

echo
echo "Validation Complete"
