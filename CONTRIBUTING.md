# Contributing

Before you start
- Create a branch named: feat/<short-description> or fix/<short-description>
- Run terraform fmt and terraform validate in the repository root and in modules.

Commits & PRs
- Provide clear commit messages.
- Open a pull request with a description of the change and testing steps.
- Tag reviewers for the module(s) changed.

Code standards
- Terraform files must follow Terraform style and be formatted with `terraform fmt`.
- Validate plans: `terraform init && terraform plan`.
- Use modules for reusable infrastructure components.

Testing
- Use linting tools (e.g., tflint) and static checks.
- If you introduce modules, add basic tests with terratest or remote validation where possible.

Merging
- PRs should have at least one approval and pass CI checks.

Security
- Never commit secrets. Use environment variables, cloud secret stores, or Terraform Cloud workspace variables.
