
data "aws_instances" "ec2" {
    filter {
      name = "tag:Team"
      values = [ "Production" ]
    }
  
}

output "ec2_details" {
  value = data.aws_instances.ec2.ids
}
