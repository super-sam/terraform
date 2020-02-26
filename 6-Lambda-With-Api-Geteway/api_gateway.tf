resource "aws_api_gateway_rest_api" "MyDemoAPI" {
  name        = "${var.aws_api_name}"
  description = "${var.aws_api_description}"
}

resource "aws_api_gateway_integration" "MyDemoAPIIntegration" {
  rest_api_id = "${aws_api_gateway_rest_api.MyDemoAPI.id}"
  resource_id = "${aws_api_gateway_resource.MyDemoAPIResource.id}"
  http_method = "${aws_api_gateway_method.MyDemoAPIResource.http_method}"
  
  integration_http_method = "${var.aws_api_method_type_post}"
  type = "AWS"
  uri = aws_lambda_function.test_lambda_with_api_gateway.invoke_arn
}

resource "aws_api_gateway_method_response" "response_200" {
  rest_api_id = "${aws_api_gateway_rest_api.MyDemoAPI.id}"
  resource_id = "${aws_api_gateway_resource.MyDemoAPIResource.id}"
  http_method = "${aws_api_gateway_method.MyDemoAPIResource.http_method}"
  status_code = "200"
}

resource "aws_api_gateway_integration_response" "MyDemoIntegrationResponse" {
    rest_api_id = "${aws_api_gateway_rest_api.MyDemoAPI.id}"
    resource_id = "${aws_api_gateway_resource.MyDemoAPIResource.id}"
    http_method = "${aws_api_gateway_method.MyDemoAPIResource.http_method}"
    status_code = "${aws_api_gateway_method_response.response_200.status_code}"
    response_templates = { "application/json" = "" }
}

resource "aws_lambda_permission" "lambda_permission" {
  statement_id  = "AllowMyDemoAPIInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${var.lambda_function_name}"
  principal     = "apigateway.amazonaws.com"

  # The /*/*/* part allows invocation from any stage, method and resource path
  # within API Gateway REST API.
  source_arn = "${aws_api_gateway_rest_api.MyDemoAPI.execution_arn}/*/*/*"
}