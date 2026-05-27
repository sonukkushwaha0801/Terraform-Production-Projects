# VPC Routing Drift

## Scenario

Terraform manages VPC route table configuration for production networking infrastructure.

During troubleshooting or migration activity, an engineer manually modifies route table entries directly from AWS Console.

Terraform configuration is not updated.

This creates:
- networking drift
- traffic routing inconsistency
- security exposure risk

---

## Industry Value

| Category             | Value                                      |
| -------------------- | ------------------------------------------ |
| Frequency            | <span style="color:red">High</span>        |
| Security Risk        | <span style="color:red">Critical</span>    |
| Enterprise Relevance | <span style="color:green">Excellent</span> |
| Interview Value      | <span style="color:green">Excellent</span> |

### Real Production Impact

VPC routing drift is one of the most dangerous infrastructure drift scenarios.

Engineers sometimes manually:
- modify internet routes
- change NAT routing
- redirect traffic
- alter subnet routing

during:
- migrations
- failovers
- troubleshooting
- emergency recovery

If unmanaged, this may:
- expose private infrastructure publicly
- break production connectivity
- bypass network governance
- create security vulnerabilities

Terraform drift detection helps maintain networking governance consistency.

---

## Infrastructure

Provision:

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Route Table Association

---

## Original Terraform Configuration

```text
0.0.0.0/0 → Internet Gateway
```

---

## Drift Simulation

From AWS Console:

Modify route table:
- remove default route
OR
- change gateway target manually

Do not update Terraform configuration before drift detection.

---

## Drift Detection Goal

Terraform should detect:
- modified route table
- missing internet route
- networking drift

---

## Learning Objectives

- Understand VPC routing drift
- Learn Terraform networking reconciliation
- Detect traffic routing inconsistencies
- Understand network governance
