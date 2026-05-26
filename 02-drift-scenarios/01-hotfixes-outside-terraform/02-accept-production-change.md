# Accept Production Change

## Overview

In this approach, the production infrastructure change is accepted as the new desired state.

Terraform configuration is updated to match the real infrastructure.

This aligns Infrastructure-as-Code with actual production infrastructure.

---

## When To Use

Use this approach when:

- Production scaling upgrade is valid
- Hotfix becomes permanent
- Change receives operational approval
- Infrastructure evolution is intentional
- Production stability depends on current change

---

## Current Drift

Actual Infrastructure:

```text
EC2 Instance Type = t3.small
```

Terraform Configuration:

```text
EC2 Instance Type = t2.micro
```

Terraform detects drift because infrastructure was modified manually outside Terraform.

---

## Detect Drift

Run:

```bash
terraform plan
```

Expected output:

```diff
~ instance_type = "t3.small" -> "t2.micro"
```

---

## Update Terraform Configuration

Modify:

```hcl
instance_type = "t2.micro"
```

to:

```hcl
instance_type = "t3.small"
```

---

## Reconcile Terraform

Run:

```bash
terraform apply
```

Type:

```text
yes
```

Terraform updates its state alignment without reverting infrastructure.

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

## Production Considerations

### Advantages

- No infrastructure rollback
- No unnecessary downtime
- Preserves production stability
- Reflects real operational decisions

---

### Risks

- Manual changes may bypass review process
- Encourages direct infrastructure modification if uncontrolled
- Terraform governance can weaken over time

---

## Enterprise Practice

This approach is common in:

- Fast-moving production environments
- Incident-response situations
- Scaling-related hotfixes
- Mature DevOps organizations with proper change tracking

---

## Important DevOps Principle

```text
Infrastructure reality must eventually become Infrastructure-as-Code reality.
```

Production infrastructure and Terraform configuration must always converge.

---

## Key Learning

Manual infrastructure changes should never remain undocumented.

Terraform code must eventually reflect actual production infrastructure.
