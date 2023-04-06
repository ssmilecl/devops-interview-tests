provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_iam_group" "group1" {
  name = "group1"
}

resource "aws_iam_group" "group2" {
  name = "group2"
}

resource "aws_iam_group" "group3"{
  name = "group3"
}

resource "aws_iam_user" "jerome" {
  name = "jerome"
}

resource "aws_iam_user" "marc"{
  name = "marc"
}

resource "aws_iam_group_membership" "jerome" {
  name = "${aws_iam_group.group1.name}-membership"
  users = [aws_iam_user.jerome.name]

  group = aws_iam_group.group1.name
}

resource "aws_iam_group_membership" "marc" {
  name = "${aws_iam_group.group2.name}-membership"
  users = [aws_iam_user.marc.name]

  group = aws_iam_group.group2.name
}

resource "aws_iam_group_membership" "jerome_group2" {
  name = "${aws_iam_group.group2.name}-membership"
  users = [aws_iam_user.jerome.name]

  group = aws_iam_group.group2.name
}

resource "aws_iam_group_membership" "marc_group3" {
  name = "${aws_iam_group.group3.name}-membership"
  users = [aws_iam_user.marc.name]

  group = aws_iam_group.group3.name
}
