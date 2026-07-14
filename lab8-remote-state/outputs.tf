output "lab_bucket_name" {
  description = "The name of the S3 bucket managed by this Terraform configuration"
  value       = aws_s3_bucket.lab_bucket.bucket
}