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
      name = "api-development-us-east-1"
    }
  }
}

provider "github" {
  # token = var.github_token
}
