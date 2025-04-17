🛠️ AWS E-Commerce Infrastructure with Terraform
Overview
This project provisions a fully functional and scalable AWS infrastructure using Terraform for a modern e-commerce platform. It covers all major cloud infrastructure components including networking, compute, storage, security, database, and monitoring.

✅ Features
1. Networking
VPC with CIDR range 10.0.0.0/16

Two Public Subnets (for ALB)

Two Private Subnets (for EC2 and RDS)

Internet Gateway and Route Tables

Application Load Balancer for distributing traffic across instances

2. Compute
Launch Template with Amazon Linux 2 AMI

Auto Scaling Group (ASG) across private subnets

HTTPD Web Server configured via EC2 user data

Auto-scaling policies to handle load changes

3. Database
Amazon RDS (MySQL) instance

Private Subnet Group for isolation

Security Group restricts access to app instances only

4. Storage
S3 Bucket for storing application data and logs

Bucket name generated with unique ID to avoid collisions

force_destroy enabled for simplified cleanup during development

5. Security
IAM Role and Instance Profile for EC2 instances

Read-only access to S3

CloudWatch monitoring permissions

Security Groups for ALB, EC2, and RDS

Resources tagged for environment and project tracking

6. Monitoring & Logging
CloudWatch Log Group for EC2-level logging

IAM role enables log publishing via the CloudWatch Agent

📁 File Structure

ecommerce-infra/
├── provider.tf                # AWS provider configuration
├── variables.tf               # Input variables
├── vpc.tf                     # VPC and Internet Gateway
├── subnets.tf                 # Public and private subnets
├── route_table.tf             # Route tables for public subnets
├── security_groups.tf         # SGs for ALB, EC2, RDS
├── alb.tf                     # Application Load Balancer
├── asg.tf                     # Launch Template + Auto Scaling Group
├── rds.tf                     # RDS MySQL database setup
├── s3.tf                      # S3 bucket for app data
├── iam.tf                     # IAM role and instance profile for EC2
├── cloudwatch.tf              # CloudWatch log group for app
├── outputs.tf                 # Outputs for RDS endpoint, S3 bucket name


🚀 Deployment Steps

Initialize the project
terraform init
Review the plan
terraform plan
Deploy the infrastructure
terraform apply
Destroy when done (optional)
terraform destroy

📌 Notes
This configuration uses development-friendly defaults (e.g., small instance sizes, force destroy S3 bucket).

For production, consider:

Using Secrets Manager for database passwords

Enabling Multi-AZ and read replicas for RDS

Adding CloudWatch alarms

Using lifecycle rules on S3

🙌 Credits
Project created by Nurgul Ozturk