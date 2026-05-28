# Public Security Group Governance Automation

# Scenario

A cloud engineering team uses Terraform to provision AWS infrastructure through CI/CD pipelines.

One engineer accidentally creates an AWS Security Group that exposes SSH access publicly to the internet.

Terraform configuration:

```hcl
resource "aws_security_group" "public_ssh_sg" {

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }
}
```

This configuration allows anyone on the internet to attempt SSH access to cloud infrastructure.

In production environments, this is considered a critical security risk.

---

# Real-World Problem

Without governance automation:

* insecure Terraform code may get deployed
* public infrastructure exposure may occur
* attackers can attempt SSH brute-force attacks
* security teams become dependent on manual reviews
* compliance standards may fail
* cloud security posture becomes inconsistent

As engineering teams scale, manual infrastructure review becomes unreliable and difficult to maintain.

Organizations solve this problem using automated governance enforcement inside CI/CD pipelines.

---

# Objective

The objective of this project is to implement governance automation that:

* detects insecure Terraform configurations
* blocks public SSH exposure
* enforces security policies automatically
* prevents insecure infrastructure deployment
* integrates governance validation into CI/CD pipelines

---

# Governance Rule

The following must NOT be allowed:

| Configuration | Restricted Value |
| ------------- | ---------------- |
| Port          | 22               |
| CIDR Block    | 0.0.0.0/0        |

Public SSH access from the internet must always be blocked.

---

# Solution Architecture

This project implements automated governance validation using:

* Terraform
* GitHub Actions
* Checkov
* Custom governance policies

Workflow:

```text
Developer Pushes Terraform Code
                ↓
GitHub Actions Pipeline Starts
                ↓
Terraform Init
                ↓
Terraform Validate
                ↓
Checkov Governance Scan
                ↓
Custom Policy Validation
                ↓
❌ Governance Violation Detected
                ↓
Pipeline Failed
                ↓
Terraform Deployment Blocked
```

---

# Custom Governance Policy

This project uses a custom governance policy:

```text
policies/deny-public-ssh.yaml
```

The policy validates Terraform code and detects insecure public SSH exposure before infrastructure deployment.

---

# Expected Governance Failure

When insecure Terraform code is pushed:

```hcl
cidr_blocks = ["0.0.0.0/0"]
```

The governance pipeline should fail automatically.

Expected result:

```text
❌ Governance Policy Violation Detected

Policy:
deny-public-ssh

Reason:
Public SSH access to 0.0.0.0/0 is not allowed.
```

Infrastructure deployment must be blocked successfully.

---

# Project Structure

```text
01-public-security-group-governance/
├── .github/
│   └── workflows/
│       └── governance.yml
│
├── policies/
│   └── deny-public-ssh.yaml
│
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
│
├── .gitignore
├── task.md
└── execution-guide.md
```

---

# Important Repository Recommendation

This project should be created as a completely separate GitHub repository.

Reason:

GitHub Actions workflows must exist at repository root level:

```text
.github/workflows/
```

Using a separate repository prevents:

* CI/CD conflicts
* workflow collisions
* unintended pipeline triggers
* governance execution issues

---

# Tools Used

| Tool            | Purpose                       |
| --------------- | ----------------------------- |
| Terraform       | Infrastructure provisioning   |
| AWS             | Cloud infrastructure platform |
| GitHub Actions  | CI/CD automation              |
| Checkov         | Governance scanning           |
| Custom Policies | Policy enforcement            |

---

# Concepts Covered

This project demonstrates:

* Terraform governance automation
* Infrastructure policy enforcement
* DevSecOps workflows
* CI/CD governance pipelines
* Shift-left security
* Infrastructure compliance validation
* Security policy automation
* Policy-as-Code fundamentals

---

# Real-World Industry Usage

This governance automation pattern is commonly implemented in:

* FinTech companies
* Banking infrastructure
* Healthcare platforms
* Enterprise AWS environments
* SaaS platforms
* Platform engineering teams
* DevSecOps environments
