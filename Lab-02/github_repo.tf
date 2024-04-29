terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "6.2.1"
    }
  }
}

provider "github" {
 # token = "test"
}

resource "github_repository" "terraform_repo" {
  name        = "terraform_repo"
  description = "My awesome web page"

  visibility = "public"
}
