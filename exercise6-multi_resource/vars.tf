# standard variable
variable "INSTANCE_TYPE" {
  default = "t2.micro"
}
variable "KEY_NAME" {
  default = "web01-tween-dev"
}
variable "LOGIN_USER" {
  default = "ec2-user"
}
# array variable
variable "SECURITY_GROUP" {
  type    = list(any)
  default = ["sg-0132ae98c744f94d6"]
}
variable "ALLOW_IP" {
  type    = list(string)
  default = ["xxxx/xx"]
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
    CODE  = "us-east-1"
    ZONEa = "us-east-1a"
    ZONEb = "us-east-1b"
    ZONEc = "us-east-1c"
    ZONEd = "us-east-1d"
    ZONEe = "us-east-1e"
  }
}
