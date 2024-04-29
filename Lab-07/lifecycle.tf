resource "aws_instance" "ec2" {
  ami = "ami-test"
  instance_type = "t2.micro"
  tags = {
    "name": "ec2-test"
  }
  lifecycle {
    ignore_changes = [ tags ]
    create_before_destroy = true
    prevent_destroy = false
    
  }
}