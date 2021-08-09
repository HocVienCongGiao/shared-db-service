resource "aws_cloudwatch_log_group" "this" {
  name              = ${var.environment}_${var.service_name}_${var.lambda_logs_name} # Should be the same as function name
  retention_in_days = 14
}
