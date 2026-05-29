# EKS Cluster Foundation - Execution Guide

## Initialize

```bash
terraform init
```

## Format

```bash
terraform fmt -recursive
```

## Validate

```bash
terraform validate
```

## Governance Validation

```bash
checkov -d . --external-checks-dir policies
```

## Plan

```bash
terraform plan
```

## Deploy

```bash
terraform apply
```

## Verify Resources

```bash
aws eks list-clusters

aws ec2 describe-vpcs
```

## GitHub Actions Validation

Pipeline executes:

- Terraform Init
- Terraform Fmt
- Terraform Validate
- Checkov Scan
- Governance Validation

## Expected Failures

- Missing Owner tag
- Missing CostCenter tag
- Missing Cluster Logging
- Public Node Groups

## Remediation

Update Terraform configuration and rerun validation.

## Production Remote State

For production usage configure:

- S3 Backend
- DynamoDB State Locking

## Recommended Workflow

Developer
    ↓

Pull Request
    ↓

Terraform Validation
    ↓

Checkov Validation
    ↓

Governance Validation
    ↓

Approval
    ↓

Terraform Apply
