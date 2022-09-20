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

#Create RabbitMQ instance
resource "aws_instance" "RabbitMQ" {
  ami           = "ami-0c9354388bb36c088"
  instance_type = "t2.micro"
  key_name      = var.mykey
  user_data = templatefile("templates/install_docker.tpl", {})
  tags = {
    Name  = "RabbitMQ"
    Group = "Server"
  }
}

#Create instance for Mongo_DB
resource "aws_instance" "mongo_db" {
  ami                    = "ami-0c9354388bb36c088"
  instance_type          = "t2.micro"
  key_name               = var.mykey
  user_data = templatefile("templates/install_docker.tpl", {})
  tags = {
    Name  = "Mongo_db"
    Group = "Database"
  }
}

  #Create instance for MySQL
resource "aws_instance" "MySQL" {
  ami                    = "ami-0c9354388bb36c088"
  instance_type          = "t2.micro"
  key_name               = var.mykey
  user_data = templatefile("templates/install_docker.tpl", {})
  tags = {
    Name  = "MySQL"
    Group = "Database"
  }
}

#Create ServiceOne instance
resource "aws_instance" "ServiceOne" {
  ami                    = "ami-0c9354388bb36c088"
  instance_type          = "t2.micro"
  key_name               = var.mykey
  user_data = templatefile("templates/install_docker.tpl", {})
  tags = {
    Name  = "ServiceOne"
    Group = "Services"
  }
}

#Create ServiceTwo instance
resource "aws_instance" "ServiceTwo" {
  ami           = "ami-0c9354388bb36c088"
  instance_type = "t2.micro"
  key_name      = var.mykey
  user_data = templatefile("templates/install_docker.tpl", {})
  tags = {
    Name  = "ServiceTwo"
    Group = "Services"
  }
}

#Create ApiGateway instance
resource "aws_instance" "ApiGateway" {
  ami                    = "ami-0c9354388bb36c088"
  instance_type          = "t2.micro"
  key_name               = var.mykey
  user_data = templatefile("templates/install_docker.tpl", {})
  tags = {
    Name  = "ApiGateway"
    Group = "Frontend"
  }
}

#Create Web applications instance
resource "aws_instance" "WebApp" {
  ami                    = "ami-0c9354388bb36c088"
  instance_type          = "t2.micro"
  key_name               = var.mykey
  user_data = templatefile("templates/install_docker.tpl", {})
  tags = {
    Name  = "WebApp"
    Group = "Frontend"
  }
}
