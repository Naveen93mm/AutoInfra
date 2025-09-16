provider "aws" {
  region = "ap-south-1" # Mumbai
}

# Security Group - Allow SSH + HTTP
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-0dee22c13ea7a9a67" 
  instance_type = "t2.micro"
  key_name      = "naveen-key" 
  security_groups = [aws_security_group.web_sg.name]

  user_data = file("provision.sh") 
}
