## Outputs

output "iam_role" {
  value = "${aws_iam_role.role.id}"
}

output "policy_ids" {
  value = "${join(",",aws_iam_role_policy.role_policies.*.id)}"
}
