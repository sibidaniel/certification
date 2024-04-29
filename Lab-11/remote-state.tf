data "terraform_remote_state" "eip" {
  backend = "s3"
  config = {
    bucket = "terraformstatenew"
    key    = "test/terraform.tfstate"
    region = "ap-south-1"
  }
}