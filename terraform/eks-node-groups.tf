resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "eks-node-group"
  node_role_arn   = aws_iam_role.worker.arn
  subnet_ids      = [aws_subnet.Project1_public.id, aws_subnet.Project1_public_b.id]
  capacity_type = "ON_DEMAND"
  disk_size = 20
  instance_types = ["t2.small"]

  remote_access {
    ec2_ssh_key = aws_key_pair.Project1_key.key_name
    source_security_group_ids = [aws_security_group.Project1_sg_ssh.id]
  }

  labels = tomap({ env = "dev" })

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  tags = {
    Name = "eks-node-group"
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly
  ]
}

resource "aws_instance" "k8s_server" {
  ami           = data.aws_ami.server_ami.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.Project1_key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.Project1_sg_ssh.id]
  subnet_id              = aws_subnet.Project1_public.id

  tags = {
    Name = "k8s-server"
  }
}