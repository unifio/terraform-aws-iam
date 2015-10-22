## Outputs

output "group_id" {
  value = "${module.volume_admin_group.group_id}"
}

output "group_policy_ids" {
  value = "${module.volume_admin_group.group_policy_ids}"
}
