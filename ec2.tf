locals {
  private_key_path = "/home/dev/Downloads/aws-demo777.pem"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# export AWS_ACCESS_KEY_ID="your key"
# export AWS_SECRET_ACCESS_KEY="your key"









# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
  shared_credentials_file = "/home/dev/Downloads/rootkey.csv"
  #profile                 = "default"
}







data "aws_ami" "ubuntu" {
  owners      = ["self"]
  most_recent = true

  filter {
    name   = "name"
    values = ["packer_AWS_servicetwo_*"]
  }
}

resource "aws_instance" "myec2" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.small"
  key_name        = "aws-demo777"
  security_groups = [aws_security_group.ec2.name]





  #resource "local_file" "default" {
   # content = templatefile("application.tmpl",
   #   {
    #    host_priv_ip = aws_instance.myec2.private_ip

    #  }
   # )
    #filename = "./application.yml"

  #}


















}

