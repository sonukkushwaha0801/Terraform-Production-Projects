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

- RDS instance
- backup retention
- public accessibility
- deletion protection
- storage encryption

---

## 6. Simulate RDS Drift

From AWS Console:

Modify:

```text
allocated_storage       = 100
backup_retention_period = 0
publicly_accessible     = true
```

Do not modify Terraform configuration.

---

## 7. Detect Drift

Run:

```bash
terraform plan
```

Expected drift:

```diff
~ allocated_storage       = 100 -> 20
~ backup_retention_period = 0 -> 7
~ publicly_accessible     = true -> false
```

Terraform detects RDS configuration drift.

---

## 8. Reconcile Drift

### Option A — Revert Configuration

Run:

```bash
terraform apply
```

Terraform restores secure RDS configuration.

---

### Option B — Accept Production Change

Update:

```hcl
allocated_storage       = 20
backup_retention_period = 7
publicly_accessible     = false
```

to:

```hcl
allocated_storage       = 100
backup_retention_period = 0
publicly_accessible     = true
```

Then run:

```bash
terraform apply
```

Terraform configuration now matches production database configuration.

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
