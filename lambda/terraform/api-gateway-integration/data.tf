data "aws_api_gateway_rest_api" "db-migration-api" {
  name = "${var.environment}DBMigrationApi"
}

data "terraform_remote_state" "api-gateway" {
  backend = "remote"

  config = {
    organization = var.organisation
    workspaces = {
      name = "${var.environment}-lambda-apps-hvcg-api-gateway"
    }
  }
}