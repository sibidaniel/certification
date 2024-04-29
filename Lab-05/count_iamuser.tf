resource "aws_iam_user" "lb-user" {
  name = var.elb_names[count.index]
  count = 3
  path = "/system/"
}