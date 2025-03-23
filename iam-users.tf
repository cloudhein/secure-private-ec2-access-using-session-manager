resource "aws_iam_user" "ssm_user" {
  name = "ssm_user"

  tags = {
    Name = "ssm_user"
  }
}

resource "aws_iam_access_key" "ssm_user_access_keys" {
  user = aws_iam_user.ssm_user.name
}

resource "aws_iam_user_policy" "ssm_user_policy" {
  name = "ssm_user_policy"
  user = aws_iam_user.ssm_user.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ssm:StartSession",
          "ssm:SendCommand",
          "ssm:GetConnectionStatus",
          "ssm:DescribeInstanceInformation",
          "ssm:TerminateSession",
          "ssm:ResumeSession"
        ]
        Resource = "*"
      }
    ]
  })
}