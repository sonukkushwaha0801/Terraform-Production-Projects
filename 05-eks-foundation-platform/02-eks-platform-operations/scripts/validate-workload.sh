#!/bin/bash

echo "=================================="
echo "Workload Validation"
echo "=================================="

kubectl get deployments -A

echo
kubectl get services -A

echo
kubectl get pods -A

echo
echo "Validation Complete"
