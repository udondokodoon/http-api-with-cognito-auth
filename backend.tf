terraform {
  backend "s3" {
    bucket = "usd-test"
    key    = "tfstate/http-api-with-cognito-auth"
    region = "ap-northeast-1"
  }
}
