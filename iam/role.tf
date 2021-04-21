


resource "aws_iam_role" "role" {
name = var.role
assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

resource "aws_iam_instance_profile" "instance_profile" {
  name = var.role
  role = aws_iam_role.role.name
}

resource "aws_iam_policy_attachment" "ec2-attach" {
  name       = "ec2"
  
  roles      = [aws_iam_role.role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_policy_attachment" "ssm-attach" {
  name       = "ssm"
  
  roles      = [aws_iam_role.role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}