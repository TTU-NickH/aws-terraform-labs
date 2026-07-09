terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_security_group" "web_sg" {
  name        = "terraform-lab4-web-sg"
  description = "Allow SSH and HTTP"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  key_name      = "Nick-key"

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data_replace_on_change = true

  user_data = <<-EOF
  #!/bin/bash
  dnf update -y
  dnf install -y httpd
  systemctl enable httpd
  systemctl start httpd
  echo "<h1>Hello from Terraform Lab 4!</h1>" > /var/www/html/index.html
  EOF

  tags = {
    Name = "Terraform-Lab4-User-Data"
  }

}

output "public_ip" {
  value = aws_instance.web_server.public_ip
}