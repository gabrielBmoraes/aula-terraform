resource "aws_instance" "ec2-terraform-1-separado" {
  ami = "ami-0e86e20dae9224db8"
  instance_type = "t2.small"
  tags = {
    Name = "ec2-terraform-1-separado"
  }
}