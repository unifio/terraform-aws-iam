## Outputs

output "group_id" {
  value = "${aws_iam_group.group.id}"
}

output "group_arn" {
  value = "${aws_iam_group.group.arn}"
}

output "group_name" {
  value = "${aws_iam_group.group.name}"
}

output "group_policy_ids" {
  value = "${join(",",aws_iam_group_policy.group_policies.*.id)}"
}
