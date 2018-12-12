

output "inspec_lambda_role_id" {
  value = "${aws_iam_role.inspec_lambda_role.arn}"
}