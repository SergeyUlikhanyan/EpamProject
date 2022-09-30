# Autoscaling Group Resource
resource "aws_autoscaling_group" "asg" {
  name_prefix         = "myasg-"
  desired_capacity    = 2
  max_size            = 4
  min_size            = 2
  vpc_zone_identifier = [aws_subnet.Project_Public1.id, aws_subnet.Project_Public2.id]
  health_check_type         = "EC2"
  health_check_grace_period = 300
  launch_template {
    id      = aws_launch_template.my_launch_template.id
    version = aws_launch_template.my_launch_template.latest_version
  }


  # Instance Refresh
  instance_refresh {
    strategy = "Rolling"
    preferences {
      instance_warmup        = 300
      min_healthy_percentage = 50
    }
    triggers = ["desired_capacity"]
  }
  tag {
    key                 = "Owners"
    value               = "DevOps-Team"
    propagate_at_launch = true
  }
}


# Launch Template Resource
resource "aws_launch_template" "my_launch_template" {
  name                   = "my-launch-template"
  description            = "My Launch template"
  image_id               = "ami-0c9354388bb36c088"
  instance_type          = "t2.large"
  vpc_security_group_ids = [aws_security_group.Project_SecGroup.id]
  key_name               = "Frankfurt"
  user_data              = filebase64("templates/script-app1.sh")
  ebs_optimized          = false
  update_default_version = true
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size           = 30
      delete_on_termination = true
      volume_type           = "gp2"
    }
  }
  monitoring {
    enabled = false
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "Microservices"
    }
  }

}