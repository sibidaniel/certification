variable "elb_names" {
    type = list
    default = ["dev-loadbalancer", "uat-loadbalancer", "prod-balancer"] 
}

variable "check" {
  type = bool
  default = false
}