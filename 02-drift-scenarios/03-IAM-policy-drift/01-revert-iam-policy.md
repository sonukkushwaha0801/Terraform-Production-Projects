# Revert IAM Policy

## Overview

Terraform remains the source of truth.

Any IAM policy attached manually outside Terraform is considered unauthorized or temporary and must be removed.

Terraform will restore IAM configuration back to the Infrastructure-as-Code definition.

---

## Current Drift

Terraform-managed policy:

```text
AmazonS3ReadOnlyAccess
```

Manually attached policy:

```text
AdministratorAccess
```

---

## Security Risk

This introduces:

- Privilege escalation
- Full AWS account access
- Excessive permissions
- Governance violations

---

## Detect Drift

Run:

```bash
terraform plan
```

Terraform detects unmanaged IAM policy attachment.

---

## Reconcile Infrastructure

Apply Terraform configuration:

```bash
terraform apply
```

Terraform removes unauthorized IAM policy attachment and restores least-privilege access.

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
- Least-privilege IAM governance

---

## Key Learning

IAM changes made outside Terraform should either:

- Be reverted immediately
OR
- Be formally reviewed and adopted into Infrastructure-as-Code
