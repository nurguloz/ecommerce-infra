resource "aws_db_subnet_group" "ecommerce_db_subnet_group" {
  name       = "ecommerce-db-subnet-group"
  subnet_ids = aws_subnet.private[*].id

  tags = {
    Name    = "Ecommerce DB Subnet Group"
    Project = "EcommerceInfra"
  }
}

resource "aws_security_group" "ecommerce_rds_sg" {
  name   = "ecommerce-rds-sg"
  vpc_id = aws_vpc.main.id

  ingress {
    description     = "Allow MySQL from app instances"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "Ecommerce RDS SG"
    Project = "EcommerceInfra"
  }
}

resource "aws_db_instance" "ecommerce_mysql" {
  identifier             = "ecommerce-mysql-db"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  db_name                = "ecommercedb"
  username               = "admin"
  password               = "MySecurePass123!"  # Use AWS Secrets Manager in production
  skip_final_snapshot    = true
  publicly_accessible    = false
  db_subnet_group_name   = aws_db_subnet_group.ecommerce_db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.ecommerce_rds_sg.id]

  tags = {
    Name        = "ecommerce-mysql-db"
    Environment = "development"
    Project     = "EcommerceInfra"
  }
}
