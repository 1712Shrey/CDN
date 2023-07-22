#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html