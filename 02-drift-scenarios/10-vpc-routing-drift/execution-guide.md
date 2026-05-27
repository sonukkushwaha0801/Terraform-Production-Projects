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

## 3. Verify Networking

Verify:
- VPC exists
- Internet Gateway attached
- Route table configured

---

## 4. Simulate Drift

From AWS Console:

Modify:
- Route table entries
- Internet route target

OR remove:

```text
0.0.0.0/0
```

route completely.

---

## 5. Detect Drift

Run:

```bash
terraform plan
```

Expected:

```diff
~ route modified
```

OR:

```diff
+ route {
    cidr_block = "0.0.0.0/0"
  }
```

Terraform detects routing drift.

---

## 6. Reconcile Drift

### Option A — Revert Routing Drift

```bash
terraform apply
```

---

### Option B — Accept Production Change

Update Terraform networking configuration.

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
