resource "aws_iam_role" "role" {
    name = "${var.rolename}"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "${var.service}"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "role_policies" {
    count = "${length(split(",",var.actions))}"
    name = "${var.rolename}-policy-${count.index}"
    role = "${aws_iam_role.role.id}"
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
