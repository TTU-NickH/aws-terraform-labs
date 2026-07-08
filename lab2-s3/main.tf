terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 6.0"
        }
    }   
}

provider "aws" {
    region = "us-east-2"
}

resource "aws_s3_bucket" "lab_bucket" {
    bucket = "nick-terraform-lab-07072026"
}

output "bucket_name" {
    value = aws_s3_bucket.lab_bucket.bucket
}