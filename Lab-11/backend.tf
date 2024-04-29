terraform {
  backend "s3" {
    bucket = "terraformstatenew"
    key    = "test/terraform.tfstate"
    region = "ap-south-1"
  }
}
