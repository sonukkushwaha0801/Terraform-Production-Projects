# Revert Infrastructure

## Overview

In this approach, Terraform remains the source of truth.

Any manual infrastructure modification performed outside Terraform is considered unauthorized or temporary and must be reverted.

Terraform will restore infrastructure back to the configuration defined in code.

---

## When To Use

Use this approach when:

- Emergency hotfix is temporary
- Manual change was unauthorized
- Infrastructure drift violates compliance
- Team follows strict Infrastructure-as-Code governance
- Production incident is resolved

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

Terraform plans to restore infrastructure back to the Terraform-defined state.

---

## Reconcile Infrastructure

Apply Terraform configuration:

```bash
terraform apply
```

Type:

```text
yes
```

Terraform will:

- Stop the instance if required
- Modify EC2 instance type
- Restore original configuration
- Remove infrastructure drift

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

- Terraform remains single source of truth
- Strong governance
- Prevents configuration sprawl
- Maintains audit consistency

---

### Risks

- May reduce production capacity
- Can introduce downtime
- Unsafe during active incidents
- Requires operational validation

---

## Enterprise Practice

This approach is common in:

- Compliance-heavy organizations
- Highly regulated environments
- Strict GitOps workflows
- Security-sensitive infrastructure

---

## Key Learning

Infrastructure changes made outside Terraform should either:

- Be reverted
OR
- Be formally adopted into Infrastructure-as-Code
