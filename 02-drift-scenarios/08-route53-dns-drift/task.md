# Route53 DNS Drift

## Scenario

Terraform manages production Route53 DNS records.

During migration or incident handling, an engineer manually changes DNS records directly from AWS Console.

Terraform configuration is not updated.

This creates:
- infrastructure drift
- traffic routing inconsistency
- DNS governance drift

---

## Industry Value

| Category             | Value                                      |
| -------------------- | ------------------------------------------ |
| Frequency            | <span style="color:red">High</span>        |
| Security Risk        | <span style="color:orange">Medium</span>   |
| Enterprise Relevance | <span style="color:green">Excellent</span> |
| Interview Value      | <span style="color:green">Excellent</span> |

### Real Production Impact

DNS drift is extremely common during:
- production migrations
- disaster recovery
- failover operations
- temporary traffic rerouting

Manual DNS changes may:
- route traffic incorrectly
- break applications
- bypass governance workflows
- create undocumented production state

Terraform drift detection helps restore DNS governance consistency.

---

## Cost & Service Note

> ⚠️ AWS Route53 Hosted Zones are not included in the AWS Free Tier.
>
> Creating public hosted zones may incur charges even on new AWS accounts.
>
> This project was designed for production-grade Terraform drift learning and may require a paid AWS account for full execution.
>
> The Terraform implementation and drift workflow are written according to actual AWS and Terraform behavior.

---

## Infrastructure

Provision:

- Route53 Hosted Zone Record
- DNS A Record

---

## Original Terraform Configuration

```text
DNS Record IP = 1.1.1.1
TTL            = 300
```

---

## Drift Simulation

From AWS Console:

Modify:
```text
DNS Record IP = 8.8.8.8
TTL            = 60
```

Do not update Terraform configuration before drift detection.

---

## Drift Detection Goal

Terraform should detect:
- modified DNS record
- modified TTL
- DNS routing drift

---

## Learning Objectives

- Understand DNS drift
- Learn Route53 reconciliation
- Detect traffic routing inconsistencies
- Understand DNS governance
