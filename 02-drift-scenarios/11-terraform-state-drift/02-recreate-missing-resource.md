# Recreate Missing Infrastructure

## Overview

Terraform remains the source of truth.

Deleted infrastructure should be recreated automatically to restore expected production state.

Terraform uses state information to restore missing resources.

---

## Current Drift

Terraform State:

```text
aws_instance.state_drift_server
```

Actual Infrastructure:

```text
EC2 instance missing
```

---

## Operational Impact

Current drift may:
- break production applications
- reduce capacity
- impact automation workflows
- create inconsistent infrastructure state

---

## Detect Drift

Run:

```bash
terraform plan
```

Expected:

```diff
+ aws_instance.state_drift_server will be created
```

Terraform detects missing infrastructure.

---

## Reconcile Infrastructure

Run:

```bash
terraform apply
```

Terraform recreates deleted EC2 instance.

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
- accidental deletion occurred
- production resources must exist
- Terraform remains authoritative

---

## Key Learning

Terraform state helps restore missing infrastructure automatically.
