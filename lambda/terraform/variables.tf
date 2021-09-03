variable "service_name" {}

variable "organisation" {
  default = "HocVienCongGiao"
}

variable "environment" {
  default = "dev-sg"
}

variable "app_type" {
  default = "apps"
}

variable "aws_region" {
  default = "ap-southeast-1"
}

variable "aws_access_key_id" {}
variable "aws_secret_access_key" {}
variable "aws_account_id" {}

variable "api_key" {
  default = "DEFAULT_API_KEY_FOR_NOTIF"
}

variable "tfe_token" {}

# customised vars for shared-db-service
variable "db_user" {}
variable "db_name" {}
variable "db_password" {}
