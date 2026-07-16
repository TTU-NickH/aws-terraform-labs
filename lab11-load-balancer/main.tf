terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "lab_vpc" {
  cidr_block           = "10.11.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "Terraform-Lab11-VPC"
  }
}

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.lab_vpc.id
  cidr_block              = "10.11.1.0/24"
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "Terraform-Lab11-Public-A"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.lab_vpc.id
  cidr_block              = "10.11.2.0/24"
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "Terraform-Lab11-Public-B"
  }
}

resource "aws_internet_gateway" "lab_igw" {
  vpc_id = aws_vpc.lab_vpc.id

  tags = {
    Name = "Terraform-Lab11-IGW"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.lab_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab_igw.id
  }

  tags = {
    Name = "Terraform-Lab11-Public-Route-Table"
  }
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "alb_sg" {
  name        = "terraform-lab11-alb-sg"
  description = "Allow HTTP traffic to the Application Load Balancer"
  vpc_id      = aws_vpc.lab_vpc.id

  ingress {
    description = "Allow HTTP from the internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Terraform-Lab11-ALB-SG"
  }
}

module "web_servers" {
  source   = "./modules/ec2"
  for_each = var.web_servers

  instance_name         = each.key
  instance_type         = each.value.instance_type
  key_name              = var.key_name
  vpc_id                = aws_vpc.lab_vpc.id
  subnet_id             = each.value.subnet_key == "public-a" ? aws_subnet.public_a.id : aws_subnet.public_b.id
  alb_security_group_id = aws_security_group.alb_sg.id
}

resource "aws_lb" "web_alb" {
  name               = "terraform-lab11-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]

  subnets = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id
  ]

  tags = {
    Name = "Terraform-Lab11-ALB"
  }
}

resource "aws_lb_target_group" "web_tg" {
  name     = "terraform-lab11-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.lab_vpc.id

  health_check {
    path = "/"

    protocol = "HTTP"

    matcher = "200"

    interval = 30

    timeout = 5

    healthy_threshold = 2

    unhealthy_threshold = 2
  }

  tags = {
    Name = "Terraform-Lab11-TG"
  }
}

resource "aws_lb_target_group_attachment" "web_servers" {
  for_each = module.web_servers

  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id        = each.value.instance_id
  port             = 80
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}