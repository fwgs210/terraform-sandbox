# Creates a policy statement to allow lambda functions to assume a role
data "aws_iam_policy_document" "lambda-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "hello" {
  name = "${var.service_name}-${var.stage}-lambda-hello"

  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.lambda-assume-role-policy.json
}

# Creates a policy statement for allowed IAM actions
data "aws_iam_policy_document" "hello" {
  statement {
    resources = [
      "arn:${local.partition}:logs:${local.region}:${local.account_id}:log-group:/aws/lambda/${var.service_name}-${var.stage}-hello-*:*",
    ]
    actions = [
      "logs:CreateLogStream",
      "logs:CreateLogGroup",
      "logs:PutLogEvents"
    ]
  }

}

# Creates a policy for the document
resource "aws_iam_policy" "hello" {
  name   = "${var.service_name}-${var.stage}-hello-lambda-policy"
  path   = "/"
  policy = data.aws_iam_policy_document.hello.json
}

# Attaches the policy to the IAM role
resource "aws_iam_role_policy_attachment" "hello" {
  role       = aws_iam_role.hello.name
  policy_arn = aws_iam_policy.hello.arn
}
