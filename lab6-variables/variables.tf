variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "AWS EC2 Kye Pair name"
  type        = string
}

variable "instance_name" {
  description = "Name tag assigned to the EC2 instance"
  type        = string
}

variable "repository_url" {
  description = "Public GitHub repository containing the Weather App"
  type        = string
}