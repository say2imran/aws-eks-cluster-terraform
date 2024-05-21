#
# resource "aws_eks_access_entry" "example" {
#   cluster_name      = aws_eks_cluster.example.name
#   principal_arn     = aws_iam_role.example.arn
#   kubernetes_groups = ["group-1", "group-2"]
#   type              = "STANDARD"
# }
#
# resource "aws_eks_access_policy_association" "example" {
#   cluster_name  = aws_eks_cluster.example.name
#   policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"
#   principal_arn = aws_iam_user.example.arn
#
#   access_scope {
#     type       = "namespace"
#     namespaces = ["example-namespace"]
#   }
# }

###===============================
# resource "access_entry" "foo" {
#   cluster_name = "my_cluster"
#   iam_principal_arn = "IAM_PRINCIPAL_ARN"
# }
#
# resource "access_policy_association" "bar" {
#   cluster_name = "my_cluster"
#   iam_principal_arn = "IAM_PRINCIPAL_ARN"
#   iam_policy_arn = "arn:aws:eks::aws:cluster-access-policy/XXXX"
# }

