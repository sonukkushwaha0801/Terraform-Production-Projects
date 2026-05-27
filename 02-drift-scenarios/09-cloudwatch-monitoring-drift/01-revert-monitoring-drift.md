# Revert CloudWatch Monitoring Drift

## Overview

Terraform remains the source of truth.

Manual monitoring configuration changes performed outside Terraform are considered temporary or unauthorized and must be reverted.

Terraform restores original monitoring configuration.

---

## Current Drift

Actual Infrastructure:

```text
Threshold           = 95
Evaluation Periods  = 5
```

Terraform Configuration:

```text
Threshold           = 70
Evaluation Periods  = 2
```

---

## Operational Risk

Current drift may:
- suppress alerts
- hide infrastructure problems
- delay incident response
- reduce monitoring accuracy

---

## Detect Drift

Run:

```bash
terraform plan
```

Expected:

```diff
~ threshold          = 95 -> 70
~ evaluation_periods = 5 -> 2
```

Terraform detects monitoring drift.

---

## Reconcile Infrastructure

Run:

```bash
terraform apply
```

Terraform restores original monitoring configuration.

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
- temporary maintenance ends
- alert suppression no longer needed
- governance policies enforce Terraform ownership

---

## Key Learning

Monitoring infrastructure should remain governed through Infrastructure-as-Code workflows.
