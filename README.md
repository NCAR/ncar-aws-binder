[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/NCAR/ncar-aws-binder/Terraform?label=deploy&logo=terraform&style=for-the-badge)](https://github.com/NCAR/ncar-aws-binder/actions)

# NCAR's BinderHub on AWS

- [NCAR's BinderHub on AWS](#ncars-binderhub-on-aws)
  - [Modules](#modules)
  - [Usage](#usage)
    - [Initialize Terraform workspace](#initialize-terraform-workspace)
    - [Provision the EKS cluster](#provision-the-eks-cluster)
    - [Configure `kubectl`](#configure-kubectl)

Deployment of NCAR binderhub infrastructure on AWS with terraform

## Modules

- `versions.tf`: sets the Terraform version to at least 0.12. It also sets versions for the providers used.
- `variables.tf`: defines variables used throughout the configuration.
- `outputs.tf`: defines the output configuration.
- `vpc.tf` provisions a VPC, subnets and availability zones using the [AWS VPC Module](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws). A new VPC is created for our cluster so it doesn't impact the default cloud environment and resources
- `eks-cluster.tf` provisions all the resources (AutoScaling Groups, etc...) required to set up an EKS cluster in the private subnets and bastion servers to access the cluster using the [AWS EKS Module](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws).

## Usage

### Initialize Terraform workspace

From the root directory of this repo, run `terraform init` to initialize your Terraform workspace:

```bash
$ terraform init
Initializing modules...

Initializing the backend...

Initializing provider plugins...

Terraform has been successfully initialized!
```

### Provision the EKS cluster

Run terraform apply and review the planned actions.

```bash
$ terraform apply
module.eks.data.aws_ami.eks_worker_windows: Refreshing state...
module.eks.data.aws_caller_identity.current: Refreshing state...
module.vpc.aws_vpc.this[0]: Refreshing state... [id=vpc-0b69df476ca797204]
module.eks.data.aws_ami.eks_worker: Refreshing state...
module.eks.data.aws_partition.current: Refreshing state...
module.eks.data.aws_iam_policy_document.cluster_assume_role_policy: Refreshing state...
module.vpc.aws_eip.nat[0]: Refreshing state... [id=eipalloc-0bbf940a0a77d3a43]
module.eks.data.aws_iam_policy_document.workers_assume_role_policy: Refreshing state...
module.eks.aws_iam_role.cluster[0]: Refreshing state... [id=ncar-binder-aws20200713145136611700000001]
module.eks.aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy[0]: Refreshing state...
...
...
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes
...
```

This step takes around 12-15 minutes. Upon successful cluster provisioning, the outputs defined in `outputs.tf` will be printed in the terminal.

### Configure `kubectl`

To configure `kubectl`, you will need to look find the cluster name in the outputs, and pass this name to `aws eks` command:

```bash
$ aws eks --region us-west-2 update-kubeconfig --name ncar-binder-aws
```
