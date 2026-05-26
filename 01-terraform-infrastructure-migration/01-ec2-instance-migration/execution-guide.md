# EC2 Instance Migration Execution Guide

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
01-ec2-instance-migration/
├── scripts/
│   ├── migrate.sh
│   └── state-file.sh
├── task.md
├── execution-guide.md
├── .gitignore
├── import.tf
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
region                  = "ap-south-1"
instance_id             = "i-xxxxxxxxxxxxx"
instance_reference_name = "migrated_server"
```

Parameter Details:

| Variable Name           | Description                       |
| ----------------------- | --------------------------------- |
| region                  | AWS region of the EC2 instance    |
| instance_id             | Existing EC2 instance ID          |
| instance_reference_name | Terraform resource reference name |

# Step 2 — Generate Terraform Configuration

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

# Step 4 — Refactor Generated Configuration

Open generated configuration:
Refactor and clean the generated configuration.

```text
main.tf
```

Recommended Cleanup:

- Remove unnecessary computed attributes
- Remove duplicated values
- Improve formatting
- Keep configuration production-readable

---

# Step 5 — Validate Terraform Configuration

Run:

```bash
terraform fmt -recursive
terraform validate
```

Optional verification:

```bash
terraform plan
```

Expected Result:

- No validation errors
- No unintended infrastructure changes

---

# Step 6 — Import Infrastructure into Terraform State

Run:

```bash
bash scripts/state-file.sh
```

This will:

- Validate Terraform configuration
- Import EC2 instance into Terraform state
- Start Terraform management for the existing EC2 instance

Expected Result:

- Existing EC2 instance becomes managed by Terraform
- No resource recreation should occur

---

# Step 7 — Verify Migration

Check Terraform state:

```bash
terraform state list
```

Expected Output:

```text
aws_instance.migrated_server
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

- This project only performs Terraform migration
- Remote backend is intentionally excluded
- State locking is intentionally excluded
- Infrastructure must already exist before migration
- Always review generated Terraform configuration before import
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
