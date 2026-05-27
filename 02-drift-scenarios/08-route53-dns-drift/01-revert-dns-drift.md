# Revert Route53 DNS Drift

## Overview

Terraform remains the source of truth.

Manual DNS changes performed outside Terraform are considered temporary or unauthorized and must be reverted.

Terraform restores original DNS routing configuration.

---

## Current Drift

Actual Infrastructure:

```text
DNS Record IP = 8.8.8.8
TTL            = 60
```

Terraform Configuration:

```text
DNS Record IP = 1.1.1.1
TTL            = 300
```

---

## Operational Risk

Current drift may:
- route traffic incorrectly
- break production applications
- create failover inconsistencies
- bypass governance workflows

---

## Detect Drift

Run:

```bash
terraform plan
```

Terraform detects DNS configuration drift.

Expected:

```diff
~ ttl     = 60 -> 300
~ records = ["8.8.8.8"] -> ["1.1.1.1"]
```

---

## Reconcile Infrastructure

Run:

```bash
terraform apply
```

Terraform restores original DNS configuration.

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

This approach is common when:
- temporary migrations are completed
- failover operations end
- governance requires Terraform ownership

---

## Key Learning

DNS infrastructure should remain governed through Infrastructure-as-Code workflows.
