# Security Best Practices

Repository hygiene
- Add a `.gitignore` at the project root to prevent secrets and state files from being committed.
- Ensure the following file types and locations are ignored:
  - Terraform state files: *.tfstate, *.tfstate.backup
  - Local variable files: terraform.tfvars, envs/*.tfvars, *.tfvars.json
  - Provider/credentials files: credentials, azureProfile.json, kubeconfig
  - Keys and certs: *.pem, *.key, *.crt, *.p12, *.jks, *.pfx
  - Local overrides and crash logs: override.tf, crash.log
  - Environment files: .env, .env.*
  - IDE/editor and OS files: .vscode/, .idea/, .DS_Store

Secrets & credentials
- Never commit secrets or passwords. Use:
  - Cloud secret managers (e.g., AWS Secrets Manager, SSM Parameter Store)
  - Terraform Cloud workspace variables (sensitive)
  - CI/CD pipeline secrets
- Prefer referencing secrets at runtime or using secure variables.

Example safe workflow
- Keep `envs/dev.tfvars.example` in the repo with placeholders.
- Add `envs/dev.tfvars` to `.gitignore` and populate with real secrets only on trusted machines or CI secrets.

IAM & Roles
- Use least privilege IAM roles for compute and automation.
- Prefer short-lived credentials with appropriate scoped permissions.

Network & encryption
- Restrict SSH and admin access to a trusted IP range (bastion host if needed).
- Enable encryption in transit (TLS) and at rest (DB encryption, encrypted EBS).
- Enable VPC Flow Logs, CloudTrail, and log aggregation for auditing.

Automation & scanning
- Run static checks and security scanning in CI: tflint, checkov, tfsec.
- Regularly rotate keys and certificates.
