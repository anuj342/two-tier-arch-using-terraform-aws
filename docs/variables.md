# Variables Reference

Common variables used by this project:

- region (string) — Cloud region. Example: "us-east-1"
- environment (string) — dev, staging, prod
- vpc_cidr (string) — VPC CIDR. Example: "10.0.0.0/16"
- public_subnets (list) — List of public subnet CIDRs
- private_subnets (list) — List of private subnet CIDRs
- instance_type (string) — Web server instance type. Example: "t3.small"
- ssh_key_name (string) — SSH key name for bastion/instance access
- db_engine (string) — Example: "postgres"
- db_username (string) — Database admin user (do not commit secrets)
- db_password (string) — Database password (use secrets manager)

Best practices
- Put sensitive variables in terraform cloud workspace variables or an external secret manager (AWS Secrets Manager, SSM Parameter Store).
- Keep environment values in `envs/<env>.tfvars`.
