# Network Load Balancer
resource "aws_lb" "Project_nlb" {
  name                             = "EpamNLB"
  internal                         = false
  load_balancer_type               = "network"
  subnets                          = [aws_subnet.Project_Public1.id, aws_subnet.Project_Public2.id]
  enable_cross_zone_load_balancing = true

}

# Listener for Network Load Balancer
resource "aws_lb_listener" "nlb_listener" {
  load_balancer_arn = aws_lb.Project_nlb.arn
  port              = 80
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.Project_target.arn
    type             = "forward"
  }
}

# Target group for Network Load Balancer
resource "aws_lb_target_group" "Project_target" {
  name        = "ProjectTarget"
  target_type = "instance"
  port        = 80
  protocol    = "TCP"
  vpc_id      = aws_vpc.Project.id
}

# Attachment 
resource "aws_autoscaling_attachment" "asg_attach" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.Project_target.arn
}