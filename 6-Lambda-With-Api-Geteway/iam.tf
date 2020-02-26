# resource "aws_iam_role" "iam_for_lambda_api_gateway"{
#     name = "iam_for_lambda_api_gateway"
#     assume_role_policy = <<EOF
# {
#         "Version": "2012-10-17",
#         "Statement": [
#             {
#             "Action": "sts:AssumeRole",
#             "Principal": {
#                 "Service": "lambda.amazonaws.com"
#             },
#             "Effect": "Allow",
#             "Sid": ""
#             }
#         ]
# }
# EOF
# }
