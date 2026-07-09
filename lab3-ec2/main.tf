terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.0"
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

resource "aws_security_group" "ec2_sg" {
  name        = "terraform-ec2-sg"
  description = "Allow SSH access"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbund traffic"
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

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "Terraform-Lab3-EC2"
  }
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
}

