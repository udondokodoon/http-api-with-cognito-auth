output "id" {
  value = aws_apigatewayv2_api.http_api.id
}
output "arn" {
  value = aws_apigatewayv2_api.http_api.arn
}
output "api_endpoint" {
  value = aws_apigatewayv2_api.http_api.api_endpoint
}
output "execution_arn" {
  value = aws_apigatewayv2_api.http_api.execution_arn
}
output "authorizer_id" {
    value = aws_apigatewayv2_authorizer.authorizer.id
}