# Outputs the ALB DNS name after provisioning

output "alb_dns" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.web_alb.dns_name
}
