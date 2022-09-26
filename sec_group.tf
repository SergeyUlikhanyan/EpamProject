# Create Sec_Group for VPC
resource "aws_security_group" "project_sg" {
  name        = "Allowed ports"
  description = "Security group for my VPC"
  vpc_id      = aws_vpc.myVPC.id

  #  Inbound Rules
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
  
# Outbound Rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Owner       = var.owner
    Terraform   = true
    Name        = "EpamProject_Sec_Group"
  }
}
