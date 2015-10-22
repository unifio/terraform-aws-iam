## Outputs

output "volume_mgr_role" {
  value = "${module.volume_mgr_role.iam_role}"
}

output "volume_mgr_policy_ids" {
  value = "${module.volume_mgr_role.policy_ids}"
}

output "instance_profile_id" {
  value = "${aws_iam_instance_profile.test_instance_profile.id}"
}
