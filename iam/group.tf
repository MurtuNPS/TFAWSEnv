
resource "aws_iam_group" "ssmusers" {
  name = var.group
}

resource "aws_iam_group_policy" "ssmpolicy" {
  name  = "ssm_user_policy"
  group = aws_iam_group.ssmusers.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ssm:StartSession",
                "ssm:SendCommand"
            ],
            "Resource": [
                "arn:aws:ec2:${var.region}:613185332935:instance/*",
                "arn:aws:ssm:${var.region}:613185332935:document/SSM-SessionManagerRunShell",
                "arn:aws:ssm:${var.region}::document/AWS-StartPortForwardingSession"
            ],
            "Condition": {
                "BoolIfExists": {
                    "ssm:SessionDocumentAccessCheck": "true"
                }
            }
        },
        {
            "Effect": "Allow",
            "Action": [
                "ssm:DescribeSessions",
                "ssm:GetConnectionStatus",
                "ssm:DescribeInstanceInformation",
                "ssm:DescribeInstanceProperties",
                "ec2:DescribeInstances"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ssm:TerminateSession"
            ],
            "Resource": [
                "arn:aws:ssm:*:*:session/*"
            ]
        }
    ]
}
EOF
}

/*
resource "aws_iam_group_policy_attachment" "ssm" {
  group      = aws_iam_group.ssmusers.name
  policy_arn = "arn:aws:iam::613185332935:policy/ConnectSSMEndUserPolicy"
}
*/



resource "aws_iam_user" "ssmuser" {
    for_each = {for object in var.users: object=>object}
  name = each.key

}

resource "aws_iam_user_group_membership" "ssmgm" {
    for_each = {for object in var.users: object=>object}
  user = aws_iam_user.ssmuser[each.key].name

  groups = [
    aws_iam_group.ssmusers.name
  ]
}