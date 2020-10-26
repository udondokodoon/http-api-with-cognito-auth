resource "aws_apigatewayv2_api" "http_api" {
  name          = var.name
  description   = var.name
  protocol_type = "HTTP"

  cors_configuration {
    allow_credentials = false
    allow_headers     = []
    allow_methods     = ["GET", "OPTIONS"]
    allow_origins     = ["*"]
    expose_headers    = []
    max_age           = 86400
  }

  tags = {
    Name = var.name
  }

  disable_execute_api_endpoint = false
}

resource "aws_apigatewayv2_route" "default_route" {
  api_id    = aws_apigatewayv2_api.http_api.id
  route_key = "GET /"
}

resource "aws_apigatewayv2_stage" "devel" {
  api_id      = aws_apigatewayv2_api.http_api.id
  name        = "devel"
  auto_deploy = true

  route_settings {
    route_key = "GET /"
  }
}

resource "aws_apigatewayv2_authorizer" "authorizer" {
  name             = var.name
  api_id           = aws_apigatewayv2_api.http_api.id
  authorizer_type  = "JWT"
  identity_sources = ["$request.header.Authorization"]

  jwt_configuration {
    audience = ["sample_http_api"]
    issuer   = "https://${var.jwt_issuer}"
  }
}
