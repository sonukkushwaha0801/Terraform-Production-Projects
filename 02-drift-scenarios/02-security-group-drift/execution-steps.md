# Execution Steps

## 1. Initialize Terraform

```bash
terraform init
```

---

## 2. Validate Terraform Configuration

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
- Security Group
- SSH rule
- Public IP

---

## 6. Simulate Security Group Drift

Manually modify Security Group rule:

```text
22/tcp → 0.0.0.0/0
```

using:
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

Expected drift:

```diff
~ cidr_blocks = [
    - "0.0.0.0/0",
    + "10.0.0.0/24"
]
```

Terraform detects Security Group drift because infrastructure was modified outside Terraform.

---

## 8. Reconcile Drift

### Option A — Revert Security Rules

Restore Security Group configuration back to Terraform-defined state:

```bash
terraform apply
```

---

### Option B — Accept Production Security Change

Update:

```hcl
allowed_ssh_cidr = "10.0.0.0/24"
```

to:

```hcl
allowed_ssh_cidr = "0.0.0.0/0"
```

Then run:

```bash
terraform apply
```

Terraform configuration now matches production infrastructure.

---

## 9. Verify Reconciliation

Run:

```bash
terraform plan
```

Expected result:

```text
No changes. Infrastructure is up-to-date.
```

---

## 10. Destroy Infrastructure

```bash
terraform destroy
```
