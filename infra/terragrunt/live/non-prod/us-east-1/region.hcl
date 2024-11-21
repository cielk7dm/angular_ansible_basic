locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  aws_region   = "us-east-1"
  environment  = local.environment_vars.locals.environment
}