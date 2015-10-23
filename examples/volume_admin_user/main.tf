provider "aws" {
  region = "us-west-2"
}

module "volume_admin_user" {
  # Example GitHub source
  #source = "github.com/unifio/terraform-aws-iam?ref=master//iam_user"
  source = "../../iam_user"
  username = "VolumeAdminUser"
  path = "/system/"
  actions = "ec2:Describe*,ec2:AttachVolume,ec2:DetachVolume,ec2:CreateVolume"
  effects = "Allow"
  resources = "*"
}
