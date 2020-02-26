resource "aws_lambda_function" "test_lambda_with_api_gateway"{
    filename      = "${var.lambda_filename}.zip"
    function_name = "${var.lambda_function_name}"
    role          = "${aws_iam_role.iam_for_lambda_api_gateway.arn}"
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

resource "aws_iam_role" "iam_for_lambda_api_gateway"{
    name = "iam_for_lambda_api_gateway"
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

resource "aws_api_gateway_resource" "MyDemoAPIResource" {
  rest_api_id = "${aws_api_gateway_rest_api.MyDemoAPI.id}"
  parent_id   = "${aws_api_gateway_rest_api.MyDemoAPI.root_resource_id}"
  path_part   = "${var.aws_api_uri_path}"
}

resource "aws_api_gateway_method" "MyDemoAPIResource" {
  rest_api_id   = "${aws_api_gateway_rest_api.MyDemoAPI.id}"
  resource_id   = "${aws_api_gateway_resource.MyDemoAPIResource.id}"
  http_method   = "${var.aws_api_method_type_post}"
  authorization = "NONE"
}

resource "aws_api_gateway_deployment" "test_lambda_with_api_gateway" {
   depends_on = [
     aws_api_gateway_integration.MyDemoAPIIntegration,
   ]

   rest_api_id = aws_api_gateway_rest_api.MyDemoAPI.id
   stage_name  = "dev"
 }