# Execution Steps

## 1. Initialize Terraform

```bash
terraform init
```

---

## 2. Validate Configuration

```bash
terraform validate
```

---

## 3. Preview Infrastructure

```bash
terraform plan
```

---

## 4. Provision Infrastructure

```bash
terraform apply
```

Type:

```text
yes
```

---

## 5. Verify Infrastructure

Verify:

- EC2 instance
- IAM role
- IAM instance profile
- Attached IAM policies

---

## 6. Simulate IAM Drift

Manually attach:

```text
AdministratorAccess
```

to the IAM Role using:
- AWS Console
OR
- AWS CLI

Do not modify Terraform code.

---

## 7. Detect Drift

Run:

```bash
terraform plan
```

Terraform detects unmanaged IAM policy attachment.

---

## 8. Reconcile Drift

### Option A — Revert IAM Policy

Run:

```bash
terraform apply
```

Terraform removes unauthorized policy attachment.

---

### Option B — Accept IAM Change

Add:

```hcl
resource "aws_iam_role_policy_attachment" "admin_access" {
  role       = aws_iam_role.ec2_role.name

  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
```

Then run:

```bash
terraform apply
```

Terraform configuration now matches production infrastructure.

---

## 9. Verify Final State

Run:

```bash
terraform plan
```

Expected:

```text
No changes. Infrastructure is up-to-date.
```

---

## 10. Destroy Infrastructure

```bash
terraform destroy
```
