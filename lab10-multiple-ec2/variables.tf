variable "aws_region" {
  description = "AWS region for Lab 10"
  type        = string
}

variable "key_name" {
  description = "Existing AWS EC2 key pair name"
  type        = string
}

variable "web_servers" {
  description = "Map of EC2 web servers to create"

  type = map(object({
    instance_type = string
  }))
}