# EKS Platform Operations - Execution Guide

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

## Validation

Validate:

- CloudWatch Integration
- ALB Controller Resources
- Monitoring Configuration
- Governance Controls

## GitHub Actions Flow

Terraform Init

↓

Terraform Fmt

↓

Terraform Validate

↓

Checkov Scan

↓

Governance Validation

↓

Pass / Fail

## Expected Failures

- Missing tags
- Missing logging
- Excessive IAM permissions
- Public exposure

## Remediation

Fix Terraform configuration and rerun governance validation.

## Production Remote State

For production deployments configure:

- S3 Backend
- DynamoDB State Locking

## Production Usage

Platform Operations should be validated before onboarding application teams.
