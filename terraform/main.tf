# Red Acre Terraform resources.

resource "aws_route53_record" "frontend" {
  zone_id = var.route53_zoneId
  name = "redacre-frontend${title(var.env_aws)}"
  type = "CNAME"
  ttl = "5"
}


data "aws_ecr_image" "service_image" {
  repository_name = "red-acre-api"
  image_tag       = "latest"
}



resource "docker_container" "API" {
  name  = "API"
  image = "public.ecr.aws/g0q4k7i4/red-acre-api"

  ports {
    internal = "5000"
    external = "5000"
  }
}

resource "docker_container" "FrontEnd" {
  name  = "FrontEnd"
  image = "public.ecr.aws/g0q4k7i4/red-acre-frontend"

  ports {
    internal = "4000"
    external = "4000"
  }
}

resource "docker_container" "Proxy" {
  name  = "Proxy"
  image = "nginx:latest"

  ports {
    internal = "3000"
    external = "80"
  }
}