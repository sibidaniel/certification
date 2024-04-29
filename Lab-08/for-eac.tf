resource "aws_iam_user" "user" {
    for_each = toset(["user-01", "user-02", "user-03", "user-04"])
    name = each.key
}

variable "region_ec2" {
    type = map(string)
    default = {"us-east-1": "ami-test",
    "us-west-1": "ami-dev",
    "us-west-2": "ami-prod"
    }
  
}

resource "aws_instance" "ec2" {
  for_each = var.region_ec2
  ami = each.value
  instance_type = "t2.micro"
  key_name = each.key
}