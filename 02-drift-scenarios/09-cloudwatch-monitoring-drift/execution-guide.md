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

## 3. Verify Alarm

Verify:
- CloudWatch alarm exists
- CPU threshold configured correctly

---

## 4. Simulate Drift

From AWS Console:

Modify:
- Threshold
- Evaluation periods

---

## 5. Detect Drift

Run:

```bash
terraform plan
```

Expected:

```diff
~ threshold          = 95 -> 70
~ evaluation_periods = 5 -> 2
```

---

## 6. Reconcile Drift

### Option A — Revert Monitoring Drift

```bash
terraform apply
```

---

### Option B — Accept Production Change

Update Terraform configuration.

Then:

```bash
terraform apply
```

---

## 7. Verify

```bash
terraform plan
```

Expected:

```text
No changes. Infrastructure is up-to-date.
```
