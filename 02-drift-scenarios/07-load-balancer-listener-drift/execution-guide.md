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

## 3. Simulate Drift

From AWS Console:

Modify:
- Listener Port
- Listener Protocol

---

## 4. Detect Drift

```bash
terraform plan
```

Expected:

```diff
~ port     = 8080 -> 80
~ protocol = HTTPS -> HTTP
```

---

## 5. Reconcile

### Option A — Revert Drift

```bash
terraform apply
```

---

### Option B — Accept Production Change

Update Terraform listener configuration.

Then:

```bash
terraform apply
```

---

## 6. Verify

```bash
terraform plan
```

Expected:

```text
No changes. Infrastructure is up-to-date.
```
