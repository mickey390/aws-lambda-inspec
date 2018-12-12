resource "aws_iam_role" "inspec_lambda_role" {
  name = "inspec_lambda_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
data "aws_iam_policy_document" "inspec_lambda_policy_doc" {

  statement {
    actions = [
      "s3:Get*",
      "s3:List*",
      "s3:PutObject"
    ]

    resources = [
      "*",
    ]
  }

  statement {
    actions = [
      "logs:CreateLogStream"
    ]

    resources = [
      "*",
    ]
  }
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:PutLogEvents",
    ]

    resources = [
      "arn:aws:logs:*:*:*",
    ]
  }
}
resource "aws_iam_role_policy" "inspec_lambda_policy_doc" {
  name = "inspec_lambda-policy"
  role = "${aws_iam_role.inspec_lambda_role.name}"
  policy = "${data.aws_iam_policy_document.inspec_lambda_policy_doc.json}"
}