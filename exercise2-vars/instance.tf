resource "aws_instance" "intro" {
  ami                    = var.AMI["AMAZON_LINUX"]
  instance_type          = var.INSTANCE_TYPE
  availability_zone      = var.REGION["ZONE"]
  key_name               = var.KEY_NAME
  vpc_security_group_ids = var.SECURITY_GROUP
  tags = {
    "Name" = "terraform-var"
  }
}
