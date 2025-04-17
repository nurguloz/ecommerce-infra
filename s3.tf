resource "random_id" "unique_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "ecommerce_app_data" {
  bucket        = "ecommerce-app-data-${random_id.unique_suffix.hex}"
  force_destroy = true

  tags = {
    Name        = "ecommerce-app-data"
    Environment = "development"
    Project     = "EcommerceInfra"
  }
}
