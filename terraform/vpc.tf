/// VPC
resource "aws_vpc" "Project1" {
  cidr_block           = "10.0.0.0/20"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main1"
  }
}