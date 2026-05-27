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

- Launch Template
- Auto Scaling Group
- EC2 instances
- Desired capacity

---

## 6. Simulate AutoScaling Drift

From AWS Console:

Modify:

```text
desired_capacity = 6
max_size = 10
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
~ desired_capacity = 6 -> 2
~ max_size         = 10 -> 4
```

Terraform detects Auto Scaling drift.

---

## 8. Reconcile Drift

### Option A — Revert Scaling

Run:

```bash
terraform apply
```

Terraform restores original Auto Scaling configuration.

---

### Option B — Accept Production Scaling

Update:

```hcl
desired_capacity = 2
max_size         = 4
```

to:

```hcl
desired_capacity = 6
max_size         = 10
```

Then run:

```bash
terraform apply
```

Terraform configuration now matches production scaling state.

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
