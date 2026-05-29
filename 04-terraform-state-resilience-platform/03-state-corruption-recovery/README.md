# Terraform State Corruption Recovery

## Overview

Terraform state corruption is a critical operational risk that can prevent Terraform from accurately managing infrastructure resources.

This project demonstrates how Platform Engineering teams detect state corruption, restore previous state versions, validate infrastructure integrity, and enforce governance controls.

---

## Scenario

A corrupted Terraform state file is uploaded into the remote state backend.

Terraform can no longer track resources correctly, creating:

- Infrastructure Drift
- Deployment Failures
- Resource Duplication Risk
- State Inconsistency

The team must:

- Detect Corruption
- Recover Healthy State
- Validate Recovery
- Ensure Governance Compliance

---

## Architecture Components

### State Storage

- Amazon S3
- Versioning Enabled
- Encryption Enabled
- Public Access Blocked

### State Locking

- Amazon DynamoDB
- Concurrent Change Protection

### Infrastructure

- Amazon EC2

### Recovery Operations

- Corruption Simulation
- State Restoration
- Recovery Validation

### Governance

- Checkov Built-In Policies
- Custom Checkov Policies

### CI/CD

- GitHub Actions
- Terraform Validation
- Governance Enforcement

---

## AWS Services

- Amazon S3
- Amazon DynamoDB
- Amazon EC2
- IAM

---

## Threat Level

Critical

## Production Frequency

High

---

## Skills Demonstrated

- Terraform State Management
- Disaster Recovery
- State Corruption Handling
- Infrastructure Recovery
- Governance Automation
- CI/CD Validation
- Platform Engineering
