provider "aws" {
  region = "us-west-2"
}

resource "aws_iam_user" "user_one" {
  name = "test-user"
}

resource "aws_iam_user" "user_two" {
  name = "test-user-two"
}

module "volume_admin_group" {
  # Example GitHub source
  #source = "github.com/unifio/terraform-aws-iam?ref=master//iam_group"
  source = "../../iam_group"
  groupname = "VolumeAdminGroup"
  path = "/groups/"
  actions = "ec2:Describe*,ec2:AttachVolume,ec2:DetachVolume,ec2:CreateVolume"
  effects = "Allow"
  resources = "*"
  members = "${aws_iam_user.user_one.name},${aws_iam_user.user_two.name}"
}
