terraform {
  required_version = "~> 1.0"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }

  cloud {
    organization = "letsrockthefuture"

    workspaces {
      name = "github-as-code-test"
    }
  }
}

provider "github" {}
