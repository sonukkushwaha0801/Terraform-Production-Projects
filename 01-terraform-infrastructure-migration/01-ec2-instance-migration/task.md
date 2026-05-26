# EC2 Instance Migration to Terraform

## Scenario

One of your teammates manually created an EC2 instance in AWS using the AWS Management Console.

The infrastructure is currently unmanaged and exists outside Infrastructure as Code practices.

Your task is to migrate the existing EC2 instance into Terraform management without recreating or modifying the instance manually.

The objective is to:
- Import the existing EC2 instance into Terraform state
- Generate Terraform configuration from the existing infrastructure
- Refactor the generated configuration into production-readable Terraform code
- Manage the existing infrastructure using Terraform going forward

## Requirements

- Use Terraform import block-based migration workflow
- Use `terraform plan -generate-config-out`
- Generate Terraform configuration automatically
- Refactor generated configuration into clean `main.tf`
- Maintain existing infrastructure without recreation
- Validate Terraform configuration before import

## Constraints

- Do NOT create a new EC2 instance
- Do NOT destroy or recreate infrastructure
- Do NOT configure remote backend
- Do NOT implement state locking
- Do NOT use Terraform modules for this scenario
- Keep the migration local-only

## Expected Outcome

After successful migration:

- Existing EC2 instance should be managed by Terraform
- Terraform state should track the EC2 instance
- Infrastructure changes should be visible through Terraform plan
- Configuration should be production-readable and maintainable
