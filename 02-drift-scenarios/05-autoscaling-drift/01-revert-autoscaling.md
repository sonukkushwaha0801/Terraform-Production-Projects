# Revert AutoScaling Drift

## Overview

Terraform remains the source of truth.

Manual Auto Scaling changes performed outside Terraform are considered temporary operational changes and must be reverted.

Terraform restores original scaling configuration.

---

## Current Drift

Actual Infrastructure:

```text
desired_capacity = 6
max_size         = 10
```

Terraform Configuration:

```text
desired_capacity = 2
max_size         = 4
```

---

## Operational Impact

Current infrastructure:
- runs more EC2 instances
- increases operational cost
- differs from Infrastructure-as-Code configuration

---

## Detect Drift

Run:

```bash
terraform plan
```

Terraform detects modified scaling configuration.

---

## Reconcile Infrastructure

Run:

```bash
terraform apply
```

Terraform restores original Auto Scaling configuration.

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
- traffic spike is temporary
- emergency scaling no longer needed
- operational stability restored

---

## Key Learning

Operational scaling changes should eventually converge back into Infrastructure-as-Code governance.
