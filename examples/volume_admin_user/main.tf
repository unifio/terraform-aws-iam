provider "aws" {

}

module "volume_admin_user" {
  source = "../../iam_user"
  username = "VolumeAdminUser"
  path = "/system/"
  actions = "ec2:Describe*,ec2:AttachVolume,ec2:DetachVolume,ec2:CreateVolume"
  action_privs = "Allow,Allow,Allow,Allow"
  resources = "*,*,*,*"
}
