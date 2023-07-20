resource "aws_security_group" "terra-sg" {
  vpc_id      = aws_vpc.terra-vpc.id
  name        = "terra-sg"
  description = "security group created by terraform"
  // outbond traffic
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    # allow from anywhere
    cidr_blocks = ["0.0.0.0/0"]
  }
  // inbond traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ALLOW_IP
  }
  tags = {
    "Name" = "terra-sg"
  }
}
