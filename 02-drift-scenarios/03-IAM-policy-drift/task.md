# IAM Policy Drift

## Scenario

A production EC2 instance uses an IAM Role managed through Terraform.

During troubleshooting or operational activity, an engineer manually attaches an additional IAM policy directly from AWS Console.

Terraform configuration is not updated.

This creates IAM drift and introduces excessive permissions.

---
## Industry Value

| Category             | Value                                      |
| -------------------- | ------------------------------------------ |
| Frequency            | <span style="color:red">Very High</span>   |
| Security Risk        | <span style="color:red">Critical</span>    |
| Enterprise Relevance | <span style="color:green">Excellent</span> |
| Interview Value      | <span style="color:green">Excellent</span> |

### Real Production Impact

IAM drift is one of the highest-risk cloud governance issues.

During operational troubleshooting, engineers may manually attach excessive IAM permissions directly from AWS Console.

Common examples:
- AdministratorAccess
- wildcard permissions
- temporary elevated access

If unmanaged, this may result in:
- privilege escalation
- excessive permissions
- account compromise risk
- compliance failures

Terraform drift detection helps enforce least-privilege IAM governance.
---
## Infrastructure

Provision the following:

- IAM Role
- IAM Instance Profile
- EC2 Instance
- IAM Policy Attachment

---

## Original IAM Policy

Terraform-managed policy:

```text
AmazonS3ReadOnlyAccess
```

---

## Drift Simulation

After infrastructure deployment:

Manually attach:

```text
AdministratorAccess
```

to the IAM Role using:
- AWS Console
OR
- AWS CLI

Do not update Terraform configuration before drift detection.

---

## Security Risk

This introduces:

- Privilege escalation
- Excessive permissions
- Governance violations
- Increased attack surface

---

## Drift Detection Goal

Terraform should detect:

- Unmanaged IAM policy attachment
- Drift between Terraform and AWS

---

## Reconciliation Approaches

### Approach 1 — Revert IAM Policy

Remove unauthorized IAM policy attachment.

---

### Approach 2 — Accept IAM Change

Update Terraform configuration to include the additional IAM policy.

Only perform this after proper security review and approval.

---

## Learning Objectives

- Understand IAM drift
- Detect privilege escalation
- Learn Terraform IAM reconciliation
- Understand least privilege principles
- Understand IAM governance workflows
