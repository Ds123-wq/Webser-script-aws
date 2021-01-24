#!/bin/bash
yum install httpd -y

ip=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
echo $ip > /var/www/html/index.html

az=$(curl http://169.254.169.254/latest/meta-data/placement/availability-zone)
echo $az >> /var/www/html/index.html

systemctl start httpd
systemctl enable httpd
