locals {
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  
  account_name   = "demo-app"
  aws_account_id = "419638816579" # TODO: replace me with your AWS account ID!
  aws_region     = local.region_vars.locals.aws_region
  environment    = local.region_vars.locals.environment
}