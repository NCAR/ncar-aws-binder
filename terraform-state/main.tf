provider "aws" {
  region = "us-west-2"
}

module "terraform-state" {
  source = "github.com/quansight/qhub-terraform-modules//modules/aws/terraform-state"

  name = "ncar-aws-hub"

  tags = {
    Organization = "ncar-aws-hub"
    Project      = "terraform-state"
    Environment  = "dev"
  }
}
