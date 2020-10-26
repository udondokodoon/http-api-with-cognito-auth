resource "aws_apigatewayv2_api" "http_api" {
  name          = var.name
  description   = var.name
  protocol_type = "HTTP"
  body          = var.fixed_body

  cors_configuration = {
    allow_credentials = []
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


resource "aws_apigatewayv2_authorizer" "authorizer" {
  name = var.name
  api_id = aws_apigatewayv2_api.http_api.api_id
  authorizer_type = "JWT"
  identity_sources = ["$request.headers.Authorization"]

  jwt_configurations {
    audience = "sample_http_api"
    issuer = "https://${var.cognito_endpoint}"
  }
}


