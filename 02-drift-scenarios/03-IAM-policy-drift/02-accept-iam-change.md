# Accept IAM Change

## Overview

In this approach, the production IAM change is accepted as the new desired infrastructure state.

Terraform configuration is updated to match actual AWS IAM configuration.

---

## Current Drift

Terraform-managed policy:

```text
AmazonS3ReadOnlyAccess
```

Manually attached policy:

```text
AdministratorAccess
```

Terraform detects unmanaged IAM policy attachment because infrastructure was modified outside Terraform.

---

## Important Security Warning

This approach is dangerous for IAM-related drift.

Administrative access should only be accepted when:

- Security review is completed
- Proper approvals exist
- Operational requirement is validated
- Governance approval exists

---

## Update Terraform Configuration

Add:

```hcl
resource "aws_iam_role_policy_attachment" "admin_access" {
  role       = aws_iam_role.ec2_role.name

  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
```

---

## Reconcile Terraform

Run:

```bash
terraform apply
```

Terraform configuration now matches production IAM configuration.

---

## Verification

Run:

```bash
terraform plan
```

Expected result:

```text
No changes. Infrastructure is up-to-date.
```

---

## Production Risks

Accepting excessive IAM permissions may introduce:

- Privilege escalation
- Full account compromise risk
- Compliance violations
- Increased attack surface

---

## Enterprise Reality

This approach is sometimes used during:

- Emergency production incidents
- Temporary operational access
- Critical troubleshooting situations

However, excessive permissions should eventually be reduced following least-privilege principles.

---

## Key Learning

Infrastructure reality and Terraform configuration must always converge.

Untracked IAM changes create long-term operational and security risk.
