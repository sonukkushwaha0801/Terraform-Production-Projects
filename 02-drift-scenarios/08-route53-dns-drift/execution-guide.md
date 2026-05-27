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

## 3. Verify DNS Record

Verify:
- Route53 record exists
- Correct IP configured

---

## 4. Simulate Drift

From AWS Console:

Modify:
- DNS IP address
- TTL value

---

## 5. Detect Drift

Run:

```bash
terraform plan
```

Expected:

```diff
~ ttl     = 60 -> 300
~ records = ["8.8.8.8"] -> ["1.1.1.1"]
```

---

## 6. Reconcile Drift

### Option A — Revert DNS Drift

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
