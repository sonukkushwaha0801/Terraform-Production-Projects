# Revert Load Balancer Listener Drift

## Overview

Terraform remains the source of truth.

Manual listener configuration changes performed outside Terraform are considered temporary or unauthorized and must be reverted.

Terraform restores original ALB listener configuration.

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

---

## Operational & Security Risk

Current drift may introduce:

- inconsistent traffic routing
- unexpected application behavior
- insecure listener exposure
- SSL misconfiguration
- governance violations

---

## Detect Drift

Run:

```bash
terraform plan
```

Terraform detects listener configuration drift.

Expected:

```diff
~ port     = 8080 -> 80
~ protocol = HTTPS -> HTTP
```

---

## Reconcile Infrastructure

Run:

```bash
terraform apply
```

Terraform restores original listener configuration.

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
- emergency listener changes are temporary
- troubleshooting activity is completed
- routing standards must be restored
- governance policies enforce Terraform ownership

---

## Key Learning

Traffic routing and listener configurations should remain governed through Infrastructure-as-Code workflows.
