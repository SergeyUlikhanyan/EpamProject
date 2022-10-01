# Network Load Balancer
resource "aws_lb" "Project_nlb" {
  name                             = "EpamNLB"
  internal                         = false
  load_balancer_type               = "network"
  subnets                          = [aws_subnet.Project_Public1.id, aws_subnet.Project_Public2.id]
  enable_cross_zone_load_balancing = true

}

# Listener for Network Load Balancer 8082
resource "aws_lb_listener" "nlb_listener" {
  load_balancer_arn = aws_lb.Project_nlb.arn
  port              = 8082
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.Project_target.arn
    type             = "forward"
  }
}

# Target group for Network Load Balancer 8082
resource "aws_lb_target_group" "Project_target" {
  name        = "ProjectTarget"
  target_type = "instance"
  port        = 8082
  protocol    = "TCP"
  vpc_id      = aws_vpc.Project.id
}

# Attachment 
resource "aws_autoscaling_attachment" "asg_attach" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.Project_target.arn
}



# Listener for Network Load Balancer 8080
resource "aws_lb_listener" "nlb_listener2" {
  load_balancer_arn = aws_lb.Project_nlb.arn
  port              = 8080
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.Project_target2.arn
    type             = "forward"
  }
}

# Target group for Network Load Balancer 8080
resource "aws_lb_target_group" "Project_target2" {
  name        = "ProjectTarget2"
  target_type = "instance"
  port        = 8080
  protocol    = "TCP"
  vpc_id      = aws_vpc.Project.id
}

# Attachment 
resource "aws_autoscaling_attachment" "asg_attach2" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.Project_target2.arn
}



# Listener for Network Load Balancer 8500
resource "aws_lb_listener" "nlb_listener3" {
  load_balancer_arn = aws_lb.Project_nlb.arn
  port              = 8500
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.Project_target3.arn
    type             = "forward"
  }
}

# Target group for Network Load Balancer 8500
resource "aws_lb_target_group" "Project_target3" {
  name        = "ProjectTarget3"
  target_type = "instance"
  port        = 8500
  protocol    = "TCP"
  vpc_id      = aws_vpc.Project.id
}

# Attachment 
resource "aws_autoscaling_attachment" "asg_attach3" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.Project_target3.arn
}



# Listener for Network Load Balancer 8600
resource "aws_lb_listener" "nlb_listener4" {
  load_balancer_arn = aws_lb.Project_nlb.arn
  port              = 8600
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.Project_target4.arn
    type             = "forward"
  }
}

# Target group for Network Load Balancer 8600
resource "aws_lb_target_group" "Project_target4" {
  name        = "ProjectTarget4"
  target_type = "instance"
  port        = 8600
  protocol    = "TCP"
  vpc_id      = aws_vpc.Project.id
}

# Attachment 
resource "aws_autoscaling_attachment" "asg_attach4" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.Project_target4.arn
}



# Listener for Network Load Balancer 5601
resource "aws_lb_listener" "nlb_listener5" {
  load_balancer_arn = aws_lb.Project_nlb.arn
  port              = 5601
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.Project_target5.arn
    type             = "forward"
  }
}

# Target group for Network Load Balancer 5601
resource "aws_lb_target_group" "Project_target5" {
  name        = "ProjectTarget5"
  target_type = "instance"
  port        = 5601
  protocol    = "TCP"
  vpc_id      = aws_vpc.Project.id
}

# Attachment 
resource "aws_autoscaling_attachment" "asg_attach5" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.Project_target5.arn
}



# Listener for Network Load Balancer 5001
resource "aws_lb_listener" "nlb_listener6" {
  load_balancer_arn = aws_lb.Project_nlb.arn
  port              = 5001
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.Project_target6.arn
    type             = "forward"
  }
}

# Target group for Network Load Balancer 5001
resource "aws_lb_target_group" "Project_target6" {
  name        = "ProjectTarget6"
  target_type = "instance"
  port        = 5001
  protocol    = "TCP"
  vpc_id      = aws_vpc.Project.id
}

# Attachment 
resource "aws_autoscaling_attachment" "asg_attach6" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.Project_target6.arn
}



# Listener for Network Load Balancer 80
resource "aws_lb_listener" "nlb_listener7" {
  load_balancer_arn = aws_lb.Project_nlb.arn
  port              = 80
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.Project_target7.arn
    type             = "forward"
  }
}

# Target group for Network Load Balancer 80
resource "aws_lb_target_group" "Project_target7" {
  name        = "ProjectTarget7"
  target_type = "instance"
  port        = 80
  protocol    = "TCP"
  vpc_id      = aws_vpc.Project.id
}

# Attachment 
resource "aws_autoscaling_attachment" "asg_attach7" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.Project_target7.arn
}



# Listener for Network Load Balancer 4040
resource "aws_lb_listener" "nlb_listener8" {
  load_balancer_arn = aws_lb.Project_nlb.arn
  port              = 4040
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.Project_target8.arn
    type             = "forward"
  }
}

# Target group for Network Load Balancer 4040
resource "aws_lb_target_group" "Project_target8" {
  name        = "ProjectTarget8"
  target_type = "instance"
  port        = 4040
  protocol    = "TCP"
  vpc_id      = aws_vpc.Project.id
}

# Attachment 
resource "aws_autoscaling_attachment" "asg_attach8" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.Project_target8.arn
}



# Listener for Network Load Balancer 27017
resource "aws_lb_listener" "nlb_listener9" {
  load_balancer_arn = aws_lb.Project_nlb.arn
  port              = 27017
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.Project_target9.arn
    type             = "forward"
  }
}

# Target group for Network Load Balancer 27017
resource "aws_lb_target_group" "Project_target9" {
  name        = "ProjectTarget9"
  target_type = "instance"
  port        = 27017
  protocol    = "TCP"
  vpc_id      = aws_vpc.Project.id
}

# Attachment 
resource "aws_autoscaling_attachment" "asg_attach9" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.Project_target9.arn
}



# Listener for Network Load Balancer 3310
resource "aws_lb_listener" "nlb_listener10" {
  load_balancer_arn = aws_lb.Project_nlb.arn
  port              = 3310
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.Project_target10.arn
    type             = "forward"
  }
}

# Target group for Network Load Balancer 3310
resource "aws_lb_target_group" "Project_target10" {
  name        = "ProjectTarget10"
  target_type = "instance"
  port        = 3310
  protocol    = "TCP"
  vpc_id      = aws_vpc.Project.id
}

# Attachment 
resource "aws_autoscaling_attachment" "asg_attach10" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.Project_target10.arn
}



# Listener for Network Load Balancer 5672
resource "aws_lb_listener" "nlb_listener11" {
  load_balancer_arn = aws_lb.Project_nlb.arn
  port              = 5672
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.Project_target11.arn
    type             = "forward"
  }
}

# Target group for Network Load Balancer 5672
resource "aws_lb_target_group" "Project_target11" {
  name        = "ProjectTarget11"
  target_type = "instance"
  port        = 5672
  protocol    = "TCP"
  vpc_id      = aws_vpc.Project.id
}

# Attachment 
resource "aws_autoscaling_attachment" "asg_attach11" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.Project_target11.arn
}



# Listener for Network Load Balancer 15672
resource "aws_lb_listener" "nlb_listener12" {
  load_balancer_arn = aws_lb.Project_nlb.arn
  port              = 15672
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.Project_target12.arn
    type             = "forward"
  }
}

# Target group for Network Load Balancer 15672
resource "aws_lb_target_group" "Project_target12" {
  name        = "ProjectTarget12"
  target_type = "instance"
  port        = 15672
  protocol    = "TCP"
  vpc_id      = aws_vpc.Project.id
}

# Attachment 
resource "aws_autoscaling_attachment" "asg_attach12" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.Project_target12.arn
}



# Listener for Network Load Balancer 9200
resource "aws_lb_listener" "nlb_listener13" {
  load_balancer_arn = aws_lb.Project_nlb.arn
  port              = 9200
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.Project_target13.arn
    type             = "forward"
  }
}

# Target group for Network Load Balancer 9200
resource "aws_lb_target_group" "Project_target13" {
  name        = "ProjectTarget13"
  target_type = "instance"
  port        = 9200
  protocol    = "TCP"
  vpc_id      = aws_vpc.Project.id
}

# Attachment 
resource "aws_autoscaling_attachment" "asg_attach13" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.Project_target13.arn
}



# Listener for Network Load Balancer 9300
resource "aws_lb_listener" "nlb_listener14" {
  load_balancer_arn = aws_lb.Project_nlb.arn
  port              = 9300
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.Project_target14.arn
    type             = "forward"
  }
}

# Target group for Network Load Balancer 9300
resource "aws_lb_target_group" "Project_target14" {
  name        = "ProjectTarget14"
  target_type = "instance"
  port        = 9300
  protocol    = "TCP"
  vpc_id      = aws_vpc.Project.id
}

# Attachment 
resource "aws_autoscaling_attachment" "asg_attach14" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.Project_target14.arn
}

