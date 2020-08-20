region = "us-west-2"

# profile = "ncar-terraform-bot"

# See https://docs.aws.amazon.com/eks/latest/userguide/add-user-role.html for
# more information
map_users = [{
  userarn  = "arn:aws:iam::765210042771:user/andersy005"
  username = "andersy005"
  groups   = ["system:masters"]
  },
  {
    userarn  = "arn:aws:iam::765210042771:user/terraform-bot"
    username = "terraform-bot"
    groups   = ["system:masters"]
  }
]

# prefix for resources in this infrastructure
name_prefix = "ncar-binder-"
