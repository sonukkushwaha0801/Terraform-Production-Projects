# AutoScaling Drift

## Scenario

Terraform manages an AWS Auto Scaling Group for production infrastructure.

During a production traffic spike, an engineer manually increases Auto Scaling capacity directly from AWS Console to stabilize the application.

Terraform configuration is not updated.

This creates infrastructure drift between Terraform and AWS.

---

## Industry Value

| Category             | Value                                      |
| -------------------- | ------------------------------------------ |
| Frequency            | <span style="color:red">Very High</span>   |
| Security Risk        | <span style="color:orange">Medium</span>   |
| Enterprise Relevance | <span style="color:green">Excellent</span> |
| Interview Value      | <span style="color:green">Excellent</span> |

### Real Production Impact

Auto Scaling drift is extremely common in production environments.

During incidents or sudden traffic spikes, engineers often manually:
- increase desired capacity
- increase max size
- stabilize applications quickly

without updating Terraform configuration.

If unmanaged, this creates:
- infrastructure inconsistency
- undocumented scaling behavior
- operational governance issues

Terraform drift detection helps reconcile scaling decisions back into Infrastructure-as-Code workflows.

---

## Infrastructure

Provision the following:

- Launch Template
- Auto Scaling Group
- EC2 Instances

---

## Original Scaling Configuration

Terraform-managed scaling:

```text
desired_capacity = 2
max_size         = 4
```

---

## Drift Simulation

After infrastructure deployment:

Manually modify Auto Scaling Group from AWS Console:

```text
desired_capacity = 6
max_size         = 10
```

Do not update Terraform configuration before drift detection.

---

## Operational Impact

Manual scaling may:
- stabilize production traffic
- prevent outages
- increase infrastructure cost
- create governance drift

---

## Drift Detection Goal

Terraform should detect:

- modified desired capacity
- modified maximum capacity
- scaling drift

---

## Reconciliation Approaches

### Approach 1 — Revert Scaling

Restore Auto Scaling configuration back to Terraform-defined values.

---

### Approach 2 — Accept Scaling Change

Update Terraform configuration to match production scaling values.

Only perform this after operational review and approval.

---

## Learning Objectives

- Understand Auto Scaling drift
- Detect operational infrastructure changes
- Learn Terraform scaling reconciliation
- Understand production incident scaling workflows
- Understand Infrastructure-as-Code governance
