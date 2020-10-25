output "id" {
    value = aws_cognito_user_pool.id
}
output "arn" {
    value = aws_cognito_user_pool.arn
}
output "endpoint" {
    value = aws_cognito_user_pool.user_pool.endpoint
}