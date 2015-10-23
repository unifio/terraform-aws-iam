# Input Variables
variable "rolename" {}

# Service the role uses, eg "ec2.amazonaws.com"
variable "service" {}

# 2 dimensional action list ie array of arrays
variable "actions" {}

# effects (Allow | Deny), 1:1 between action arrays, effects and resources
variable "effects" {}

# Resource filter for the action arrays/effects eg, "*" or the arn of an aws Resource
variable "resources" {}
