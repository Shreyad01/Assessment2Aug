# backend.tf
terraform {
  backend "s3" {
    bucket         = "s3state-bucket-shreya"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "db-shreya"
  }
}
