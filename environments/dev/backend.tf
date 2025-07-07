terraform {
  backend "s3" {
    bucket         = "tfstate-jfc-dev"
    key            = "cloud-ecommerce-jfc/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
