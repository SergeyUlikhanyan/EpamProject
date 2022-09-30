# Route53 setup
data "aws_route53_zone" "selected" {
  name         = "sergeyulikhanyan.link."
  private_zone = false
}

resource "aws_route53_record" "www-dev" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "www"
  type    = "CNAME"
  ttl     = 5
  records = [aws_lb.Project_nlb.dns_name]
}