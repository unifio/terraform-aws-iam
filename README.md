# Terraform AWS IAM Stack #
[![Circle CI](https://circleci.com/gh/unifio/terraform-aws-iam.svg?style=svg)](https://circleci.com/gh/unifio/terraform-aws-iam)

Module stack that supports AWS IAM Role, User, and Group managment.  Role, User, and Group Objects are created with policies attached and grouped by effect.

Requirements
----------------------

- Terraform 0.6.4 or newer
- AWS provider


## Role Module ##

The Role module provisions an AWS Role, with support for multiple policy attachment

### Input Variables ###

- `rolename` - The name of the role.
- `service` - The name of the service the role is for, such as "ec2.amazonaws.com"
- `actions` - '/' and ',' separated list of action groups".  Action groups are separated by a '/', and individual actions within an action group are seperated by a ','.  This allows for efficient grouping of actions into policies by effect.  
- `effects` - Comma separated list of effects,  such as "Allow,Deny".  Each item in this list is associated with the action group at the same index.
- `resources` - Comma separated list of resource specifications for the action/effect to apply to.  Use a resource URN for a specific resource, or "\*", to apply to all.  Each item in this list is associated with the action group and effect at the same index.

### Usage ###

The example below creates a role named "VolumeManagerRole" in which an instance with this role would be allowed ('Allow' effect) to Describe, Attach, Detach or Create a volume, but would not be allowed ('Deny' effect) to delete or modify a volume

```js
module "volume_admin_role" {

  source = "github.com/unifio/terraform-aws-iam//iam_role"
  rolename = "VolumeManagerRole"
  service = "ec2.amazonaws.com"
  actions = "ec2:DescribeVolume,ec2:AttachVolume,ec2:DetachVolume,ec2:CreateVolume/ec2:DeleteVolume,ec2:ModifyVolumeAttribute"
  effects = "Allow,Deny"
  resources = "*,*,"
}
```
### Outputs ###

- `role_id` - ID of the IAM role
- `role_name` - Name of the IAM role
- `role_arn` - The ARN (Amazon Resource Name) of the role object created
- `role_policy_ids` - Comma separated list of policy ids attached to the role

## User Module ##

The Role module provisions an AWS User, with support for multiple policy attachment

### Input Variables ###

- `username` - The name of the role.
- `path` - The path to create the user in.  Defaults to "/"
- `actions` - '/' and ',' separated list of action groups".  Action groups are separated by a '/', and individual actions within an action group are seperated by a ','.  This allows for efficient grouping of actions into policies by effect.  ".
- `effects` - Comma separated list of effects,  such as "Allow,Allow,Deny".  Each item in this list is associated with the action group at the same index.
- `resources` - Comma separated list of resource specifications for the action/effect to apply to.  Use a resource URN for a specific resource, or "\*", to apply to all.  Each item in this list is associated with the action group and effect at the same index.

### Usage ###

```js
module "volume_admin_user" {
  source = "github.com/unifio/terraform-aws-iam//iam_user"
  username = "VolumeAdminUser"
  path = "/system/"
  actions = "ec2:Describe*,ec2:AttachVolume,ec2:DetachVolume,ec2:CreateVolume"
  effects = "Allow"
  resources = "*"
}
```
### Outputs ###

- `user_id` - ID of the IAM User
- `user_name` - Name of the IAM User
- `user_arn` - The ARN (Amazon Resource Name) of the user object created
- `user_access_key_id` - Access key for the IAM User
- `user_access_key_secret` - Secret key for the IAM User.  This is also written to the state file.
- `user_policy_ids` - Comma separated list of the policies that are attached to the IAM User.

## Group Module ##

The Role module provisions an AWS Group, adding a list of members, with support for multiple policy attachment

### Input Variables ###

- `groupname` - The name of the group.
- `path` - The path to create the group in.  Defaults to "/"
- `actions` - '/' and ',' separated list of action groups".  Action groups are separated by a '/', and individual actions within an action group are seperated by a ','.  This allows for efficient grouping of actions into policies by effect.  ".
- `effects` - Comma separated list of effects,  such as "Allow,Allow,Deny".  Each item in this list is associated with the action group at the same index.
- `resources` - Comma separated list of resource specifications for the action/effect to apply to.  Use a resource URN for a specific resource, or "\*", to apply to all.  Each item in this list is associated with the action group and effect at the same index.

### Usage ###

```js
module "volume_admin_group" {
  source = "github.com/unifio/terraform-aws-iam//iam_group"
  groupname = "VolumeAdminGroup"
  path = "/groups/"
  actions = "ec2:Describe*,ec2:AttachVolume,ec2:DetachVolume,ec2:CreateVolume"
  effects = "Allow"
  resources = "*"
  members = "${aws_iam_user.user_one.name},${aws_iam_user.user_two.name}"
}
```
### Outputs ###

- `group_id` - ID of the IAM Group
- `group_name` - Name of the IAM Group
- `group_arn` - The ARN (Amazon Resource Name) of the user object created
- `group_policy_ids` - Comma separated list of the policies that are attached to the IAM Group.


## Examples

See the [examples](examples) directory for a complete set of example source files.

## License ##

MPL 2. See LICENSE for full details.
