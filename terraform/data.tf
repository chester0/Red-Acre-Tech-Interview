provider "aws" {
  alias = "prod"
  access_key = ""
  secret_key = ""
  region = ""
}

provider "aws" {
  alias = "dev"
  access_key = ""
  secret_key = ""
  region = ""
}

data "aws_vpc" "selected" {
  tags = {
    name = "vpc_name"
  }
}

data "aws_alb" "load_balancer" {
  name = "redacre-${title(var.env_aws)}"
}

data "aws_alb_listener" "load_balancer80" {
  load_balancer_arn = data.aws_alb.load_balancer.arn
  port = 80
}

