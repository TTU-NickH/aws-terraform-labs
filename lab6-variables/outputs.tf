output "public_ip" {
  description = "Public IP address of the Weather App EC2 instance"
  value       = aws_instance.web_server.public_ip
}

output "website_url" {
  description = "URL used to access the deployed Weather App"
  value       = "http://${aws_instance.web_server.public_ip}"
}