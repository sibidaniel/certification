module "ec2_config" {
  source = "../Lab-10/modules/ec2"
}

output "ec2_ip" {
 value = ec2_config.public_ip 
}