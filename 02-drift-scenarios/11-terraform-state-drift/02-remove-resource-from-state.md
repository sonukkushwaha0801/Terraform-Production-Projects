# Remove Resource From Terraform State

## Overview

In this approach, the infrastructure deletion is accepted as intentional.

Terraform state must be updated to stop tracking deleted infrastructure.

---

## Current Drift

Terraform State:

```text
aws_instance.state_drift_server
```

Actual Infrastructure:

```text
EC2 instance deleted
```

Terraform still believes resource should exist.

---

## Operational Consideration

This approach is appropriate when:
- infrastructure retirement approved
- deletion intentional
- migration completed
- resource no longer required

---

## Remove Resource From State

Run:

```bash
terraform state rm aws_instance.state_drift_server
```

Terraform stops tracking deleted infrastructure.

---

## Optional Cleanup

Also remove resource block from:

```text
main.tf
```

to prevent future recreation.

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

## Enterprise Reality

This approach is commonly used after:
- decommissioning
- migrations
- infrastructure cleanup
- architecture modernization

---

## Key Learning

Terraform state must accurately represent managed infrastructure ownership.
