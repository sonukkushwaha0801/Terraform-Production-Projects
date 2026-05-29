#!/bin/bash

echo "=================================="
echo "Platform Health Validation"
echo "=================================="

echo
echo "Nodes"
kubectl get nodes

echo
echo "System Pods"
kubectl get pods -n kube-system

echo
echo "Cluster Events"
kubectl get events -A \
--sort-by=.metadata.creationTimestamp

echo
echo "Validation Complete"
