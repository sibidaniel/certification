provider "aws" {
  region = var.region
}

import {
  to = aws_security_group.sg-test
  id = "sg-01aa588baac70937c"
}
