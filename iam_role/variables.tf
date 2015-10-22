# Input Variables
variable "rolename" {}

# Service the role uses, eg "ec2.amazonaws.com"
variable "service" {}

# Action list ie "ec2:Describe,ec2:AttachVolume"
variable "actions" {}

# Action disposition (Allow | Deny), 1:1 between actions and action_types
variable "action_privs" {}

# Resource filter for the action/action_types eg, "*" or the id of an aws Resource
variable "resources" {}
