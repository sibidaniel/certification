resource "aws_security_group" "sg_heavy" {
  name = "sg_heavy"
  dynamic "ingress" {
    for_each = local.sg_ingress_ports
    content{
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = ingress.value #port.value
      to_port     = ingress.value #port.value      
    }
  }
  
  dynamic "egress" {
    for_each = local.sg_egress_ports
    content {
      from_port = 0
      to_port = egress.value
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
    }
  }
}

locals {
  sg_ingress_ports = [22, 80]
  sg_egress_ports = [65535]
}

output "sg_id" {
  value = aws_security_group.sg_heavy.id
}