data "aws_ami" "ami_detail" {
  most_recent      = true
  owners           = ["amazon"]
  name_regex = "^amzn2[a-zA-Z0-9-_]+"

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "ami" {
  value = data.aws_ami.ami_detail.id
}