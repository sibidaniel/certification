resource "aws_instance" "ec2-modules" {
  ami = var.amiId
  instance_type = var.instanceType
}