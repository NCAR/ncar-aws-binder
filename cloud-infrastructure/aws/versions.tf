provider "aws" {
  version = ">=2.67"
  region  = var.region
  profile = var.profile
}


terraform {
  required_version = ">= 0.12.6"

  # backend "s3" {
  #   bucket  = "ncar-binder-terraform-state-bucket"
  #   key     = "ncar-binder-cluster-config.tfstate"
  #   region  = "us-west-2"
  #   encrypt = true
  # }
}


provider "random" {
  version = "~> 2.1"
}

provider "local" {
  version = "~> 1.2"
}

provider "null" {
  version = "~> 2.1"
}

provider "template" {
  version = "~> 2.1"
}
