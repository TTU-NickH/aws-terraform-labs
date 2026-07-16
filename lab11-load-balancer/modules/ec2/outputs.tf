output "instance_id" {
  description = "ID of the EC2 instance created by the module"
  value       = aws_instance.this.id

}
output "public_ip" {
  description = "Public IP addressof the EC2 instance"
  value       = aws_instance.this.public_ip
}

output "website_url" {
  description = "HTTP URL for the EC2 web server"
  value       = "http://${aws_instance.this.public_ip}"
}

output "security_group_id" {
  description = "ID of the security group created by the module"
  value       = aws_security_group.web_sg.id
}