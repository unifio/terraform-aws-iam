provider "aws" {
  region = "us-west-2"
}

# create new role to allow capturing of AWS flow logs
module "flow_log_role" {
  # Example GitHub source
  #source = "github.com/unifio/terraform-aws-iam?ref=master//iam_role"
  source = "../../iam_role"
  rolename = "FlowLogRole"
  service = "vpc-flow-logs.amazonaws.com"
  actions = "logs:CreateLogGroup,logs:CreateLogStream,logs:PutLogEvents,logs:DescribeLogGroups,logs:DescribeLogStreams"
  effects = "Allow"
  resources = "*"
}
