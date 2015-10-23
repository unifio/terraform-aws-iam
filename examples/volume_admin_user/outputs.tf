## Outputs

output "user_id" {
  value = "${module.volume_admin_user.user_id}"
}

output "access_key_id" {
  value = "${module.volume_admin_user.user_access_key_id}"
}

output "access_key_secret" {
  value = "${module.volume_admin_user.user_access_key_secret}"
}

output "user_policy_ids" {
  value = "${module.volume_admin_user.user_policy_ids}"
}
