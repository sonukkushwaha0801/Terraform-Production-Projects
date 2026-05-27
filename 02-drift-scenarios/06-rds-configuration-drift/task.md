# RDS Configuration Drift

## Scenario

Terraform manages a production RDS database instance.

During troubleshooting or operational activity, an engineer manually modifies critical RDS configuration directly from AWS Console.

Terraform configuration is not updated.

This creates:
- infrastructure drift
- security drift
- compliance drift
- operational inconsistency

---

## Industry Value

| Category             | Value                                      |
| -------------------- | ------------------------------------------ |
| Frequency            | <span style="color:red">Very High</span>   |
| Security Risk        | <span style="color:red">Critical</span>    |
| Enterprise Relevance | <span style="color:green">Excellent</span> |
| Interview Value      | <span style="color:green">Excellent</span> |

### Real Production Impact

RDS configuration drift is extremely common in production environments.

Database administrators and engineers often manually modify:
- storage size
- backup settings
- public accessibility
- deletion protection
- instance sizing

during:
- incidents
- migrations
- emergency troubleshooting
- scaling operations

If unmanaged, this may introduce:
- public database exposure
- backup policy violations
- compliance failures
- infrastructure inconsistency

Terraform drift detection helps restore Infrastructure-as-Code governance for production databases.

---
## Security Note

> ⚠️ This project intentionally stores database credentials and configuration values directly inside Terraform files for learning and demonstration purposes.
>
> In real production environments, this is considered a bad security practice.
>
> Production-grade Terraform implementations should use:
>
> - AWS Secrets Manager
> - AWS SSM Parameter Store
> - Vault
> - Environment variables
> - CI/CD secret management systems
> - Remote encrypted secret backends
>
> Sensitive values such as:
>
> - database passwords
> - access keys
> - API tokens
> - secret credentials
>
> should never be hardcoded inside Terraform configuration files or committed to Git repositories.

---

## Cost & Testing Note

> ⚠️ Amazon RDS instances used in this project may not fall under AWS Free Tier eligibility depending on:
>
> - selected engine version
> - instance class
> - region
> - account type
>
> Make sure you understand AWS pricing and have the appropriate billing plan before provisioning this infrastructure.
>
> 😄 Fun fact:
>
> I also did not have an upgraded AWS plan while creating this scenario, so this project was designed primarily from production knowledge, Terraform behavior, AWS documentation, and real-world operational patterns.
>
> The implementation should be correct according to Terraform and AWS behavior, but always validate carefully before using in real production environments.
---

## Infrastructure

Provision the following:

- RDS MySQL Instance
- Encrypted Storage
- Backup Configuration
- Deletion Protection

---


## Original Terraform Configuration

Terraform-managed configuration:

```text
allocated_storage       = 20
backup_retention_period = 7
publicly_accessible     = false
deletion_protection     = true
```

---

## Drift Simulation

After infrastructure deployment:

Manually modify from AWS Console:

```text
allocated_storage       = 100
backup_retention_period = 0
publicly_accessible     = true
```

Do not update Terraform configuration before drift detection.

---

## Security & Compliance Risk

Current drift may introduce:

- public database exposure
- disabled backups
- increased attack surface
- compliance violations
- operational inconsistency

---

## Drift Detection Goal

Terraform should detect:

- modified storage configuration
- modified backup retention
- modified public accessibility

---

## Reconciliation Approaches

### Approach 1 — Revert Configuration

Restore secure RDS configuration back to Terraform-defined values.

---

### Approach 2 — Accept Production Change

Update Terraform configuration to match actual production RDS configuration.

Only perform this after proper operational and security review.

---

## Learning Objectives

- Understand RDS configuration drift
- Detect database security drift
- Learn Terraform RDS reconciliation
- Understand database governance
- Understand Infrastructure-as-Code operational workflows
