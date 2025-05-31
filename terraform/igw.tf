/// Internet Gateway
resource "aws_internet_gateway" "Project1_igw" {
  vpc_id = aws_vpc.Project1.id

  tags = {
    Name = "main1-igw"
  }
}