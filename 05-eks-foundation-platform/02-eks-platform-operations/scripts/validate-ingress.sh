#!/bin/bash

echo "=================================="
echo "Ingress Validation"
echo "=================================="

kubectl get ingress -A

echo
echo "Load Balancer Endpoints"
kubectl get ingress -A \
-o wide

echo
echo "Validation Complete"
