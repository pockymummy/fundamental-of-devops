provider "aws" {
  region = "ap-southeast-1"
}

module "child_accounts" {
  source  = "brikis98/devops/book//modules/aws-organizations"
  version = "1.0.0"

  create_organization = true                 

  # TODO: fill in your own account emails!
  accounts = {                               
    development = "thanawat.tangpornpisit+dev@email.com"
    staging     = "thanawat.tangpornpisit+stage@email.com"
    production  = "thanawat.tangpornpisit+prod@email.com"
  }

}
