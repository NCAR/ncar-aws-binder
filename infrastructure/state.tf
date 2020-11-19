terraform {
  backend "s3" {
    bucket         = "ncar-aws-hub-terraform-state"
    key            = "terraform/ncar-aws-hub.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "ncar-aws-hub-terraform-state-lock"
  }
}
