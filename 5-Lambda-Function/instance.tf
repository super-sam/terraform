resource "aws_lambda_function" "test_lambda" {
  filename      = "${var.lambda_filename}.zip"
  function_name = "${var.lambda_function_name}"
  role          = "${aws_iam_role.iam_for_lambda.arn}"
  handler       = "${var.lambda_handler}"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = "${filebase64sha256("${var.lambda_filename}.zip")}"

  runtime = "${var.node_runtime}"
  
  tags = {
    ProductCode = "${var.product_code_tag}"
    Environment = "${var.environment_tag}"
  }
  environment {
    variables = {
      foo = "bar"
    }
  }
}