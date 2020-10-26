module "http_api" {
  source = "./modules/http_api"
  name   = "usd_sample_http_api"

  fixed_body = "hello world"

  cognito_endpoint = module.user_pool.endpoint
}

module "user_pool" {
  source = "./modules/user_pool"
  name   = "usd_sample_user_pool"
}
