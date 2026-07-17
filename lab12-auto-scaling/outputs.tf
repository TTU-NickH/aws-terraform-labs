output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.web_alb.dns_name
}

output "alb_url" {
  description = "URL for the load-balanced web application"
  value       = "http://${aws_lb.web_alb.dns_name}"
}

output "aws_autoscaling_group" {
  description = "Name of the Auto Scaling Group"
  value       = aws_autoscaling_group.web_asg.desired_capacity
}