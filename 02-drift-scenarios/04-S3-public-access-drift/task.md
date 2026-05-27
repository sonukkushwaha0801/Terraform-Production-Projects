# S3 Public Access Drift

## Scenario

Terraform manages a private S3 bucket with public access blocked.

During operational activity, an engineer manually disables block public access and adds a public bucket policy directly from AWS Console.

Terraform configuration is not updated.

This creates infrastructure drift and may expose sensitive data publicly.

---

## Industry Value

| Category             | Value                                      |
| -------------------- | ------------------------------------------ |
| Frequency            | <span style="color:red">Very High</span>   |
| Security Risk        | <span style="color:red">Critical</span>    |
| Enterprise Relevance | <span style="color:green">Excellent</span> |
| Interview Value      | <span style="color:green">Excellent</span> |

### Real Production Impact

S3 public access drift is one of the most common causes of cloud data exposure incidents.

Engineers sometimes manually:
- disable block public access
- add public bucket policies
- enable anonymous object access

during testing or temporary data sharing.

If not reverted properly, this may expose:
- sensitive data
- backups
- application assets
- internal documents

Terraform drift detection helps enforce secure cloud storage governance and compliance.

---

## Infrastructure

Provision the following:

- Private S3 Bucket
- Public Access Block Configuration

---

## Original Bucket State

Terraform-managed configuration:

```text
Public Access = Blocked
```

---

## Drift Simulation

After infrastructure deployment:

1. Disable:
```text
Block all public access
```

2. Add public bucket policy manually from AWS Console.

Do not update Terraform configuration before drift detection.

---

## Security Risk

This may expose bucket objects publicly to the internet.

Potential risks include:

- Public data exposure
- Compliance violations
- Information disclosure
- Unauthorized downloads

---

## Drift Detection Goal

Terraform should detect:

- modified public access block
- unmanaged bucket policy
- security drift

---

## Reconciliation Approaches

### Approach 1 — Revert Public Access

Restore secure bucket configuration.

---

### Approach 2 — Accept Public Access Change

Update Terraform configuration to match production infrastructure.

Only perform this after proper security review and approval.

---

## Learning Objectives

- Understand S3 security drift
- Detect public exposure risks
- Learn Terraform bucket reconciliation
- Understand cloud storage governance
- Understand Infrastructure-as-Code security workflows
