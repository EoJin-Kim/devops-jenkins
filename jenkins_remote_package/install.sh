#!/bin/bash

set -x;

sudo yum -y update;
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo;
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key;
sudo yum upgrade -y;
sudo amazon-linux-extras install epel -y;

sudo yum install jenkins -y;
sudo curl -L https://corretto.aws/downloads/latest/amazon-corretto-11-x64-linux-jdk.rpm -o java11.rpm
sudo rpm -ihv java11.rpm


sudo systemctl daemon-reload;
sudo systemctl start jenkins;

sudo systemctl status jenkins;

sudo yum install -y docker;
sudo systemctl enable docker;
sudo systemctl start docker;
sudo usermod -aG docker jenkins;