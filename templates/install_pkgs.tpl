#!/bin/bash
sudo apt update -y
cd /home/ubuntu


echo "Clonning remote repository"
git clone https://github.com/SergeyUlikhanyan/microservices.git


echo "Installing Maven"
sudo apt install -y maven


echo "Installing Java"
sudo apt install -y default-jre
sudo apt install -y default-jdk


echo "Installing Docker-Compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /bin/docker-compose
sudo chmod +x /bin/docker-compose


echo "Installing Docker"
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update -y
sudo apt-get install -y docker-ce
sudo gpasswd -a ubuntu docker
newgrp docker
sudo service docker enable

cd microservices/build/docker/scripts
./deploy.sh docker
