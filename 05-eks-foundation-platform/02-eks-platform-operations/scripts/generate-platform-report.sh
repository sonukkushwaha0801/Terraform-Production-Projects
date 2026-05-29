#!/bin/bash

REPORT_FILE="platform-report.txt"

echo "Generating Platform Report..."

{
echo "=================================="
echo "EKS PLATFORM REPORT"
echo "=================================="
echo

echo "Nodes"
kubectl get nodes
echo

echo "Deployments"
kubectl get deployments -A
echo

echo "Services"
kubectl get svc -A
echo

echo "Ingress"
kubectl get ingress -A
echo

echo "Generated On:"
date
} > "$REPORT_FILE"

echo
echo "Report Generated:"
echo "$REPORT_FILE"
