provider "aws" {
  region = "us-east-1"  # Change this to your desired region
}

resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Example security group for SSH, TCP, UDP, HTTP, and HTTPS"
  
  # Ingress rule for SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere (not recommended for production)
  }

  # Ingress rule for TCP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP from anywhere
  }

  # Ingress rule for HTTPS
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTPS from anywhere
  }

  # Ingress rule for UDP
  ingress {
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow DNS (UDP) from anywhere
  }
}

resource "aws_instance" "example" {
  ami           = "ami-053b0d53c279acc90"  # Change this to the desired AMI ID
  instance_type = "t2.micro"  # Change this to your desired instance type
  user_data = 
 
}
