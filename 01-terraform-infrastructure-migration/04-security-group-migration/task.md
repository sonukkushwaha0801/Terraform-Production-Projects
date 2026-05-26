# Security Group Migration to Terraform

## Scenario

One of your teammates manually created a Security Group in AWS using the AWS Management Console.

The Security Group is currently unmanaged and exists outside Infrastructure as Code practices.

Your task is to migrate the existing Security Group into Terraform management without recreating or modifying the infrastructure manually.

The objective is to:
- Import the existing Security Group into Terraform state
- Generate Terraform configuration from existing infrastructure
- Refactor generated configuration into production-readable Terraform code
- Manage the Security Group using Terraform going forward

## Requirements

- Use Terraform import block-based migration workflow
- Use `terraform plan -generate-config-out`
- Generate Terraform configuration automatically
- Refactor generated configuration into clean `main.tf`
- Maintain existing infrastructure without recreation
- Validate Terraform configuration before import

## Constraints

- Do NOT create a new Security Group
- Do NOT destroy or recreate infrastructure
- Do NOT configure remote backend
- Do NOT implement state locking
- Do NOT use Terraform modules for this scenario
- Keep the migration local-only

## Expected Outcome

After successful migration:

- Existing Security Group should be managed by Terraform
- Terraform state should track the Security Group
- Infrastructure changes should be visible through Terraform plan
- Configuration should be production-readable and maintainable
