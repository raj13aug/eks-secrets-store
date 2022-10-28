data "aws_iam_policy_document" "document" {
  statement {
    actions = [
      "secretsmanager:*",
    ]
    resources = [
      "arn:aws:secretsmanager:us-east-1:932999788441:secret:*",
    ]
  }
}

resource "aws_iam_policy" "policy" {
  name        = "simple-policy-for-testing-irsa"
  policy      = data.aws_iam_policy_document.document.json
  description = "Policy for testing irsa"
}

module "irsa" {
  source           = "github.com/ministryofjustice/cloud-platform-terraform-irsa?ref=1.0.5"
  eks_cluster_name = var.eks_cluster_name
  namespace        = "default"
  service_account  = "csi-sa"
  role_policy_arns = [aws_iam_policy.policy.arn]
}

