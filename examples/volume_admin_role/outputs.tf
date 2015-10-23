## Outputs

output "volume_mgr_role" {
  value = "${module.volume_mgr_role.role_id}"
}

output "volume_mgr_policy_ids" {
  value = "${module.volume_mgr_role.role_policy_ids}"
}

output "instance_profile_id" {
  value = "${aws_iam_instance_profile.test_instance_profile.id}"
}
