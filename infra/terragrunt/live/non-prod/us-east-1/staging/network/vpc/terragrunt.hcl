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
  source = "${get_path_to_repo_root()}/infra/modules/network/vpc"
}

inputs = {
  name                 = "demo-app-vpc"
  vpc_cidr             = "10.0.0.0/16"
  azs                  = ["us-east-1a","us-east-1b","us-east-1c"]

  tags = {
    "project" = "atomic-comp"
  }
}