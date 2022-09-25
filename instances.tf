#Create Consul instance
resource "aws_instance" "EpamProject" {
  ami           = "ami-0c9354388bb36c088"
  instance_type = "t2.large"
  key_name      = var.mykey
  user_data = templatefile("templates/install_pkgs.tpl", {})
root_block_device {
    volume_type = "gp3"
    volume_size = "30"
    delete_on_termination = true

}
  tags = {
    Name  = "EpamProject"
    Group = "Server"
  }
}