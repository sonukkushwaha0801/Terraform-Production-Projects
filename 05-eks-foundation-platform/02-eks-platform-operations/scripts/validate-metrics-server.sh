#!/bin/bash

echo "=================================="
echo "Metrics Server Validation"
echo "=================================="

kubectl get deployment metrics-server \
  -n kube-system

echo
echo "Node Metrics"
kubectl top nodes

echo
echo "Pod Metrics"
kubectl top pods -A

echo
echo "Validation Complete"
