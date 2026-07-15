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

resource "aws_vpc" "lab_vpc" {
  cidr_block           = "10.9.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "Terraform-Lab9-VPC"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.lab_vpc.id
  cidr_block              = "10.9.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Terraform-Lab9-Public-Subnet"
  }
}

resource "aws_internet_gateway" "lab_igw" {
  vpc_id = aws_vpc.lab_vpc.id

  tags = {
    Name = "Terraform-Lab9-IGW"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.lab_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab_igw.id
  }

  tags = {
    Name = "Terraform-Lab9-Public-Route-Table"
  }
}

resource "aws_route_table_association" "public_rta" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

module "web_server" {
  source = "./modules/ec2"

  instance_name = var.instance_name
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_id        = aws_vpc.lab_vpc.id
  subnet_id     = aws_subnet.public_subnet.id
}