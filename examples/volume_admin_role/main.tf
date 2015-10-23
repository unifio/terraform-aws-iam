provider "aws" {
  region = "us-west-2"
}

# create new role with attached policies for various ec2 actions
# this example illustrates the ability to add seperate roles for seperate
# effects.  One policy will be created for a list of actions to "ALLOW", and
# one will be created for a list of actions to "DENY".  The actions per effect
# are separated by a "/"

module "volume_mgr_role" {
  # Example GitHub source
  #source = "github.com/unifio/terraform-aws-iam?ref=master//iam_role"
  source = "../../iam_role"
  rolename = "VolumeManagerRole"
  service = "ec2.amazonaws.com"
  actions = "ec2:Describe*,ec2:AttachVolume,ec2:DetachVolume,ec2:CreateVolume/ec2:TerminateInstances"
  effects = "Allow,Deny"
  resources = "*,*"
}

# create instance profile using new role and policies

resource "aws_iam_instance_profile" "test_instance_profile" {
  name = "VolumeManagerInstanceProfile"
  roles = ["${module.volume_mgr_role.role_id}"]
}
