resource "aws_security_group" "sg_heavy" {
  name = "sg_heavy"
  dynamic "ingress" {
    for_each = var.sg_ports
    #iterator = "port" #here "port" becomes iterator variable instead of "ingress" label
    content {
      from_port = ingress.value #port.value
      to_port = ingress.value #port.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    
  }
}

variable "sg_ports" {
    type = list(number)
    description = "list of ingress ports"
    default = [ 8200, 8201, 8300, 9200, 9500 ]
  
}