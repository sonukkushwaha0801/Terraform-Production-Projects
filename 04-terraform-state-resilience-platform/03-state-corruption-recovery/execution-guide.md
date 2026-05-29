# Terraform State Corruption Recovery Execution Guide

## Prerequisites

- Terraform >= 1.5
- AWS CLI
- AWS Account
- Checkov Installed

---

## Initialize Terraform

```bash
terraform init
```

---

## Create Workspace

```bash
terraform workspace new recovery
```

---

## Select Workspace

```bash
terraform workspace select recovery
```

---

## Format Configuration

```bash
terraform fmt -recursive
```

---

## Validate Configuration

```bash
terraform validate
```

---

## Governance Validation

```bash
chmod +x scripts/validate-governance.sh

./scripts/validate-governance.sh
```

---

## Generate Plan

```bash
terraform plan
```

---

## Deploy Infrastructure

```bash
terraform apply
```

---

## Simulate State Corruption

```bash
chmod +x scripts/simulate-corruption.sh

./scripts/simulate-corruption.sh
```

---

## Recover State

```bash
chmod +x scripts/recover-state.sh

./scripts/recover-state.sh
```

---

## Validate Recovery

```bash
chmod +x scripts/validate-recovery.sh

./scripts/validate-recovery.sh
```

---

## GitHub Actions Pipeline

Pipeline executes:

- Terraform Init
- Terraform Format Check
- Terraform Validate
- Checkov Scan
- Custom Policy Validation

---

## Expected Governance Failures

Examples:

- Encryption Disabled
- Versioning Disabled
- Missing Owner Tag
- Missing CostCenter Tag

---

## Recommended Workflow

1. Deploy Infrastructure
2. Simulate State Corruption
3. Detect Failure
4. Restore Healthy Version
5. Validate Recovery
6. Verify Governance Compliance

---

## Production Usage

Use:

- S3 Versioning
- DynamoDB State Locking
- Automated Governance Validation
- Recovery Testing

---

## Remote Backend

If using production remote state, configure:

- S3 Backend
- DynamoDB State Locking
