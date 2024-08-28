terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2-iac-aula2" {
  ami= "ami-0e86e20dae9224db8"
  instance_type = "t2.small"
  tags = {
    Name = "ec2-iac-aula2-01"
  }

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 30
    volume_type = "gp3"
  }

  security_groups =  [aws_security_group.sg_aula_iac.name, "default"]

  key_name = "aua_iac"

  subnet_id = "subnet-0823e4ed0fda0922a" // id de vpc existente
}

variable "porta_https" {
  description = "porta https"
  default = 80
  type = number
}

resource "aws_security_group" "sg_aula_iac" {
  name = "sg_aula_iac"

  ingress {
    from_port = var.porta_https
    to_port = var.porta_https
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_subnet" "minha_subrede" {
  vpc_id = "id da vpc"
  cidr_block = "10.10.10.0/24"
}