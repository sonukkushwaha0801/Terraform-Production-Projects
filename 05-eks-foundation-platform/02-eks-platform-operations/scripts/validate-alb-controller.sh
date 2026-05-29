#!/bin/bash

echo "=================================="
echo "ALB Controller Validation"
echo "=================================="

read -p "Enter EKS Cluster Name: " CLUSTER_NAME

kubectl get deployment aws-load-balancer-controller \
  -n kube-system

echo
echo "Checking Pod Status..."
kubectl get pods -n kube-system \
  -l app.kubernetes.io/name=aws-load-balancer-controller

echo
echo "Validation Complete"
