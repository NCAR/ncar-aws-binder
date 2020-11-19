# NCAR-AWS-Hub Infrastructure

| JupyterHub Infrastructure |    [![GitHub Workflow Status][jhub-infra-badge]][jhub-infra-link]     |
| :------------------------ | :-------------------------------------------------------------------: |
| **Docker Image Build**    | [![Docker Image Build Status][docker-build-badge]][docker-build-link] |
| **qhub Auto Update**      |   [![qhub Auto Update Status][qhub-update-badge]][qhub-update-link]   |

This guide is intended to show how to deploy and maintain a jupyterhub
cluster along with its related components. Infastructure as code is
used, via GitHub Actions and Terraform, such that this repository will
always reflect the exact state of the cluster. Advantages of this
infrastructure as code approach:

- reduce the requirements for developers on their machines
- restrict modifications to infrastructure
- enable review of infastructure changes
- allow arbitrary users to request infrastructure changes

In practice GitHub Actions controls everything.

## Dependencies

- [awscli](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
- [aws-iam-authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [helm](https://helm.sh/) version **3+**
- [terraform](https://www.terraform.io/downloads.html) version **v0.13.4**

## Development

Adding `terraform-state` and `infastructure`

## Deployment

[jhub-infra-badge]: https://img.shields.io/github/workflow/status/NCAR/ncar-aws-binder/Jupyterhub%20Infrastructure?label=deploy&logo=terraform&style=for-the-badge
[jhub-infra-link]: TODO
[docker-build-badge]: https://img.shields.io/github/workflow/status/NCAR/ncar-aws-binder/Docker%20Image%20Build?logo=docker&style=for-the-badge
[docker-build-link]: TODO
[qhub-update-badge]: https://img.shields.io/github/workflow/status/NCAR/ncar-aws-binder/qhub%20auto%20update?label=qhub-update&style=for-the-badge
[qhub-update-link]: TODO
