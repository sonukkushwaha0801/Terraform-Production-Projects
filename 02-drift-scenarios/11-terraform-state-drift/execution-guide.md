# Execution Steps

## 1. Initialize Terraform

```bash
terraform init
```

---

## 2. Apply Infrastructure

```bash
terraform apply
```

---

## 3. Verify Infrastructure

Verify:
- EC2 instance exists
- Terraform state contains instance

Run:

```bash
terraform state list
```

Expected:

```text
aws_instance.state_drift_server
```

---

## 4. Simulate State Drift

From AWS Console:

Delete EC2 instance manually.

Do NOT:
- run terraform destroy
- modify state
- modify Terraform configuration

---

## 5. Detect Drift

Run:

```bash
terraform plan
```

Expected:

```diff
+ aws_instance.state_drift_server will be created
```

Terraform detects missing infrastructure because:
- state expects instance
- AWS no longer has instance

---

## 6. Reconciliation Approaches

### Option A — Recreate Infrastructure

Terraform restores deleted infrastructure.

Run:

```bash
terraform apply
```

Terraform recreates EC2 instance.

---

### Option B — Remove Resource From Terraform

If deletion was intentional:

Remove resource from Terraform state:

```bash
terraform state rm aws_instance.state_drift_server
```

OR remove resource block from configuration.

---

## 7. Verify Final State

Run:

```bash
terraform plan
```

Expected:

```text
No changes. Infrastructure is up-to-date.
```
