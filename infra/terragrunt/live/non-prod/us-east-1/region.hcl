locals {
  environment_vars = read_terragrunt_config("${get_path_to_repo_root()}/infra/terragrunt/live/non-prod/us-east-1/staging/env.hcl")

  aws_region   = "us-east-1"
  environment  = local.environment_vars.locals.environment
}