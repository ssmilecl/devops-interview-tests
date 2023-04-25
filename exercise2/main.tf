terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.61.0"
    }
  }
}
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

# Create the IAM groups
resource "aws_iam_group" "groups" {
  for_each = toset(flatten([for user in local.users : user.groups]))
  name = each.key
}

# Create the IAM users
resource "aws_iam_user" "users" {
  for_each = local.users
  name = each.value.username
}


# Associate IAM users with their groups
resource "aws_iam_user_group_membership" "membership" {
  for_each = { for user in local.users : user.username => user }
  user = each.value.username
  groups = each.value.groups
  depends_on = [
    aws_iam_user.users,aws_iam_group.groups
  ]
}

##output "groups" {
  ##value = aws_iam_group.groups
##}

##output "user_group_memberships" {
  ##value = aws_iam_user_group_membership.membership
##}
