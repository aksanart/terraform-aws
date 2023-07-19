resource "aws_key_pair" "terra-key" {
  key_name   = "terraform-key"
  public_key = file("ssh-key.pub")
}

resource "aws_instance" "terra-instance" {
  ami                    = var.AMI["AMAZON_LINUX"]
  instance_type          = var.INSTANCE_TYPE
  availability_zone      = var.REGION["ZONE"]
  key_name               = aws_key_pair.terra-key.key_name
  vpc_security_group_ids = var.SECURITY_GROUP
  tags = {
    "Name" = "terraform-output"
  }
  # upload file from local to remote machine
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  # execute something to remote machine
  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }
  connection {
    user        = var.LOGIN_USER
    private_key = file("ssh-key")
    host        = self.public_ip
  }
}

output "PublicIP" {
  value = aws_instance.terra-instance.public_ip
}
output "PrivateIP" {
  value = aws_instance.terra-instance.private_ip
}
