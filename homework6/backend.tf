terraform {
  backend "s3" {
    bucket         = "kaizenkg"
    key            = "ohio/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "state-lock"
  }
}
