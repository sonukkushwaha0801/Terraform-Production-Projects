# Disaster Recovery Validation Execution Guide

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

## Simulate State Loss

```bash
chmod +x scripts/simulate-state-loss.sh

./scripts/simulate-state-loss.sh
```

---

## Simulate State Corruption

```bash
chmod +x scripts/simulate-state-corruption.sh

./scripts/simulate-state-corruption.sh
```

---

## Simulate Region Failure

```bash
chmod +x scripts/simulate-region-failure.sh

./scripts/simulate-region-failure.sh
```

---

## Recover State

```bash
chmod +x scripts/recover-state.sh

./scripts/recover-state.sh
```

---

## Execute DR Drill

```bash
chmod +x scripts/execute-dr-drill.sh

./scripts/execute-dr-drill.sh
```

---

## Validate RPO / RTO

```bash
chmod +x scripts/validate-rpo-rto.sh

./scripts/validate-rpo-rto.sh
```

---

## Generate DR Report

```bash
chmod +x scripts/generate-dr-report.sh

./scripts/generate-dr-report.sh
```

---

## Recommended Validation Flow

1. Deploy Platform
2. Simulate Disaster
3. Execute Recovery
4. Validate Infrastructure
5. Validate Governance
6. Measure Recovery Metrics
7. Generate DR Report
