module "test1" {
  source = "./module"

  filename             = "migration"
  service_name         = var.service_name
  function_name        = "test1"
  lambda_logs_name     = "test1"
  handler              = "migration.test1"
  subnet_ids           = data.aws_subnet_ids.private.ids
  security_group_ids   = data.aws_security_groups.sg.ids
  aws_account_id       = var.aws_account_id
  aws_region           = var.aws_region
  environment          = var.environment
}
