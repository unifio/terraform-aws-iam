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
    count = "${length(split(",",var.effects))}"
    name = "${var.rolename}-policy-${count.index}-${element(split(",",var.effects),count.index)}"
    role = "${aws_iam_role.role.id}"
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
