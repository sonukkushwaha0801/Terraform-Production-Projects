# Security Group Migration Execution Guide

## Prerequisites

Ensure the following tools are installed:

- Terraform >= 1.5
- AWS CLI

Verify installation:

```bash
terraform -version
aws --version
```

Verify AWS authentication:

```bash
aws sts get-caller-identity
```

---

# Project Structure

```text
04-security-group-migration/
├── scripts/
│   ├── migrate.sh
│   └── state-file.sh
├── task.md
├── execution-guide.md
├── images/
│   └── migration-architecture.png
├── .gitignore
├── import.tf
├── main.tf
├── provider.tf
├── terraform.tfvars
├── variables.tf
└── versions.tf
```

---

# Step 1 — Configure Terraform Variables

Open:

```text
terraform.tfvars
```

Update values:

```hcl
region            = "ap-south-1"
security_group_id = "sg-xxxxxxxxxxxxxxxxx"
```

Parameter Details:

| Variable Name     | Description                      |
| ----------------- | -------------------------------- |
| region            | AWS region of the Security Group |
| security_group_id | Existing Security Group ID       |

---

# Step 2 — Initialize Terraform & Generate Terraform Configuration

Run migration utility:

```bash
bash scripts/migrate.sh
```

This script will:

- Terraform initialized successfully
- AWS provider downloaded
- Initialize Terraform
- Validate Terraform configuration
- Generate Terraform configuration automatically

Generated configuration location:

```text
main.tf
```

---

# Step 3 — Refactor Generated Configuration

Open:

```text
main.tf
```

Review generated configuration carefully.

Security Group migration may generate:
- ingress rules
- egress rules
- IPv4 CIDR rules
- IPv6 CIDR rules
- security group references
- computed attributes

Recommended Cleanup:

- Remove unnecessary computed attributes
- Remove duplicated values
- Improve formatting
- Keep configuration production-readable
- Carefully validate ingress and egress rules

Goal:
- Maintain clean and manageable Terraform code

---

# Step 4 — Validate Terraform Configuration & Import Infrastructure into Terraform State

Run:

```bash
bash scripts/state-file.sh
```

This will:

- No validation errors
- No unintended infrastructure changes
- Validate Terraform configuration
- Import Security Group into Terraform state
- Start Terraform management for the existing Security Group

Expected Result:

- Existing Security Group becomes managed by Terraform
- No resource recreation should occur

---

# Step 5 — Verify Migration

Check Terraform state:

```bash
terraform state list
```

Expected Output:

```text
aws_security_group.main
```

Verify infrastructure drift:

```bash
terraform plan
```

Expected Result:

```text
No changes. Infrastructure is up-to-date.
```

---

# Important Notes

- Security Group migration is highly sensitive
- Incorrect rule cleanup may expose infrastructure publicly
- Always review ingress and egress rules carefully
- This project only performs Terraform migration
- Remote backend is intentionally excluded
- State locking is intentionally excluded
- Infrastructure must already exist before migration
- Never commit Terraform state files to Git

---

# Verify Ignored Files

Ensure these files are ignored:

```text
.terraform/
*.tfstate
*.tfstate.*
```

Verify Git status:

```bash
git status
```

Terraform state files should not appear in Git tracking.
