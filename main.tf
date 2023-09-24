provider "aws" {
  region = "us-east-1"  # Change this to your desired region
}

resource "aws_instance" "example" {
  ami           = "ami-053b0d53c279acc90"  # Change this to the desired AMI ID
  instance_type = "t2.micro"  # Change this to your desired instance type
  user_data = <<-EOF
  #!/bin/bash 
# setting up the server for installing nginx and nodejs
sudo su

apt update

apt install nginx -y 
#installing nginx at the server
curl -s https://deb.nodesource.com/setup_16.x | sudo bash 

apt install nodejs -y
#installing node js at the server
git clone -b master2 https://github.com/Manav-Khandurie/AWSNETFLIXSAAS.git

npm install pm2@latest -g
#installing pm2 at the server
cd AWSNETFLIXSAAS/netflix-api

npm install
#installs dependencies
cd ..

cd checking

rm /etc/nginx/sites-available/default

mv default /etc/nginx/sites-available/default
#adds the custom ngnix cong file
cd ..

cd netflix-api

pm2 start server.js --name netflix 
#starts SAAS application
sudo service nginx restart
#restarts the service
  EOF
}
