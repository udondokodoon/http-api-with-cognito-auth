module "http_api" {
  source = "./modules/http_api"
  name   = "sample_http_api"

  cognito_endpoint = module.user_pool.endpoint
}

module "user_pool" {
  source = "./modules/user_pool"
  name   = "sample_user_pool"
}
