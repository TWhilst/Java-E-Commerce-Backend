resource "aws_eks_cluster" "eks" {
    name     = "eks"
    role_arn = aws_iam_role.master.arn


    vpc_config {
        subnet_ids = [aws_subnet.Project1_public.id, aws_subnet.Project1_public_b.id]
    }

    depends_on = [
        aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
        aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
        aws_iam_role_policy_attachment.AmazonEKSVPCResourceController
    ]
}