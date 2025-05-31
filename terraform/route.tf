///Route Table
resource "aws_route_table" "Project1_rt" {
  vpc_id                    = aws_vpc.Project1.id

  route {
    cidr_block              = "0.0.0.0/0"
    gateway_id              = aws_internet_gateway.Project1_igw.id
  }

  tags = {
    Name = "main1-rt"
  }
}

///Route Table Association
resource "aws_route_table_association" "Project1_rta" {
  subnet_id      = aws_subnet.Project1_public.id
  route_table_id = aws_route_table.Project1_rt.id
}

resource "aws_route_table_association" "Project1_rta_b" {
  subnet_id      = aws_subnet.Project1_public_b.id
  route_table_id = aws_route_table.Project1_rt.id
}