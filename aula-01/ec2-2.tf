resource "aws_instance" "ec2-terraform-2-separado" {
  ami = "ami-0e86e20dae9224db8"
  instance_type = "t2.small"
  tags = {
    Name = "ec2-terraform-2-separado"
  }
  ebs_block_device {
    device_name =  "/dev/sda1"
    volume_size =  "40"
    volume_type = "gp3"
  }
}