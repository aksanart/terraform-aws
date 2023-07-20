resource "aws_key_pair" "terra-key" {
  key_name   = "terraform-key"
  public_key = file("ssh-key.pub")
}

# instance
resource "aws_instance" "terra-instance" {
  ami                    = var.AMI["AMAZON_LINUX"]
  subnet_id              = aws_subnet.terra-pub-1.id
  instance_type          = var.INSTANCE_TYPE
  key_name               = aws_key_pair.terra-key.key_name
  vpc_security_group_ids = [aws_security_group.terra-sg.id]
  tags = {
    "Name" = "terraform-multi_resource"
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

# volume ebs
resource "aws_ebs_volume" "terra-vol-4" {
  availability_zone = var.REGION["ZONEa"]
  size              = 3
  tags = {
    Name = "terra-vol"
  }
}
resource "aws_volume_attachment" "terra-vol-4-attach" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.terra-vol-4.id
  instance_id = aws_instance.terra-instance.id
}
