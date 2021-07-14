terraform {
  backend "s3" {
    bucket         = "abhishek-temp-terraform-backend"
    region         = "us-east-1"
    key            = "terraform-state"
    profile        = "dev"
    dynamodb_table = "terraform-lock"
  }
}
