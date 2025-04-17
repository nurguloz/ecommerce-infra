resource "aws_cloudwatch_log_group" "ecommerce_app_logs" {
  name              = "/aws/ec2/ecommerce-app"
  retention_in_days = 7

  tags = {
    Name        = "Ecommerce App Logs"
    Environment = "development"
    Project     = "EcommerceInfra"
  }
}
