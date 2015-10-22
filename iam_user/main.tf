resource "aws_iam_user" "user" {
    name = "${var.username}"
    path = "${var.path}"
}

resource "aws_iam_access_key" "access_key" {
    user = "${aws_iam_user.user.name}"
}

resource "aws_iam_user_policy" "user_policies" {
    count = "${length(split(",",var.actions))}"
    name = "${var.username}-policy-${count.index}"
    user = "${aws_iam_user.user.name}"
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
