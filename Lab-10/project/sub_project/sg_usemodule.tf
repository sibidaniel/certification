module "sg" {
  source = "../../modules/sg"
  sg_egress_ports = [234]
}

resource "aws_instance" "ec2-modules" {
  ami = var.amiId
  instance_type = var.instanceType
  vpc_security_group_ids = [module.sg.sg_id]
}