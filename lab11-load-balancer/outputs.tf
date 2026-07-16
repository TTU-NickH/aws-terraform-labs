output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.web_alb.dns_name
}

output "alb_url" {
  description = "URL used to access the load-balanced web application"
  value       = "http://${aws_lb.web_alb.dns_name}"
}

output "web_server_public_ips" {
  description = "Public IP addresses of the EC2 web servers"

  value = {
    for name, server in module.web_servers :
    name => server.public_ip
  }
}