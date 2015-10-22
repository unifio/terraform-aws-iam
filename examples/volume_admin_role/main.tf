provider "aws" {

}

# create new role with attached policies for various ec2 actions
module "volume_mgr_role" {
  source = "../../iam_role"
  rolename = "VolumeManagerRole"
  service = "ec2.amazonaws.com"
  actions = "ec2:Describe*,ec2:AttachVolume,ec2:DetachVolume,ec2:CreateVolume"
  action_privs = "Allow,Allow,Allow,Allow"
  resources = "*,*,*,*"
}

# create instance profile using new role and policies

resource "aws_iam_instance_profile" "test_instance_profile" {
  name = "VolumeManagerInstanceProfile"
  roles = ["${module.volume_mgr_role.iam_role}"]
}
