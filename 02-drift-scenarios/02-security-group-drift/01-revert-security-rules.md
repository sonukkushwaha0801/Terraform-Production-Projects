# Revert Security Rules

## Overview

Terraform remains the source of truth.

Manual Security Group modifications performed outside Terraform are considered unauthorized or temporary and must be reverted.

Terraform will restore Security Group configuration back to the Infrastructure-as-Code definition.

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

---

## Security Risk

Current infrastructure exposes SSH publicly to the internet.

Risks include:

- Unauthorized access attempts
- Brute-force attacks
- Security policy violations
- Compliance failures

---

## Detect Drift

Run:

```bash
terraform plan
```

Expected output:

```diff
~ cidr_blocks = [
    - "0.0.0.0/0",
    + "10.0.0.0/24"
]
```

---

## Reconcile Infrastructure

Apply Terraform configuration:

```bash
terraform apply
```

Terraform will restore Security Group rules back to the Terraform-defined configuration.

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

## Enterprise Practice

This approach is common in:

- Security-focused organizations
- Compliance-heavy environments
- Regulated industries
- Strict Infrastructure-as-Code workflows

---

## Key Learning

Security changes made outside Terraform should either:

- Be reverted immediately
OR
- Be formally reviewed and adopted into Infrastructure-as-Code
