variable "name" {
  type    = string
  default = "ncar-aws-hub"
}

variable "environment" {
  type    = string
  default = "dev"
}


variable "region" {
  type    = string
  default = "us-west-2"
}

variable "availability_zones" {
  description = "AWS availability zones within AWS region"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b"]
}

variable "vpc_cidr_block" {
  description = "VPC cidr block for infastructure"
  type        = string
  default     = "10.10.0.0/16"
}
# jupyterhub
variable "endpoint" {
  description = "Jupyterhub endpoint"
  type        = string
  default     = "jupyter.ncar-aws-hub.andersonbanihirwe.dev"
}

variable "jupyterhub-image" {
  description = "Jupyterhub user image"
  type = object({
    name = string
    tag  = string
  })
  default = {
    name = "quansight/qhub-jupyterhub"
    tag  = "1abd4efb8428a9d851b18e89b6f6e5ef94854334"
  }
}

variable "jupyterlab-image" {
  description = "Jupyterlab user image"
  type = object({
    name = string
    tag  = string
  })
  default = {
    name = "quansight/qhub-jupyterlab"
    tag  = "1abd4efb8428a9d851b18e89b6f6e5ef94854334"
  }
}

variable "dask-worker-image" {
  description = "Dask worker image"
  type = object({
    name = string
    tag  = string
  })
  default = {
    name = "quansight/qhub-dask-worker"
    tag  = "1abd4efb8428a9d851b18e89b6f6e5ef94854334"
  }
}
