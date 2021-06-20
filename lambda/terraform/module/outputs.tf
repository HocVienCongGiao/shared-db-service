// output base_url
output "invoke_arn" {
  description = "Lambda invoke url"
  value = aws_lambda_function.this.invoke_arn
}