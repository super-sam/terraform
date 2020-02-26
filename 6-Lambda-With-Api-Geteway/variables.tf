variable "lambda_filename" {
    default = "lambdaFunctionWithAPI"
}

variable "lambda_function_name" {
    default = "lambdaFunctionWithAPI"
}

variable "lambda_handler" {
    default = "index.handler"
}

variable "node_runtime" {
    default = "nodejs12.x"
}

variable "product_code_tag" {
    default = "AM1203"
}

variable "environment_tag" {
    default = "dev1"
}

variable "aws_api_name" {
    default = "MyDemoAPIWithLambda"
}

variable "aws_api_description" {
    default = "This is my API with Lambda integration for demonstration purposes"
}

variable "aws_api_uri_path" {
    default = "calltolambda"
}

variable "aws_api_method_type_post" {
    default = "POST"
}
