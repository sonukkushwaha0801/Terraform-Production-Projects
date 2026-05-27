# Load Balancer Listener Drift

## Scenario

Terraform manages an Application Load Balancer listener configuration.

During production troubleshooting, an engineer manually changes listener configuration directly from AWS Console.

Terraform configuration is not updated.

This creates:
- infrastructure drift
- traffic routing inconsistency
- security drift

---

## Industry Value

| Category             | Value                                      |
| -------------------- | ------------------------------------------ |
| Frequency            | <span style="color:red">High</span>        |
| Security Risk        | <span style="color:red">High</span>        |
| Enterprise Relevance | <span style="color:green">Excellent</span> |
| Interview Value      | <span style="color:green">Excellent</span> |

### Real Production Impact

Load Balancer drift is common during:
- emergency troubleshooting
- SSL migrations
- traffic rerouting
- temporary maintenance

Manual listener modifications may:
- expose insecure HTTP traffic
- bypass routing policies
- break production traffic flow

Terraform drift detection helps maintain consistent traffic governance.

---

## Infrastructure

Provision:

- Application Load Balancer
- Target Group
- HTTP Listener

---

## Original Terraform Configuration

```text
Listener Port = 80
Protocol      = HTTP
```

---

## Drift Simulation

From AWS Console:

Modify:
```text
Port     = 8080
Protocol = HTTPS
```

Do not update Terraform configuration before drift detection.

---

## Drift Detection Goal

Terraform should detect:
- modified listener port
- modified protocol
- listener configuration drift

---

## Learning Objectives

- Understand ALB listener drift
- Learn Terraform reconciliation
- Understand traffic governance
- Detect production routing drift
