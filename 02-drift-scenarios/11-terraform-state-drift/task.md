# Terraform State Drift

## Scenario

Terraform manages a production EC2 instance.

An engineer manually deletes the EC2 instance directly from AWS Console without updating Terraform state or configuration.

Terraform state still believes the infrastructure exists.

This creates:
- Terraform state drift
- orphaned state entries
- infrastructure inconsistency

---

## Industry Value

| Category             | Value                                      |
| -------------------- | ------------------------------------------ |
| Frequency            | <span style="color:red">Very High</span>   |
| Security Risk        | <span style="color:orange">Medium</span>   |
| Enterprise Relevance | <span style="color:green">Excellent</span> |
| Interview Value      | <span style="color:green">Excellent</span> |

### Real Production Impact

Terraform state drift is extremely common in enterprise environments.

This occurs when:
- resources are deleted manually
- infrastructure created outside Terraform
- state files become outdated
- import workflows are skipped

If unmanaged, this may:
- break deployments
- recreate infrastructure unexpectedly
- create orphan resources
- cause infrastructure inconsistency

Terraform state reconciliation is a critical DevOps operational skill.

---

## Infrastructure

Provision:

- EC2 Instance
- Terraform State Tracking

---

## Original Terraform State

Terraform state contains:

```text
aws_instance.state_drift_server
```

Terraform expects EC2 instance to exist.

---

## Drift Simulation

After deployment:

Manually delete EC2 instance from AWS Console.

Do not modify Terraform configuration or state file.

---

## Drift Detection Goal

Terraform should detect:
- missing infrastructure
- state mismatch
- deleted resource drift

---

## Learning Objectives

- Understand Terraform state drift
- Detect missing resources
- Learn state reconciliation
- Understand orphaned state problems
- Understand Infrastructure-as-Code consistency
