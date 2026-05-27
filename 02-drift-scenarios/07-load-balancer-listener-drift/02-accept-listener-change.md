# Accept Load Balancer Listener Change

## Overview

In this approach, the production listener configuration is accepted as the new desired infrastructure state.

Terraform configuration is updated to match actual AWS Load Balancer listener configuration.

---

## Current Drift

Actual Infrastructure:

```text
Port     = 8080
Protocol = HTTPS
```

Terraform Configuration:

```text
Port     = 80
Protocol = HTTP
```

Terraform detects listener drift because production listener settings were modified manually outside Terraform.

---

## Operational Consideration

This approach is appropriate when:
- production routing requirements changed
- SSL migration is intentional
- infrastructure standards evolved
- operational review approved the change

---

## Update Terraform Configuration

Modify:

```hcl
port     = 80
protocol = "HTTP"
```

to:

```hcl
port     = 8080
protocol = "HTTPS"
```

---

## Reconcile Terraform

Run:

```bash
terraform apply
```

Terraform configuration now matches production listener configuration.

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
- approved SSL migrations
- traffic architecture changes
- routing redesigns
- operational modernization

---

## Key Learning

Infrastructure changes should eventually converge back into Terraform governance to maintain consistency and auditability.
