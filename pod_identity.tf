data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["pods.eks.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole",
      "sts:TagSession"
    ]
  }
}

# Refer for policy - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document

# data "aws_iam_policy_document" "pod_identity_rds_access" {
#   statement {
#     effect = "Allow"
#
#     principals {
#       type        = "Service"
#       identifiers = ["pods.eks.amazonaws.com"]
#     }
#
#     actions = [
#     "rds-db:connect"
#     ]
#
#     resources: [
#     #Refer ARN of Database from DB workspace
#    ]
#   }
# }

# data "aws_iam_policy_document" "pod_identity_s3_access" {
#   statement {
#     sid = "1"
#
#     actions = [
#       "s3:ListAllMyBuckets",
#       "s3:GetBucketLocation",
#     ]
#
#     resources = [
#       "arn:aws:s3:::*",
#     ]
#   }
#
#   statement {
#     actions = [
#       "s3:ListBucket",
#     ]
#
#     resources = [
#       "arn:aws:s3:::${var.s3_bucket_name}",
#     ]
#
#     condition {
#       test     = "StringLike"
#       variable = "s3:prefix"
#
#       values = [
#         "",
#         "home/",
#         "home/&{aws:username}/",
#       ]
#     }
#   }
#
#   statement {
#     actions = [
#       "s3:*",
#     ]
#
#     resources = [
#       "arn:aws:s3:::${var.s3_bucket_name}/home/&{aws:username}",
#       "arn:aws:s3:::${var.s3_bucket_name}/home/&{aws:username}/*",
#     ]
#   }
# }

# data "aws_iam_policy_document" "combined" {
#   source_policy_documents = [
#     data.aws_iam_policy_document.source_one.json,
#     data.aws_iam_policy_document.source_two.json
#   ]


resource "aws_iam_role" "eks_pod_identity_role" {
  name               = "eks-pod-identity-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

################################################################################
# Pod Identity Association
################################################################################

resource "aws_eks_pod_identity_association" "association" {
  cluster_name = var.cluster_name
  namespace = var.namespace
  service_account = var.service_account_name
  role_arn = aws_iam_role.eks_pod_identity_role.arn
  }
