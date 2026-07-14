variable "aws_region" {
  description = "AWS region used for the lab resources"
  type        = string
}

variable "lab_bucket_name" {
  description = "Globally unique name for the S3 bucket managed by Lab 8"
  type        = string
}