#Create Launch config for EpamProject
resource "aws_launch_configuration" "projectLC" {
  name_prefix                 = "lc_1"
  image_id                    = "ami-0c9354388bb36c088"
  instance_type               = "t2.micro"
  key_name                    = var.mykey
  security_groups             = [ aws_security_group.project_sg.id ]
  associate_public_ip_address = true
  
root_block_device {
  volume_type           = "gp3"
  volume_size           = "30"
  delete_on_termination = true

}
  lifecycle {
    create_before_destroy = true
  }
  user_data               = templatefile("templates/install_pkgs.tpl", {})
}


#Create ASG for EpamProject
resource "aws_autoscaling_group" "projectASG" {
  name                      = "project_asg"
  min_size                  = 1
  max_size                  = 3
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  launch_configuration      = aws_launch_configuration.projectLC.name
  vpc_zone_identifier       = [aws_subnet.subnet_1.id]
}


#ASG attachments
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.projectASG.id
  lb_target_group_arn   = aws_lb_target_group.project.arn
}