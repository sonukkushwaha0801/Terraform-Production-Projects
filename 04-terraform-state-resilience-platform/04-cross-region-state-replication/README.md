# Terraform Cross Region State Replication

## Overview

Terraform state is a critical infrastructure asset.

A regional outage affecting the primary state backend can prevent infrastructure deployments, drift detection, and recovery operations.

This project demonstrates how Platform Engineering teams protect Terraform state using Amazon S3 Cross Region Replication (CRR).

---

## Scenario

The primary AWS region becomes unavailable.

The organization requires:

- State Availability
- State Durability
- Multi-Region Recovery
- Governance Validation
- Disaster Recovery Readiness

---

## Architecture Components

### Primary Region

- S3 State Bucket
- DynamoDB Lock Table

### Secondary Region

- Replica State Bucket

### Replication

- Cross Region Replication
- Version Replication
- IAM Replication Role

### Recovery

- Regional Failure Simulation
- Failover Validation
- State Recovery

### Governance

- Checkov Built-In Policies
- Custom Governance Policies

### CI/CD

- GitHub Actions
- Terraform Validation
- Governance Enforcement

---

## AWS Services

- Amazon S3
- Amazon DynamoDB
- IAM
- GitHub Actions

---

## Threat Level

Critical

## Production Frequency

Very High

---

## Skills Demonstrated

- Terraform State Management
- Cross Region Replication
- Multi Region Architecture
- Disaster Recovery
- Governance Automation
- Platform Engineering
