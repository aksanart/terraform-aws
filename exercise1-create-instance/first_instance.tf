provider "aws" {
  region = "us-east-1"
  # access_key = "" #this is not recomended expose your secret
  # secret_key = "" #this is not recomended expose your secret
}

resource "aws_instance" "intro" {
  ami                    = "ami-06ca3ca175f37dd66"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "web01-tween-dev"
  vpc_security_group_ids = ["sg-0132ae98c744f94d6"]
  tags = {
    "Name" = "terraform-instance"
  }
}
