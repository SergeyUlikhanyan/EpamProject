#Create Consul instance
resource "aws_instance" "Consul" {
  ami           = "ami-0c9354388bb36c088"
  instance_type = "t2.micro"
  key_name      = var.mykey
  user_data = templatefile("templates/install_docker.tpl", {})
  tags = {
    Name  = "Consul"
    Group = "Server"
  }
}


locals {
  ssh_user = "ubuntu"
  key_name = "Frankfurt"
  private_key_path = "/home/sergey/Downloads/Frankfurt.pem"
}



#Create Consul instance
resource "aws_instance" "Consul" {
  ami           = "ami-0c9354388bb36c088"
  instance_type = "t2.micro"
  key_name      = local.key_name
  associate_public_ip_address = true

  provisioner "remote-exec" {
    inline = ["echo 'Waiting ssh'"]

    connection {
      type = "ssh"
      user = local.ssh_user
      private_key = file(local.private_key_path)
      host = aws_instance.Consul.public_ip
    }
  }
  tags = {
    Name  = "Consul"
    Group = "Server"
  }
   provisioner "local-exec" {
    command = "ansible-playbook -i ${aws_instance.Consul.public_ip}, --private-key ${local.private_key_path} ansible/consul.yaml"
  }
}