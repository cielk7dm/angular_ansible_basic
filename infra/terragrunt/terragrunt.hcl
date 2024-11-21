locals {
  account_vars = read_terragrunt_config("${get_path_to_repo_root()}/infra/terragrunt/live/non-prod/account.hcl")

  account_name = local.account_vars.locals.account_name
  account_id   = local.account_vars.locals.aws_account_id
  aws_region   = local.account_vars.locals.aws_region
  environment  = local.account_vars.locals.environment
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "${local.environment}-${local.aws_region}-${local.account_name}-tfstates"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.aws_region
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.aws_region}"
  allowed_account_ids =  ["${local.account_id}"]
  default_tags {
    tags = {
      AccountName = "${local.account_name}"
      DeployedBy  = "Terragrunt"
      Environment = "${local.environment}"
    }
  }
}
EOF
}

inputs = merge(
  local.account_vars.locals,
)