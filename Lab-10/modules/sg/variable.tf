variable "sg_ingress_ports" {
  type        = list(number)
  default = [22, 80]

}

variable "sg_egress_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [65535]

}