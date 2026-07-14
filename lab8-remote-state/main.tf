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

resource "aws_s3_bucket" "lab_bucket" {
  bucket = var.lab_bucket_name

  tags = {
    Name    = "Terraform-Lab8-Bucket"
    Project = "Remote-State-Lab"
  }
}
