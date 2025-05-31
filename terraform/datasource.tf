// This file contains the data sources used in the Terraform configuration.
# It retrieves the latest Amazon Linux 2023 AMI with a specific kernel version.
data "aws_ami" "server_ami" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.7.20250512.0-kernel-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}

data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners          = ["099720109477"]

  filter {
    name            = "name"
    values          = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

}