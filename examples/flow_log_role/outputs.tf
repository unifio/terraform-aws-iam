## Outputs

output "flow_log_role" {
  value = "${module.flow_log_role.role_id}"
}

output "flow_log_policy_ids" {
  value = "${module.flow_log_role.role_policy_ids}"
}
