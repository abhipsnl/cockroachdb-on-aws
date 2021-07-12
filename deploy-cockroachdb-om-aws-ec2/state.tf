terraform {
  backend "s3" {
    bucket         = "abhishek-terraform-backend"
    region         = "ap-south-1"
    key            = "terraform-state"
    profile        = "aws-dev-profile"
    dynamodb_table = "terraform-lock"
  }
}
