resource "aws_lambda_function" "this" {
  filename      = var.filename
  function_name = "${var.environment}_${var.service_name}_${var.function_name}"
  role          = data.aws_iam_role.iam_for_lambda.arn
  handler       = var.handler
  timeout       = 12

  vpc_config {
    # Every subnet should be able to reach an EFS mount target in the same Availability Zone. Cross-AZ mounts are not permitted.
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = base64sha256(data.aws_s3_bucket_object.this.last_modified)
  runtime          = "provided.al2"

  environment {
    variables = {
      # API_KEY   = var.api_key
      # TFE_TOKEN = var.tfe_token
      LAMBDA_FUNCTION_NAME = var.function_name
    }
  }

  # Explicitly declare dependency on EFS mount target.
  # When creating or updating Lambda functions, mount target must be in 'available' lifecycle state.
  depends_on = [
    # aws_iam_role_policy_attachment.lambda_logs,
    aws_cloudwatch_log_group.this
  ]
}