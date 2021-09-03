data "aws_iam_role" "iam_for_lambda" {
  name = "${var.environment}_iam_for_lambda"
}

