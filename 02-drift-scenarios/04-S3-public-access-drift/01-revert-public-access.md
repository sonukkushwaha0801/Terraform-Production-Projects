# Revert Public Access

## Overview

Terraform remains the source of truth.

Any public bucket access configured manually outside Terraform is considered unauthorized or temporary and must be reverted.

Terraform restores secure private bucket configuration.

---

## Current Drift

Actual Infrastructure:

```text
Public Bucket Access Enabled
```

Terraform Configuration:

```text
Public Bucket Access Blocked
```

---

## Security Risk

Current bucket configuration may expose:

- sensitive data
- backups
- internal files
- application assets

publicly to the internet.

---

## Detect Drift

Run:

```bash
terraform plan
```

Terraform detects:

- modified public access block
- unmanaged bucket policy

---

## Reconcile Infrastructure

Run:

```bash
terraform apply
```

Terraform restores secure bucket configuration.

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

This approach is common in:

- security-focused organizations
- compliance-heavy environments
- regulated industries
- secure cloud governance workflows

---

## Key Learning

Public cloud storage access should always be controlled through Infrastructure-as-Code governance.
