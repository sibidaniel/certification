resource "aws_security_group" "allow_tls" {
  name        = "terraform-fw-variable"
  description = "managed by terraform"

  tags = {
    Name = "terraform-fw-variable"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_app_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_ip
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_ip
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_ip
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}