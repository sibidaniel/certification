provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "ec2_first" {
  ami = "ami-0451f2687182e0411"
  instance_type = "t2.micro"
  tags = {
    "Name": "EC2_free"
  }
}