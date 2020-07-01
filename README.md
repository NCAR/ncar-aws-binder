# NCAR's BinderHub on AWS

[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/NCAR/ncar-aws-binder/terraform?label=deploy&logo=terraform&style=for-the-badge)](https://github.com/NCAR/ncar-aws-binder/actions)

Deployment of NCAR binderhub infrastructure on AWS with terraform

- `versions.tf`: sets the Terraform version to at least 0.12. It also sets versions for the providers used.
- `variables.tf`: defines variables used throughout the configuration.
- `outputs.tf`: defines the output configuration.
