variable "aws_region" {
  type = string
}

variable "key_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "db_username" {
  description = "Administrator username for the RDS database"
  type        = string
  default     = "adminuser"
}

variable "db_password" {
  description = "Administrator password for the RDS database"
  type        = string
  sensitive   = true
}