# Accept CloudWatch Monitoring Change

## Overview

In this approach, the production monitoring configuration is accepted as the new desired infrastructure state.

Terraform configuration is updated to match actual CloudWatch alarm configuration.

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

Terraform detects monitoring drift because CloudWatch alarms were modified manually outside Terraform.

---

## Operational Consideration

This approach is appropriate when:
- alert tuning is intentional
- monitoring noise reduction approved
- operational review validates changes

---

## Update Terraform Configuration

Modify:

```hcl
threshold          = 70
evaluation_periods = 2
```

to:

```hcl
threshold          = 95
evaluation_periods = 5
```

---

## Reconcile Terraform

Run:

```bash
terraform apply
```

Terraform configuration now matches production monitoring configuration.

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
- alert optimization
- observability tuning
- operational improvements
- monitoring redesign

---

## Key Learning

Monitoring configuration changes should eventually converge back into Terraform governance for consistency and auditability.
