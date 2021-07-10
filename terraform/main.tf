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

