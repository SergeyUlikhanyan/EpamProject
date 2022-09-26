#Create application load balancer for EpamProject
resource "aws_lb" "app_lb" {
  name               = "applb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.project_sg.id]
  subnets            = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

#Create target_group for EpamProject
resource "aws_lb_target_group" "project" {
  name     = "project"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.myVPC.id
  health_check {
    path = var.health_check_path
  }

}

#Create listener 
resource "aws_lb_listener" "listen80_1" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.project.id
    type             = "forward"
  }
}