/// Security Groups
resource "aws_security_group" "Project1_sg_ssh" {
  vpc_id      = aws_vpc.Project1.id
  name        = "main1-sg-ssh"
  description = "Allow SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp" # all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "main1-sg-ssh"
  }
  
}