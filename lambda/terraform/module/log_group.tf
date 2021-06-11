resource "aws_cloudwatch_log_group" "this" {
  name              = var.lambda_logs_name # Should be the same as function name
  retention_in_days = 14
}
