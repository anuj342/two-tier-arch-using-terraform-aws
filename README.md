# Two-tier Terraform Architecture

Overview
- Two-tier architecture (web/application tier + data tier) implemented with Terraform.
- Infrastructure-as-Code that provisions networking, compute, load balancing, and database resources.

Quick Start
1. Install Terraform (recommended version pinned in .terraform-version).
2. Configure credentials for your cloud provider (e.g., AWS profile or environment variables).
3. Initialize and plan:
   - terraform init
   - terraform plan -var-file=envs/dev.tfvars
4. Apply:
   - terraform apply -var-file=envs/dev.tfvars

Repository layout
- main.tf, variables.tf, outputs.tf — root Terraform config
- modules/ — reusable Terraform modules (vpc, ecs/asg, rds)
- envs/ — per-environment tfvars
- docs/ — project documentation

Documentation
- docs/architecture.md — architecture overview and diagram
- docs/terraform-usage.md — how to run Terraform and backend details
- docs/variables.md — variable reference
- docs/security.md — security and secrets guidance
- CONTRIBUTING.md — contribution guidelines

Support
- For questions, open an issue or contact the team owning this repo.

Architecture
<img width="936" height="768" alt="Screenshot 2025-12-01 104432" src="https://github.com/user-attachments/assets/428af429-85ab-491b-8f4f-10310792300b" />
