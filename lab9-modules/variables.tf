variable "aws_region" {
  description = "AWS region for Lab 9"
  type        = string
}

variable "instance_name" {
  description = "Name assigned to the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Existing AWS EC2 key pair name"
  type        = string
}