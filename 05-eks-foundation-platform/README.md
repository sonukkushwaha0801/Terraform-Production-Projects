# EKS Foundation Platform

Production-grade Amazon EKS platform engineering projects built with Terraform.

This repository focuses on building, operating, validating, and governing Kubernetes platforms on AWS using Infrastructure as Code principles and enterprise operational practices.

The project simulates how platform engineering teams design secure Kubernetes foundations, implement operational controls, enforce governance policies, and validate platform readiness before onboarding production workloads.

---

## Objectives

* Build a production-grade Amazon EKS foundation
* Implement secure Kubernetes networking
* Deploy managed worker nodes
* Enforce governance and compliance controls
* Enable platform observability
* Validate operational readiness
* Simulate real-world platform engineering responsibilities
* Apply Infrastructure as Code best practices

---

## Projects

### 01-eks-cluster-foundation

Builds the Kubernetes infrastructure foundation.

#### Components

* Amazon VPC
* Public Subnets
* Private Subnets
* Internet Gateway
* NAT Gateway
* Amazon EKS Control Plane
* Managed Node Groups
* IAM Roles
* Security Groups
* CloudWatch Logging

#### Focus Areas

* EKS Provisioning
* Cluster Security
* Networking Design
* IAM Integration
* Governance Controls
* Platform Foundations

---

### 02-eks-platform-operations

Implements Day-2 operational capabilities required to manage production Kubernetes environments.

#### Components

* AWS Load Balancer Controller
* Metrics Server
* CloudWatch Container Insights
* Kubernetes Ingress
* Monitoring Validation
* Governance Validation
* Operational Reporting
* Disaster Recovery Validation

#### Focus Areas

* Platform Operations
* Observability
* Monitoring
* Governance
* Operational Readiness
* Platform Health Validation

---

## Repository Structure

```text
05-eks-foundation-platform/
│
├── 01-eks-cluster-foundation/
│
├── 02-eks-platform-operations/
│
└── README.md
```

---

## Governance Controls

Governance validation is performed using:

* Checkov
* Custom Security Policies

Examples include:

* Require Owner Tags
* Require CostCenter Tags
* Require Logging
* Deny Public Exposure
* Platform Security Validation

Validation Command:

```bash
checkov -d . --external-checks-dir policies
```

---

## Operational Validation

Platform operations include validation of:

* Cluster Health
* Node Group Health
* ALB Controller
* Metrics Server
* CloudWatch Monitoring
* Workload Health
* Governance Compliance
* Disaster Recovery Readiness

---

## Skills Demonstrated

### Terraform

* Infrastructure as Code
* AWS Resource Provisioning
* Governance Validation
* Platform Automation

### Kubernetes

* Amazon EKS
* Cluster Operations
* Ingress Management
* Monitoring

### Platform Engineering

* Platform Foundations
* Operational Readiness
* Governance Enforcement
* Day-2 Operations

### DevOps

* GitHub Actions
* Validation Pipelines
* Security Scanning
* Automated Compliance

---

## Production Considerations

This repository uses local Terraform state for simplicity.

For production deployments consider implementing:

* S3 Remote Backend
* DynamoDB State Locking
* Multi-Account Architecture
* Centralized Logging
* Centralized Monitoring
* Automated Policy Enforcement
* GitOps Workflows

---

## Validation Workflow

```text
Developer
        │
        ▼

Git Push
        │
        ▼

GitHub Actions
        │
        ▼

Terraform Validation
        │
        ▼

Checkov Validation
        │
        ▼

Governance Validation
        │
        ▼

Terraform Apply
        │
        ▼

EKS Deployment
        │
        ▼

Operational Validation
        │
        ▼

Production Ready Platform
```

---

## Key Learning Outcomes

By completing this project series you will gain hands-on experience with:

* Amazon EKS Foundations
* Kubernetes Platform Engineering
* Terraform Governance
* Infrastructure Validation
* Platform Operations
* Observability
* Security Controls
* Operational Runbooks
* Enterprise DevOps Practices

---

## Portfolio Value

This project demonstrates capabilities commonly expected from:

* DevOps Engineers
* Cloud Engineers
* Infrastructure Engineers
* Platform Engineers
* Site Reliability Engineers

The focus is not only on provisioning infrastructure, but also on operating, governing, validating, and maintaining production-ready Kubernetes platforms.
