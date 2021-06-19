// local variable
locals {
  query_api_gateway_root_resource_id    = data.aws_api_gateway_rest_api.db-migration-api.root_resource_id
  query_api_gateway_execution_arn       = "${data.aws_api_gateway_rest_api.db-migration-api.execution_arn}/*/*"
}

// resource aws_api_gateway_rest_api
resource "aws_api_gateway_rest_api" "db-migration-api" {
  name        = "${var.environment}DBMigrationApi"
  description = "${var.environment} DB MigrationApi Api"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

// aws_api_gateway_resource
resource "aws_api_gateway_resource" "this-proxy-query" {
  rest_api_id = data.aws_api_gateway_rest_api.db-migration-api.id
  parent_id   = aws_api_gateway_rest_api.db-migration-api.root_resource_id
  path_part   = "{proxy+}"
}

// aws_api_gateway_method
resource "aws_api_gateway_method" "this-proxy" {
  rest_api_id   = aws_api_gateway_rest_api.db-migration-api.id
  resource_id   = aws_api_gateway_resource.this-proxy-query.id
  http_method   = "ANY"
  authorization = "NONE"
}

// aws_api_gateway_integration
resource "aws_api_gateway_integration" "this-proxy-option" {
  rest_api_id = aws_api_gateway_rest_api.db-migration-api.id
  resource_id = aws_api_gateway_method.this-proxy.resource_id
  http_method = aws_api_gateway_method.this-proxy.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.uri // TODO need to find correct uri
}

// aws_api_gateway_deployment
/*
Finally, you need to create an API Gateway "deployment" in order to activate the configuration and expose the API at a URL that can be used for testing:
*/
resource "aws_api_gateway_deployment" "db-migration-api" {
  depends_on = []

  rest_api_id = data.aws_api_gateway_rest_api.db-migration-api.id
  triggers = {
    # NOTE: The configuration below will satisfy ordering considerations,
    #       but not pick up all future REST API changes. More advanced patterns
    #       are possible, such as using the filesha1() function against the
    #       Terraform configuration file(s) or removing the .id references to
    #       calculate a hash against whole resources. Be aware that using whole
    #       resources will show a difference after the initial implementation.
    #       It will stabilize to only change when resources change afterwards.
    redeployment = sha1(jsonencode(
    [
      timestamp(),
      # aws_api_gateway_authorizer.query-api.id,
      # data.aws_api_gateway_resource.exampleservice-test2-query-api-proxy.id,
      # aws_api_gateway_method.exampleservice-test2-query-api-proxy.id,
      # aws_api_gateway_integration.exampleservice-test2-query-api.id,

      #         aws_api_gateway_resource.exampleservice-query-api-proxy.id,
      # aws_api_gateway_method.exampleservice-query-api-proxy.id,
      # aws_api_gateway_integration.exampleservice-query-api.id,
      # aws_api_gateway_rest_api.query-api.body,
    ]
    ))
  }

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_api_gateway_stage" "query-api" {
  deployment_id = aws_api_gateway_deployment.db-migration-api.id
  rest_api_id   = data.aws_api_gateway_rest_api.db-migration-api.id
  stage_name    = "db-migration-api"
}

// output base_url
output "query_api_base_url" {
  value = aws_api_gateway_deployment.db-migration-api.invoke_url
}
