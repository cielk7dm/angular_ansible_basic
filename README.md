# AWS EC2 + Angular + Docker + Ansible + Terragrunt + GitHub Actions

The following mono repo demostrates an example of a GITOps CI/CD workflow by using GitHub Actions.

** This is not a production ready pipeline. **


Requierements:
    - Github account.
    - Terraform / OpenTofu.
    - Terragrunt.
    - Ansible.
    - Docker, Docker Compose.
    - An Angular demo.
    - An AWS Account.

### Steps
- Create an IAM Role for OIDC. 
- Identity provider for OIDC.
- Add secrets to GHRepo.
    * AWS_REGION, ROLE_ARN, PRIVATE_KEY
- Create Classic TOKEN with read,write permissions.

### GitHub Actions
- Write changes to app or terragrunt code, this enables the workflows.
    * Begin with VPC, SSH and EC2 the last.

### Command line.

- Run at child HCL file.
    * terragrunt plan, apply or destroy.
- Ansible playbooks
    * The key pair is at tf states files. Clean the string and save it locally $HOME/.ssh/demo-app.
    * ansible-playbook -i "<EC2PUBLICIP>," -u ec2-user --private-key $HOME/.ssh/demo-app <YMLFILEHERE>