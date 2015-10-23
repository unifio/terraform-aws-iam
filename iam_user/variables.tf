# Input Variables
variable "username" {}

# Action list ie "ec2:Describe,ec2:AttachVolume"
variable "actions" {}

# Action disposition (Allow | Deny), 1:1 between actions and action_types
variable "effects" {}

# Resource filter for the action/action_types eg, "*" or the id of an aws Resource
variable "resources" {}

# Path to create the user's home directory in
variable "path" {
  default = "/"
}
