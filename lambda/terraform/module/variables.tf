variable "function_name" {}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}

variable "lambda_logs_name" {}

variable "handler" {}

variable "query_api_source_arn" {}

variable "service_name" {}

variable "aws_account_id" {}

variable "aws_region" {}

variable "environment" {}
 
variable "filename" {}
