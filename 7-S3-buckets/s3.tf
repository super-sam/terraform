resource "aws_s3_bucket" "my_bucket" {
  bucket = "super-sam"
  acl    = "public-read"

  tags = {
    Name        = "Super Sam"
    Environment = "Dev"
  }
}