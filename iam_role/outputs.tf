## Outputs

output "role_id" {
  value = "${aws_iam_role.role.id}"
}

output "role_name" {
  value = "${aws_iam_role.role.name}"
}

output "role_arn" {
  value = "${aws_iam_role.role.arn}"
}

output "role_policy_ids" {
  value = "${join(",",aws_iam_role_policy.role_policies.*.id)}"
}
