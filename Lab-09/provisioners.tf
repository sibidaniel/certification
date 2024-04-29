data "aws_ami" "ami_detail" {
  most_recent = true
  owners      = ["amazon"]
  name_regex  = "al2023-ami-2023.4.20240416.0-kernel-6.1-x86_64"

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "terraform-key" {
  key_name   = "terraform"
  public_key = file("./terraform.pub")
}

resource "aws_security_group" "sg_heavy" {
  name = "sg_heavy"
  dynamic "ingress" {
    for_each = var.sg_ingress_ports
    content{
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = ingress.value #port.value
      to_port     = ingress.value #port.value      
    }
  }
  
  dynamic "egress" {
    for_each = var.sg_egress_ports
    content {
      from_port = 0
      to_port = egress.value
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
    }
  }
}

variable "sg_ingress_ports" {
  type        = list(number)
  default = [22, 80]

}

variable "sg_egress_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [65535]

}

resource "aws_instance" "ec2_config" {
  ami                    = data.aws_ami.ami_detail.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.terraform-key.key_name
  vpc_security_group_ids = [aws_security_group.sg_heavy.id]
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install nginx -y",
      "sudo systemctl start nginx"
    ]
    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = file("./terraform")
    }
    on_failure = continue
  }
  provisioner "local-exec" {
    when    = destroy
    command = "echo 'Oh nooooo!! getting destroyed now'"
  }
}
