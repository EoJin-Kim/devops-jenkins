#!/bin/bash


sudo yum install -y docker;
sudo systemctl enable docker;
sudo systemctl start docker;

sudo useradd jenkins
sudo usermod -aG docker ec2-user;
sudo usermod -aG docker jenkins;


wget https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-linux-x86_64
mv docker-compose-linux-x86_64 docker-compose
sudo mv docker-compose /usr/libexec/docker/cli-plugins/

chmod +x /usr/libexec/docker/cli-plugins/docker-compose

sudo su ec2-user
