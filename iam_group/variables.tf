# Input Variables
variable "groupname" {}

variable "path" {
  default = "/"
}

# comma separted list of iam user names
variable "members" {}

# Action list ie "ec2:Describe,ec2:AttachVolume"
variable "actions" {}

# Action disposition (Allow | Deny), 1:1 between actions and action_types
variable "effects" {}

# Resource filter for the action/action_types eg, "*" or the id of an aws Resource
variable "resources" {}
