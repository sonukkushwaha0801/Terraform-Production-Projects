# Terraform Drift Detection Scenarios

Production-grade Terraform drift detection and reconciliation projects focused on real-world DevOps, Cloud Governance, Security, and Infrastructure Operations.

This repository demonstrates how infrastructure drift occurs in enterprise environments, how Terraform detects drift, and how teams reconcile infrastructure back into Infrastructure-as-Code governance.

---

# What is Infrastructure Drift?

Infrastructure drift occurs when actual cloud infrastructure no longer matches Terraform configuration or Terraform state.

This usually happens when:
- engineers make manual changes in AWS Console
- emergency hotfixes bypass Terraform
- resources are deleted manually
- scaling changes occur during incidents
- cloud teams modify infrastructure outside IaC workflows

Terraform drift detection helps identify:
- security drift
- configuration drift
- operational drift
- governance drift
- Terraform state mismatch

---

# Why This Repository Exists

Most Terraform repositories only show:
- provisioning
- modules
- infrastructure creation

But real enterprise DevOps work involves:
- infrastructure governance
- production reconciliation
- incident-driven changes
- operational recovery
- state consistency
- compliance enforcement

This repository focuses on:
```text
Production Drift Engineering
```

---

# Drift Detection Projects

| #   | Project                      | Drift Type                  | Industry Frequency | Security Risk | Difficulty   |
| --- | ---------------------------- | --------------------------- | ------------------ | ------------- | ------------ |
| 01  | Hotfixes Outside Terraform   | Configuration Drift         | Very High          | Medium        | Beginner     |
| 02  | Security Group Drift         | Security Drift              | Very High          | Critical      | Intermediate |
| 03  | IAM Policy Drift             | IAM / Permission Drift      | Very High          | Critical      | Intermediate |
| 04  | S3 Public Access Drift       | Storage Security Drift      | High               | Critical      | Intermediate |
| 05  | AutoScaling Drift            | Operational Scaling Drift   | Very High          | Medium        | Intermediate |
| 06  | RDS Configuration Drift      | Database / Compliance Drift | Very High          | Critical      | Advanced     |
| 07  | Load Balancer Listener Drift | Traffic Routing Drift       | High               | High          | Advanced     |
| 08  | Route53 DNS Drift            | DNS Routing Drift           | High               | Medium        | Intermediate |
| 09  | CloudWatch Monitoring Drift  | Observability Drift         | High               | Medium        | Intermediate |
| 10  | VPC Routing Drift            | Networking Drift            | High               | Critical      | Advanced     |
| 11  | Terraform State Drift        | Terraform State Drift       | Very High          | Medium        | Advanced     |

---

# What You Learn

This repository teaches real-world production concepts:

## Infrastructure Governance

- Terraform as source of truth
- Infrastructure reconciliation
- Change management workflows
- Operational governance

---

## Security Operations

- IAM drift detection
- Security group exposure
- Public storage exposure
- Networking misconfiguration

---

## Terraform Operations

- terraform plan
- terraform apply
- terraform state rm
- state reconciliation
- drift detection workflows

---

## Production DevOps Thinking

Learn:
- when to revert changes
- when to accept production drift
- how emergency operations affect IaC
- how governance works in enterprise environments

---

# Reconciliation Strategies

Every project demonstrates two real-world approaches:

## 1. Revert Drift

Terraform restores infrastructure back to desired state.

Used when:
- changes were temporary
- governance requires strict IaC ownership
- security policies must be enforced

---

## 2. Accept Production Change

Terraform configuration is updated to match actual production infrastructure.

Used when:
- production change becomes permanent
- scaling requirements evolve
- migrations are finalized
- operational review approves changes

---

# Repository Structure

```text
02-drift-scenarios/
├── 01-hotfixes-outside-terraform/
├── 02-security-group-drift/
├── 03-iam-policy-drift/
├── 04-s3-public-access-drift/
├── 05-autoscaling-drift/
├── 06-rds-configuration-drift/
├── 07-load-balancer-listener-drift/
├── 08-route53-dns-drift/
├── 09-cloudwatch-monitoring-drift/
├── 10-vpc-routing-drift/
└── 11-terraform-state-drift/
```

---

# Architecture & Workflow Diagrams

Each project includes:

- architecture.png
- workflow.png

These visualize:
- Terraform desired state
- Actual AWS state
- Manual drift changes
- Drift detection workflow
- Reconciliation process

---

# Enterprise Reality

One important production lesson:

```text
Not all drift is bad.
```

Sometimes manual changes:
- prevent outages
- stabilize traffic
- fix incidents
- support emergency recovery

The real engineering challenge is:

```text
How to reconcile production reality back into Infrastructure-as-Code governance.
```

That is what this repository teaches.

---

# Security Warning

Some projects intentionally use:
- hardcoded demo values
- simplified Terraform configuration
- learning-focused credentials

This is done for:
```text
Educational and demonstration purposes only.
```

Production environments should use:
- AWS Secrets Manager
- SSM Parameter Store
- Vault
- encrypted remote state
- CI/CD secret management

Never commit real secrets into Git repositories.

---

# Recommended Skills Before Starting

Recommended knowledge:
- Terraform fundamentals
- AWS basics
- VPC networking
- EC2
- IAM
- Route53
- CloudWatch

---

# Best Way To Use This Repository

Recommended workflow:

1. Deploy infrastructure
2. Create manual drift from AWS Console
3. Run:
   ```bash
   terraform plan
   ```
4. Analyze drift
5. Reconcile infrastructure
6. Verify final state

This simulates real production DevOps operations.

---

# Portfolio Value

This repository demonstrates:
- production Terraform operations
- infrastructure governance
- operational troubleshooting
- security awareness
- advanced DevOps thinking
- cloud reconciliation workflows

Very strong portfolio for:
- DevOps Engineer
- Cloud Engineer
- Platform Engineer
- SRE
- Infrastructure Engineer

---

# Future Improvements Ideas

You can further extend this repository with:

## Advanced Terraform Topics

- Remote state drift
- Multi-account drift
- Terraform Cloud drift detection
- Atlantis integration
- Drift detection pipelines

---

## CI/CD Automation

- GitHub Actions drift detection
- Scheduled terraform plan jobs
- Slack drift notifications
- Automated reconciliation approvals

---

## Security Enhancements

- tfsec integration
- Checkov integration
- OPA / Sentinel policies
- AWS Config integration

---

## Enterprise Governance

- Change approval workflows
- Drift auditing
- Compliance reporting
- Infrastructure policy enforcement

---

# Final Thought

Provisioning infrastructure is easy.

Maintaining:
- consistency
- governance
- operational stability
- production alignment

is the real challenge.

That is where Terraform drift engineering becomes valuable.
