resource "aws_iam_group" "group" {
    name = "${var.groupname}"
    path = "${var.path}"
}

resource "aws_iam_group_policy" "group_policies" {
    count = "${length(split(",",var.actions))}"
    name = "${var.groupname}-policy-${count.index}"
    group = "${aws_iam_group.group.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
       "${element(split(",",var.actions),count.index)}"
      ],
      "Effect": "${element(split(",",var.action_privs),count.index)}",
      "Resource": "${element(split(",",var.resources),count.index)}"
    }
  ]
}
EOF
}

resource "aws_iam_group_membership" "group_members" {
    name = "${var.groupname}"
    users = [
        "${split(",",var.members)}"
    ]
    group = "${aws_iam_group.group.name}"
}
