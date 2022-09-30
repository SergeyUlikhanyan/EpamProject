# resource "aws_instance" "private_instance" {
#   ami = aws_ami_from_instance.webserverami.id

#   count                       = 2
#   subnet_id                   = element(local.subs, count.index)
#   instance_type               = "t2.micro"
#   associate_public_ip_address = false
#   vpc_security_group_ids      = [aws_security_group.private_ec2.id]
#   user_data                   = file("script.sh")

#   depends_on = [
#     aws_ami_from_instance.webserverami
#   ]
#   tags = {
#     Name = "Private Instance"
#   }
# }

# resource "aws_instance" "second_private_instance" {
#   ami = aws_ami_from_instance.webserverami.id

#   count                       = 2
#   subnet_id                   = element(local.subs, count.index)
#   instance_type               = "t2.micro"
#   associate_public_ip_address = false
#   vpc_security_group_ids      = [aws_security_group.second_private_ec2.id]
#   user_data                   = file("second_script.sh")

#   depends_on = [
#     aws_ami_from_instance.webserverami
#   ]
#   tags = {
#     Name = "Second Private Instance"
#   }
# }

# locals {
#   subs = concat([aws_subnet.Application_NLB.id], [aws_subnet.Application_NLB_Two.id])
# }