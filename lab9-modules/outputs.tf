output "instance_id" {
  description = "EC2 instance ID returned by the module"
  value       = module.web_server.instance_id
}

output "public_ip" {
  description = "Public IP returned by the EC2 module"
  value       = module.web_server.public_ip
}

output "website_url" {
  description = "URL of th eweb server created by the module"
  value       = module.web_server.website_url
}

output "security_group_id" {
  description = "Security group ID returned by the module"
  value       = module.web_server.security_group_id
}