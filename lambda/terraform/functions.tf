module "test1" {
  source = "./module"

  query_api_source_arn = "local.query_api_gateway_execution_arn"
  service_name         = var.service_name
  function_name        = "test1"
  lambda_logs_name     = "test1"
  handler              = "main.test1"
  subnet_ids           = data.aws_subnet_ids.private.ids
  security_group_ids   = data.aws_security_groups.sg.ids
  aws_account_id       = var.aws_account_id
  aws_region           = var.aws_region
  environment          = var.environment
}
