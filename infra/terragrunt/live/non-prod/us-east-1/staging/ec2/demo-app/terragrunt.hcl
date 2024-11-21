locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  account_name = local.account_vars.locals.account_name
  account_id   = local.account_vars.locals.aws_account_id
  aws_region   = local.region_vars.locals.aws_region
  environment  = local.environment_vars.locals.environment
}

include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_path_to_repo_root()}/infra/modules/ec2/demo-app"
}

dependency key-pair {
  config_path = "${get_path_to_repo_root()}/infra/terragrunt/live/non-prod/us-east-1/staging/key-pairs/ec2-user"
}

dependency vpc {
  config_path = "${get_path_to_repo_root()}/infra/terragrunt/live/non-prod/us-east-1/staging/network/vpc"
}

inputs = {
  env      = local.environment
  key_name = dependency.key-pair.outputs.key_name

  vpc_id        = dependency.vpc.outputs.vpc_id
  vpc_subnet_id = dependency.vpc.outputs.vpc_subnet_ids[1]
  cidr          = "0.0.0.0/0"

  private_key = dependency.key-pair.outputs.private_key
  local_path = "${get_path_to_repo_root()}"

  tags = {
    "project" = "atomic-company"
  }
}