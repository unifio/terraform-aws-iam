resource "aws_iam_group" "group" {
    name = "${var.groupname}"
    path = "${var.path}"
}

resource "aws_iam_group_policy" "group_policies" {
    count = "${length(split(",",var.effects))}"
    name = "${var.groupname}-policy-${count.index}-${element(split(",",var.effects),count.index)}"
    group = "${aws_iam_group.group.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        ${join(",",formatlist("\"%s\"",split(",",element(split("/",var.actions),count.index))))}
      ],
      "Effect": "${element(split(",",var.effects),count.index)}",
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
