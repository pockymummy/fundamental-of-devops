provider "aws" {
  region = "ap-southeast-1"
}

module "function" {
  source  = "brikis98/devops/book//modules/lambda"
  version = "1.0.0"

  name        = var.name      
  src_dir     = "${path.module}/src" 
  runtime     = "nodejs20.x"         
  handler     = "index.handler"      
  memory_size = var.memory_size                  
  timeout     = 5                    

  environment_variables = {          
    NODE_ENV = "production"
    ENV_NAME = var.environment
  }

  create_url = true
}

resource "aws_lambda_permission" "allow_public_invoke_url" {
  statement_id           = "FunctionURLAllowPublicAccess2"
  action                 = "lambda:InvokeFunctionUrl"
  function_name          = module.function.function_name
  principal              = "*"
  function_url_auth_type = "NONE"
}

resource "aws_lambda_permission" "allow_public_invoke_function" {
  statement_id           = "FunctionAllowPublicAccess3"
  action                 = "lambda:InvokeFunction"
  function_name          = module.function.function_name
  principal              = "*"
}
