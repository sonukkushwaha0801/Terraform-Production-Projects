# EKS Cluster Foundation

Production-grade Amazon EKS foundation built using Terraform.

## Objectives

- Build secure Kubernetes infrastructure
- Implement platform engineering practices
- Enforce governance controls
- Prepare foundation for production workloads

## Components

- VPC
- Public Subnets
- Private Subnets
- NAT Gateway
- EKS Control Plane
- Managed Node Groups
- IAM Roles
- CloudWatch Logging

## Governance

Validation is performed using:

- Checkov
- Custom Policies

Policies enforce:

- Owner tags
- Cost center tags
- Cluster logging
- Node security controls

## Validation

```bash
terraform validate

checkov -d . --external-checks-dir policies
```

## Production Notes

Worker nodes remain private.

Cluster logging should remain enabled for auditing and incident investigations.

For production environments consider:

- S3 Remote Backend
- DynamoDB Locking
- Multi-AZ Design
- Centralized Logging
