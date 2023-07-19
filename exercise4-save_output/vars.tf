# standard variable
variable "INSTANCE_TYPE" {
  default = "t2.micro"
}
variable "SECURITY_GROUP" {
  type    = list(any)
  default = ["sg-0132ae98c744f94d6"]
}
variable "KEY_NAME" {
  default = "web01-tween-dev"
}
# standard variable
variable "LOGIN_USER" {
  default = "ec2-user"
}
# map variable
variable "AMI" {
  type = map(any)
  default = {
    AMAZON_LINUX = "ami-06ca3ca175f37dd66"
    UBUNTU       = "ami-053b0d53c279acc90"
    CENTOS       = "ami-002070d43b0a4f171"
  }
}
variable "REGION" {
  type = map(any)
  default = {
    CODE = "us-east-1"
    ZONE = "us-east-1a"
  }
}
