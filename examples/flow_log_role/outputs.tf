## Outputs
output "flow_log_role" {
  value = "${module.flow_log_role.iam_role}"
}

output "flow_log_policy_ids" {
  value = "${module.flow_log_role.policy_ids}"
}
