# Security Group Drift

## Scenario

A production EC2 instance is managed using Terraform.

During production troubleshooting, an engineer manually modifies the Security Group rule directly from AWS Console to temporarily allow public SSH access.

Terraform configuration is not updated.

This creates infrastructure drift and introduces a potential security risk.

---
## Industry Value

| Category | Value |
|---|---|
| Frequency | <span style="color:red">Very High</span> |
| Security Risk | <span style="color:red">Critical</span> |
| Enterprise Relevance | <span style="color:green">Excellent</span> |
| Interview Value | <span style="color:green">Excellent</span> |

### Real Production Impact

Security Group drift is one of the most dangerous and common cloud security issues.

Engineers often temporarily expose:
- SSH ports
- databases
- internal applications

during troubleshooting or emergency incidents.

If not reverted properly, this may lead to:
- public exposure
- brute-force attacks
- compliance violations
- security incidents

Terraform drift detection helps restore Infrastructure-as-Code governance and security posture.

---
## Infrastructure

Provision the following:

- EC2 Instance
- Security Group

---

## Original Security Rule

Terraform-defined SSH access:

```text
22/tcp → 10.0.0.0/24
```

This represents restricted internal access such as:

- VPN network
- Corporate office network
- Bastion subnet

---

## Drift Simulation

After infrastructure deployment:

Manually modify the Security Group rule:

```text
22/tcp → 0.0.0.0/0
```

using:
- AWS Console
OR
- AWS CLI

Do not update Terraform configuration before drift detection.

---

## Security Risk

This change exposes SSH access publicly to the internet.

Potential risks:

- Unauthorized access attempts
- Brute-force attacks
- Compliance violations
- Increased attack surface

---

## Drift Detection Goal

Terraform should detect:

```diff
~ cidr_blocks = [
    - "0.0.0.0/0",
    + "10.0.0.0/24"
]
```

---

## Reconciliation Approaches

### Approach 1 — Revert Security Rules

Restore Security Group rules back to Terraform-defined state.

---

### Approach 2 — Accept Security Change

Update Terraform configuration to match production infrastructure.

This approach should only be used after proper security review and approval.

---

## Learning Objectives

- Understand Terraform security drift
- Detect manual infrastructure changes
- Analyze security impact
- Learn drift reconciliation strategies
- Understand Infrastructure-as-Code governance
