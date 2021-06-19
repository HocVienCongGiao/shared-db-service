data "aws_iam_role" "iam_for_lambda" {
  name = "${var.environment}_iam_for_lambda"
}

data "aws_iam_policy" "lambda_logging" {
  name = "${var.environment}_lambda_logging"
}

// nhut test code
// data
data "aws_api_gateway_rest_api" "db-migration-api" {
  name = "${var.environment}DBMigrationApi"
}