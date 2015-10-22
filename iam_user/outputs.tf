## Outputs

output "user_id" {
  value = "${aws_iam_user.user.id}"
}

output "access_key_id" {
  value = "${aws_iam_access_key.access_key.id}"
}

output "access_key_secret" {
  value = "${aws_iam_access_key.access_key.secret}"
}

output "user_policy_ids" {
  value = "${join(",",aws_iam_user_policy.user_policies.*.id)}"
}
