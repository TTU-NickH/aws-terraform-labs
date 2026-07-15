variable "instance_name" {
  description = "Name tag for the EC3 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "AWS Key Pair name"
  type        = string
}

variable "vpc_id" {
  description = "VPC where the security group will be created"
  type        = string
}

variable "subnet_id" {
  description = "Subnet where the EC2 instannce will be launched"
  type        = string
}