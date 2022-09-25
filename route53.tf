# Configuring Route 53
resource "aws_route53_zone" "myDNS" {
  name = "project.local"

  vpc {
    vpc_id = aws_vpc.myVPC.id
  }
  lifecycle {
    ignore_changes = [vpc]
  }
}

resource "aws_route53_record" "EpamProject" {
  zone_id = aws_route53_zone.myDNS.id
  name    = "Server"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.EpamProject.private_ip]
}

resource "aws_vpc_dhcp_options" "myProject" {
  domain_name         = "project.local"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    Name = "ProjectDHCP"
  }
}

resource "aws_vpc_dhcp_options_association" "myProject" {
  vpc_id          = aws_vpc.myVPC.id
  dhcp_options_id = aws_vpc_dhcp_options.myProject.id
}