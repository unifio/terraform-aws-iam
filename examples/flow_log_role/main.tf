provider "aws" {

}

# create new role to allow capturing of AWS flow logs
module "flow_log_role" {
  source = "../../iam_role"
  rolename = "FlowLogRole"
  service = "vpc-flow-logs.amazonaws.com"
  actions = "logs:CreateLogGroup,logs:CreateLogStream,logs:PutLogEvents,logs:DescribeLogGroups,logs:DescribeLogStreams"
  action_privs = "Allow,Allow,Allow,Allow,Allow"
  resources = "*,*,*,*,*"
}
