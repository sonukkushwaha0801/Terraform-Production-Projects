# Cross Region State Replication Execution Guide

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
terraform workspace new replication
```

---

## Select Workspace

```bash
terraform workspace select replication
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

## Validate Replication

```bash
chmod +x scripts/validate-replication.sh

./scripts/validate-replication.sh
```

---

## Simulate Regional Failure

```bash
chmod +x scripts/simulate-primary-region-failure.sh

./scripts/simulate-primary-region-failure.sh
```

---

## Perform Failover

```bash
chmod +x scripts/perform-failover.sh

./scripts/perform-failover.sh
```

---

## Validate Failover

```bash
chmod +x scripts/validate-failover.sh

./scripts/validate-failover.sh
```

---

## GitHub Actions Pipeline

Pipeline executes:

- Terraform Init
- Terraform Format Check
- Terraform Validate
- Checkov Scan
- Governance Validation

---

## Expected Governance Failures

Examples:

- Encryption Disabled
- Versioning Disabled
- Replication Missing
- Missing Owner Tag
- Missing CostCenter Tag

---

## Recommended Workflow

1. Deploy Replication Infrastructure
2. Validate Replication
3. Simulate Regional Failure
4. Execute Failover
5. Validate Recovery
6. Verify Governance Compliance

---

## Production Usage

Use:

- Cross Region Replication
- Versioning
- Encryption
- Governance Validation
- Recovery Testing

---

## Remote Backend

If using production remote state, configure:

- S3 Backend
- DynamoDB State Locking
