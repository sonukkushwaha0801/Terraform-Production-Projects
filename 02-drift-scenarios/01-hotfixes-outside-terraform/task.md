# Hotfixes Outside Terraform

## Scenario

A production EC2 instance is managed using Terraform.

During a production incident, an engineer manually modified the EC2 instance type directly from AWS Console without updating Terraform configuration.

This introduced infrastructure drift between:

- Terraform configuration
- Terraform state
- Actual AWS infrastructure

Your task is to:

1. Provision infrastructure using Terraform
2. Simulate a production hotfix outside Terraform
3. Detect infrastructure drift
4. Analyze Terraform plan output
5. Reconcile infrastructure safely

---

## Infrastructure

Provision the following:

- EC2 Instance
- Security Group

---

## Drift Simulation

After infrastructure deployment:

Manually change the EC2 instance type:

```text id="77rt7g"
t2.micro → t3.small
