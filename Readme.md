# Terraform AWS IAM Stack # [![Circle CI](https://circleci.com/gh/unifio/terraform-aws-iam/tree/master.svg?style=svg)](https://circleci.com/gh/unifio/terraform-aws-iam/tree/master)

Module stack that supports AWS IAM Role, User, and Group managment.  Role, User, and Group Objects are created with policies attached

Requirements
----------------------

- Terraform 0.6.4 or newer
- AWS provider


## Role Module ##

The Role module provisions an AWS Role, with support for multiple policy attachment

### Input Variables ###

- `rolename` - The name of the role.
- `service` - The name of the service the role is for, such as "ec2.amazonaws.com"
- `actions` - Comma separated list of actions to Allow/Deny, such as "ec2:Describe*,ec2:AttachVolume".
- `action_privs` - Comma separated list of action privileges,  such as "Allow,Allow,Deny".  Each item in this list is associated with the action item at the same index.
- `resources` - Comma separated list of resource specifications for the action/action_type to apply to.  Use a resource URN for a specific resource, or "\*", to apply to all.  Each item in this list is associated with the action item, and action privilege at the same index.

### Usage ###

```js
module "volume_admin_role" {

  source = "github.com/unifio/terraform-aws-iam//iam_role"
  rolename = "VolumeManagerRole"
  service = "ec2.amazonaws.com"
  actions = "ec2:Describe*,ec2:AttachVolume,ec2:DetachVolume,ec2:CreateVolume"
  action_privs = "Allow,Allow,Allow,Allow"
  resources = "*,*,*,*"
}
```
### Outputs ###

- `iam_role` - ID of the IAM role
- `policy_ids` - Comma separated list of policy ids attached to the role

## User Module ##

The Role module provisions an AWS User, with support for multiple policy attachment

### Input Variables ###

- `username` - The name of the role.
- `path` - The path to create the user in.  Defaults to "/"
- `actions` - Comma separated list of actions to Allow/Deny, such as "ec2:Describe*,ec2:AttachVolume".
- `action_privs` - Comma separated list of action privileges,  such as "Allow,Allow,Deny".  Each item in this list is associated with the action item at the same index.
- `resources` - Comma separated list of resource specifications for the action/action_type to apply to.  Use a resource URN for a specific resource, or "\*", to apply to all.  Each item in this list is associated with the action item, and action privilege at the same index.

### Usage ###

```js
module "volume_admin_user" {
  source = source = "github.com/unifio/terraform-aws-iam//iam_user"
  username = "VolumeAdminUser"
  path = "/system/"
  actions = "ec2:Describe*,ec2:AttachVolume,ec2:DetachVolume,ec2:CreateVolume"
  action_privs = "Allow,Allow,Allow,Allow"
  resources = "*,*,*,*"
}
```
### Outputs ###

- `user_id` - ID of the IAM User
- `access_key_id` - Access key for the IAM User
- `access_key_secret` - Secret key for the IAM User.  This is also written to the state file.
- `user_policy_ids` - Comma separated list of the policies that are attached to the IAM User.

## Group Module ##

The Role module provisions an AWS Group, adding a list of members, with support for multiple policy attachment

### Input Variables ###

- `groupname` - The name of the group.
- `path` - The path to create the group in.  Defaults to "/"
- `actions` - Comma separated list of actions to Allow/Deny, such as "ec2:Describe*,ec2:AttachVolume".
- `action_privs` - Comma separated list of action privileges,  such as "Allow,Allow,Deny".  Each item in this list is associated with the action item at the same index.
- `resources` - Comma separated list of resource specifications for the action/action_type to apply to.  Use a resource URN for a specific resource, or "\*", to apply to all.  Each item in this list is associated with the action item, and action privilege at the same index.

### Usage ###

```js
module "volume_admin_group" {
  source = "githum.com/unifio/terraform-aws-iam//iam_group"
  groupname = "VolumeAdminGroup"
  path = "/groups/"
  actions = "ec2:Describe*,ec2:AttachVolume,ec2:DetachVolume,ec2:CreateVolume"
  action_privs = "Allow,Allow,Allow,Allow"
  resources = "*,*,*,*"
  members = "${aws_iam_user.user_one.name},${aws_iam_user.user_two.name}"
}
```
### Outputs ###

- `group_id` - ID of the IAM Group
- `group_policy_ids` - Comma separated list of the policies that are attached to the IAM Group.


## Examples

See the [examples](examples) directory for a complete set of example source files.

## License ##

Apache 2 Licensed. See LICENSE for full details.
