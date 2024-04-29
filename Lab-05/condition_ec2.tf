# resource "aws_instance" "ec2_dev" {
#     ami = "ami-001843b876406202a"
#     instance_type = "t2.micro"
#     count = var.check == true ? 1 : 0  
# }

# resource "aws_instance" "ec2_prod" {
#     ami = "ami-001843b876406202a"
#     instance_type = "t2.micro"
#     count = var.check == true ? 0 : 1
# }
