# Revert RDS Configuration Drift

## Overview

Terraform remains the source of truth.

Manual RDS configuration changes performed outside Terraform are considered temporary or unauthorized and must be reverted.

Terraform restores secure database configuration.

---

## Current Drift

Actual Infrastructure:

```text
allocated_storage       = 100
backup_retention_period = 0
publicly_accessible     = true
```

Terraform Configuration:

```text
allocated_storage       = 20
backup_retention_period = 7
publicly_accessible     = false
```

---

## Security & Compliance Risk

Current drift introduces:

- internet-accessible database
- disabled backups
- compliance violations
- increased operational risk

---

## Detect Drift

Run:

```bash
terraform plan
```

Terraform detects modified RDS configuration.

---

## Reconcile Infrastructure

Run:

```bash
terraform apply
```

Terraform restores original secure database configuration.

---

## Verification

Run:

```bash
terraform plan
```

Expected:

```text
No changes. Infrastructure is up-to-date.
```

---

## Enterprise Practice

This approach is common in:
- compliance-heavy organizations
- regulated industries
- security-focused environments
- governed database operations

---

## Key Learning

Production databases should remain governed through Infrastructure-as-Code workflows.
