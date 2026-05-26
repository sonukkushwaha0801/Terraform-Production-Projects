# Accept Security Change

## Overview

In this approach, the production Security Group modification is accepted as the new desired infrastructure state.

Terraform configuration is updated to match actual production infrastructure.

---

## Current Drift

Actual Infrastructure:

```text
22/tcp → 0.0.0.0/0
```

Terraform Configuration:

```text
22/tcp → 10.0.0.0/24
```

Terraform detects Security Group drift because infrastructure was modified manually outside Terraform.

---

## Important Security Warning

This approach is dangerous for security-related drift.

Public SSH access should only be accepted when:

- Security review is completed
- Proper approvals exist
- Temporary access becomes operational requirement
- Compensating controls are implemented

---

## Update Terraform Configuration

Modify:

```hcl
allowed_ssh_cidr = "10.0.0.0/24"
```

to:

```hcl
allowed_ssh_cidr = "0.0.0.0/0"
```

---

## Reconcile Terraform

Run:

```bash
terraform apply
```

Terraform configuration now matches production infrastructure.

---

## Verification

Run:

```bash
terraform plan
```

Expected result:

```text
No changes. Infrastructure is up-to-date.
```

---

## Production Risks

Accepting public SSH exposure may introduce:

- Increased attack surface
- Brute-force attack risk
- Compliance violations
- Audit findings

---

## Enterprise Reality

This approach is sometimes used during:

- Emergency production incidents
- Temporary operational access
- Rapid troubleshooting situations

However, such access should eventually be removed or restricted.

---

## Key Learning

Infrastructure reality and Terraform configuration must always converge.

Untracked security changes create long-term operational and security risk.
