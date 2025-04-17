# Declares reusable variables for your infrastructure

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ami_id" {
  default = "ami-0c02fb55956c7d316"  # Amazon Linux 2 in us-east-1
}
