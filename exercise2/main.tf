provider "aws" {
  region = "ap-southeast-2"
}

locals {
  users = {
    "user1" = {
      username = "jerome"
      groups   = ["group1", "group2"]
    },
    "user2" = {
      username = "marc"
      groups   = ["group2", "group3"]
    }
  }
}

# Create IAM groups

resource "aws_iam_group" "groups" {
  count = length(keys(local.users))
  name = local.users[keys(local.users)[count.index]]["groups"][count.index]
}

# Create IAM users 

resource "aws_iam_user" "users" {
  count = length(keys(local.users))
  name = local.users[keys(local.users)[count.index]]["username"]
}

# Associate IAM users with their groups

resource "aws_iam_user_group_membership" "group_membership" {
  count = length(keys(local.users))
  user = aws_iam_user.users[count.index].name
  groups = [aws_iam_group.groups[count.index].name]
}
