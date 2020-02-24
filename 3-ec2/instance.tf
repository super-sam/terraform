provider "aws" {
  profile       = "${var.profile}"
  region        = "${var.region}"
}


resource "aws_instance" "tf_example" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
}
