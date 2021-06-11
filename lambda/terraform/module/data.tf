data "aws_iam_role" "iam_for_lambda" {
  name = "${var.environment}_iam_for_lambda"
}

data "aws_iam_policy" "lambda_logging" {
  name = "${var.environment}_lambda_logging"
}
