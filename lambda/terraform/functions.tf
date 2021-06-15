module "migrate" {
  source = "./module"

  filename             = "migration"
  service_name         = var.service_name
  function_name        = "migrate"
  lambda_logs_name     = "migrate"
  handler              = "migration.migrate"
  subnet_ids           = data.aws_subnet_ids.private.ids
  security_group_ids   = data.aws_security_groups.sg.ids
  aws_account_id       = var.aws_account_id
  aws_region           = var.aws_region
  environment          = var.environment
  db_user              = var.db_user
  db_name              = var.db_name
  db_password          = var.db_password
}
