# Terraform Usage

Backend & State
- Configure a remote backend (S3 + DynamoDB lock for AWS) or Terraform Cloud to keep state safe and shareable.
- Example backend in `backend.tf`:
  - s3 bucket, key per environment, and DDB for state locking.

Basic commands
- terraform init
- terraform validate
- terraform plan -var-file=envs/dev.tfvars -out=tfplan
- terraform apply tfplan
- terraform destroy -var-file=envs/dev.tfvars

Workspaces
- Use workspaces or separate state buckets for environments (dev, staging, prod).

Variables
- Use `envs/*.tfvars` files to store per-environment settings.
- For secrets, avoid tfvars committed to repo. Use workspace variables or a secret manager.

Example
- terraform init
- terraform plan -var-file=envs/dev.tfvars
- terraform apply -var-file=envs/dev.tfvars

Tips
- Use `terraform fmt` and `terraform validate` in CI.
- Use `terraform state` and `terraform import` if you manage existing infra.
