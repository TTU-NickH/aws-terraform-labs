variable "aws_region" {
  description = "AWS region for Lab 11"
  type        = string
}
variable "key_name" {
  description = "Existing AWS EC2 key pair name"
  type        = string
}

variable "web_servers" {
  description = "Map of web servers to create"

  type = map(object({
    instance_type = string
    subnet_key    = string
  }))
}