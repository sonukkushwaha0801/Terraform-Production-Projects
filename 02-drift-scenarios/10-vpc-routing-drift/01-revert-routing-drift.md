# Revert VPC Routing Drift

## Overview

Terraform remains the source of truth.

Manual networking changes performed outside Terraform are considered temporary or unauthorized and must be reverted.

Terraform restores original route table configuration.

---

## Current Drift

Actual Infrastructure:

```text
Default route removed or modified
```

Terraform Configuration:

```text
0.0.0.0/0 → Internet Gateway
```

---

## Operational & Security Risk

Current drift may:
- break internet connectivity
- expose internal traffic
- bypass network governance
- introduce routing inconsistencies

---

## Detect Drift

Run:

```bash
terraform plan
```

Terraform detects route table drift.

---

## Reconcile Infrastructure

Run:

```bash
terraform apply
```

Terraform restores original routing configuration.

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
- emergency routing changes are temporary
- migrations complete
- governance requires Terraform ownership

---

## Key Learning

Networking infrastructure should remain governed through Infrastructure-as-Code workflows.
