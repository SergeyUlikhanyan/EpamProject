resource "aws_security_group" "Project_SecGroup" {
  name                 = "Project_SecGroup"
  description          = "Allow inbound traffic"
  vpc_id               = aws_vpc.Project.id
  dynamic "ingress" {
    for_each           = ["80", "8080", "8082", "8084", "8500", "8600", "5601", "5001", "4040", "27017", "3310", "5672", "15672", "9200", "9300"]
    content {
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }
  egress {
    from_port         = 0
    to_port           = 0
    protocol          = "-1"
    cidr_blocks       = ["0.0.0.0/0"]
    ipv6_cidr_blocks  = ["::/0"]
  }
  tags = {
    name = "Epam_Security"
  }
}



