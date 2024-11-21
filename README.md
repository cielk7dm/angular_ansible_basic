# AWS EC2 + Angular + Docker + Ansible + Terragrunt + GitHub Actions

This monorepo demonstrates an example of a GitOps CI/CD workflow using GitHub Actions.

> **Note:** This is not a production-ready pipeline. It serves as a proof of concept.

---

## Requirements

Before proceeding, ensure you have the following:

- A GitHub account.
- Terraform or OpenTofu.
- Terragrunt.
- Ansible.
- Docker and Docker Compose.
- A sample Angular application.
- An AWS account.

---

## Steps to Set Up

1. **Create an IAM Role for OIDC:**
   - Create an IAM Role in AWS for OpenID Connect (OIDC) authentication.

2. **Set Up an OIDC Identity Provider:**
   - Configure your GitHub repository to authenticate with AWS using OIDC.

3. **Add Secrets to Your GitHub Repository:**
   - Add the following secrets to your repository:
     - `AWS_REGION`: The AWS region where your resources will be deployed.
     - `ROLE_ARN`: The ARN of the IAM Role for OIDC.
     - `PRIVATE_KEY`: Your EC2 private SSH key for Ansible.

4. **Generate a GitHub Classic Token:**
   - Create a GitHub token with `read` and `write` permissions.

---

## GitHub Actions Workflow

- Make changes to the Angular application or Terragrunt code. This will trigger the GitHub Actions workflows.
- The workflows will follow a step-by-step approach:
  1. **Start with VPC creation.**
  2. **Provision SSH keys.**
  3. **Deploy the EC2 instance.**
  4. **Change app code.**

---

## Command Line Usage

### Terragrunt

Navigate to the directory containing the relevant resource where `terragrunt.hcl` file resides and run:

```bash
terragrunt plan    # To preview changes
terragrunt apply   # To apply changes
terragrunt destroy # To tear down resources
