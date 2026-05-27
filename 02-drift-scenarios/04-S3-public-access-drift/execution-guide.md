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

- S3 bucket exists
- Public access block enabled
- Bucket is private

---

## 6. Simulate S3 Drift

From AWS Console:

### Disable:

```text
Block all public access
```

---

### Add Public Bucket Policy

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::YOUR_BUCKET_NAME/*"
    }
  ]
}
```

Do not modify Terraform configuration.

---

## 7. Detect Drift

Run:

```bash
terraform plan
```

Terraform detects:

- modified public access block
- unmanaged bucket policy
- public exposure drift

---

## 8. Reconcile Drift

### Option A — Revert Public Access

Run:

```bash
terraform apply
```

Terraform restores secure private bucket configuration.

---

### Option B — Accept Public Access Change

Update Terraform configuration to match production infrastructure.

Add bucket policy and modify public access block configuration.

Then run:

```bash
terraform apply
```

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
