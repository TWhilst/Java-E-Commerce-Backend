/// Subnets
resource "aws_subnet" "Project1_public" {
  availability_zone       = "us-west-2a"
  vpc_id                  = aws_vpc.Project1.id
  map_public_ip_on_launch = true
  cidr_block              = "10.0.12.0/24"

  tags = {
    Name = "main1-public"
  }
}

resource "aws_subnet" "Project1_public_b" {
  availability_zone       = "us-west-2b"
  vpc_id                  = aws_vpc.Project1.id
  map_public_ip_on_launch = true
  cidr_block              = "10.0.14.0/24"

  tags = {
    Name = "main1-public-b"
  }
}