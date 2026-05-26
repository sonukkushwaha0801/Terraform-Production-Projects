# VPC Migration Execution Guide

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
05-vpc-migration/
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
├── outputs.tf
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
region = "ap-south-1"
vpc_id = "vpc-xxxxxxxxxxxxxxxxx"
```

Parameter Details:

| Variable Name | Description           |
| ------------- | --------------------- |
| region        | AWS region of the VPC |
| vpc_id        | Existing VPC ID       |

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

VPC migration may generate:
- VPC configuration
- DNS support configuration
- DNS hostnames configuration
- DHCP option associations
- tags
- computed attributes

Recommended Cleanup:

- Remove unnecessary computed attributes
- Remove duplicated values
- Improve formatting
- Keep configuration production-readable
- Carefully validate CIDR blocks and DNS settings

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
- Import VPC into Terraform state
- Start Terraform management for the existing VPC

Expected Result:

- Existing VPC becomes managed by Terraform
- No resource recreation should occur

---

# Step 5 — Verify Migration

Check Terraform state:

```bash
terraform state list
```

Expected Output:

```text
aws_vpc.main
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

- VPC migration is foundational for networking infrastructure
- Incorrect changes may impact connected infrastructure
- Carefully validate CIDR blocks and DNS configurations
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
