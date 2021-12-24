# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A PUBLIC REPOSITORY WITH AN ATTACHED TEAM
#   - create a public repository
#   - create a team and invite members
#   - add the team to the repository and grant admin permissions
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

module "github" {
  source  = "mineiros-io/repository/github"
  version = "~> 0.11.0"

  module_depends_on = [
    module.reviewers,
  ]

  name        = ".github"
  description = "A description of the repository."
  # homepage_url       = "https://github.com/mineiros-io"
  visibility         = "public"
  has_issues         = true
  has_projects       = false
  has_wiki           = false
  allow_merge_commit = true
  allow_rebase_merge = false
  allow_squash_merge = false
  has_downloads      = false
  auto_init          = true
  gitignore_template = "Terraform"
  license_template   = "apache-2.0"

  topics = [
    "github",
    "github-actions",
  ]

  maintain_team_ids = [
    module.reviewers.id,
  ]

  push_team_ids = [
    module.developers.id,
  ]

  # webhooks = [
  #   {
  #     active = true

  #     events = [
  #       "issues",
  #     ]

  #     url          = "https://example.com/events"
  #     content_type = "application/json"
  #     insecure_ssl = false
  #     secret       = "sososecret"
  #   },
  # ]

  # admin_collaborators = [
  #   "danielvincenzi",
  # ]

  # branch_protections_v3 = [
  #   {
  #     branch                 = "main"
  #     enforce_admins         = true
  #     require_signed_commits = true

  #     required_status_checks = {
  #       strict = true

  #       # contexts = [
  #       #   "ci/travis"
  #       # ]
  #     }

  #     required_pull_request_reviews = {
  #       dismiss_stale_reviews = true

  #       # dismissal_teams = [
  #       #   github_team.team.slug,
  #       # ]

  #       require_code_owner_reviews      = true
  #       required_approving_review_count = 1
  #     }

  #     # restrictions = {

  #     #   teams = [
  #     #     github_team.team.slug,
  #     #   ]
  #     # }
  #   },
  # ]
}

resource "github_repository_environment" "github_production" {
  environment = "production"
  repository  = ".github"
  reviewers {
    teams = [
      module.reviewers.id,
    ]
  }
  deployment_branch_policy {
    protected_branches     = true
    custom_branch_policies = false
  }

  depends_on = [
    module.github,
  ]
}

module "reusable_workflows" {
  source  = "mineiros-io/repository/github"
  version = "~> 0.11.0"

  module_depends_on = [
    module.reviewers,
  ]

  name        = "reusable-workflows"
  description = "A description of the repository."
  # homepage_url       = "https://github.com/mineiros-io"
  visibility         = "public"
  has_issues         = true
  has_projects       = false
  has_wiki           = false
  allow_merge_commit = true
  allow_rebase_merge = false
  allow_squash_merge = false
  has_downloads      = false
  auto_init          = true
  gitignore_template = "Terraform"
  license_template   = "apache-2.0"

  topics = [
    "github-actions",
    "github-workflows",
    "reusable-workflows",
  ]

  maintain_team_ids = [
    module.reviewers.id,
  ]

  push_team_ids = [
    module.developers.id,
  ]

  # webhooks = [
  #   {
  #     active = true

  #     events = [
  #       "issues",
  #     ]

  #     url          = "https://example.com/events"
  #     content_type = "application/json"
  #     insecure_ssl = false
  #     secret       = "sososecret"
  #   },
  # ]

  # admin_collaborators = [
  #   "danielvincenzi",
  # ]

  # branch_protections_v3 = [
  #   {
  #     branch                 = "main"
  #     enforce_admins         = true
  #     require_signed_commits = true

  #     required_status_checks = {
  #       strict = true

  #       # contexts = [
  #       #   "ci/travis"
  #       # ]
  #     }

  #     required_pull_request_reviews = {
  #       dismiss_stale_reviews = true

  #       # dismissal_teams = [
  #       #   github_team.team.slug,
  #       # ]

  #       require_code_owner_reviews      = true
  #       required_approving_review_count = 1
  #     }

  #     # restrictions = {

  #     #   teams = [
  #     #     github_team.team.slug,
  #     #   ]
  #     # }
  #   },
  # ]
}

resource "github_repository_environment" "reusable_workflows_production" {
  environment = "production"
  repository  = "reusable-workflows"
  reviewers {
    teams = [
      module.reviewers.id,
    ]
  }
  deployment_branch_policy {
    protected_branches     = true
    custom_branch_policies = false
  }

  depends_on = [
    module.reusable_workflows,
  ]
}

module "terraform_repository_template" {
  source  = "mineiros-io/repository/github"
  version = "~> 0.11.0"

  module_depends_on = [
    module.reviewers,
  ]

  name        = "terraform-repository-template"
  description = "A example of Terraform repository scaffolding."
  # homepage_url       = "https://github.com/mineiros-io"
  visibility         = "public"
  has_issues         = true
  has_projects       = false
  has_wiki           = false
  allow_merge_commit = true
  allow_rebase_merge = false
  allow_squash_merge = false
  has_downloads      = false
  auto_init          = true
  gitignore_template = "Terraform"
  license_template   = "apache-2.0"

  is_template = true

  topics = [
    "terraform-repository-template",
    "terraform",
  ]

  maintain_team_ids = [
    module.reviewers.id,
  ]

  push_team_ids = [
    module.developers.id,
  ]

  # webhooks = [
  #   {
  #     active = true

  #     events = [
  #       "issues",
  #     ]

  #     url          = "https://example.com/events"
  #     content_type = "application/json"
  #     insecure_ssl = false
  #     secret       = "sososecret"
  #   },
  # ]

  # admin_collaborators = [
  #   "danielvincenzi",
  # ]

  # branch_protections_v3 = [
  #   {
  #     branch                 = "main"
  #     enforce_admins         = true
  #     require_signed_commits = true

  #     required_status_checks = {
  #       strict = true

  #       # contexts = [
  #       #   "ci/travis"
  #       # ]
  #     }

  #     required_pull_request_reviews = {
  #       dismiss_stale_reviews = true

  #       # dismissal_teams = [
  #       #   github_team.team.slug,
  #       # ]

  #       require_code_owner_reviews      = true
  #       required_approving_review_count = 1
  #     }

  #     # restrictions = {

  #     #   teams = [
  #     #     github_team.team.slug,
  #     #   ]
  #     # }
  #   },
  # ]
}

resource "github_repository_environment" "terraform_repository_template_production" {
  environment = "production"
  repository  = "terraform-repository-template"
  reviewers {
    teams = [
      module.reviewers.id,
    ]
  }
  deployment_branch_policy {
    protected_branches     = true
    custom_branch_policies = false
  }

  depends_on = [
    module.terraform_repository_template,
  ]
}

module "terraform_workspaces" {
  source  = "mineiros-io/repository/github"
  version = "~> 0.11.0"

  module_depends_on = [
    module.reviewers,
  ]

  name        = "terraform-workspaces"
  description = "A description of the repository."
  # homepage_url       = "https://github.com/mineiros-io"
  visibility         = "public"
  has_issues         = true
  has_projects       = false
  has_wiki           = false
  allow_merge_commit = true
  allow_rebase_merge = false
  allow_squash_merge = false
  has_downloads      = false
  auto_init          = true
  gitignore_template = "Terraform"
  license_template   = "apache-2.0"

  topics = [
    "terraform-workspaces",
    "terraform",
  ]

  maintain_team_ids = [
    module.reviewers.id,
  ]

  push_team_ids = [
    module.developers.id,
  ]

  # webhooks = [
  #   {
  #     active = true

  #     events = [
  #       "issues",
  #     ]

  #     url          = "https://example.com/events"
  #     content_type = "application/json"
  #     insecure_ssl = false
  #     secret       = "sososecret"
  #   },
  # ]

  # admin_collaborators = [
  #   "danielvincenzi",
  # ]

  # branch_protections_v3 = [
  #   {
  #     branch                 = "main"
  #     enforce_admins         = true
  #     require_signed_commits = true

  #     required_status_checks = {
  #       strict = true

  #       # contexts = [
  #       #   "ci/travis"
  #       # ]
  #     }

  #     required_pull_request_reviews = {
  #       dismiss_stale_reviews = true

  #       # dismissal_teams = [
  #       #   github_team.team.slug,
  #       # ]

  #       require_code_owner_reviews      = true
  #       required_approving_review_count = 1
  #     }

  #     # restrictions = {

  #     #   teams = [
  #     #     github_team.team.slug,
  #     #   ]
  #     # }
  #   },
  # ]
}

resource "github_repository_environment" "terraform_workspaces_production" {
  environment = "production"
  repository  = "terraform-workspaces"
  reviewers {
    teams = [
      module.reviewers.id,
    ]
  }
  deployment_branch_policy {
    protected_branches     = true
    custom_branch_policies = false
  }

  depends_on = [
    module.terraform_workspaces,
  ]
}

module "makefiles" {
  source  = "mineiros-io/repository/github"
  version = "~> 0.11.0"

  module_depends_on = [
    module.reviewers,
  ]

  name        = "makefiles"
  description = "A collection of Makefiles to facilitate building Terraform, Golang projects, Dockerfiles, and more."
  # homepage_url       = "https://github.com/mineiros-io"
  visibility         = "public"
  has_issues         = true
  has_projects       = false
  has_wiki           = false
  allow_merge_commit = true
  allow_rebase_merge = false
  allow_squash_merge = false
  has_downloads      = false
  auto_init          = true
  # gitignore_template = "Terraform"
  license_template = "apache-2.0"

  topics = [
    "makefiles",
  ]

  maintain_team_ids = [
    module.reviewers.id,
  ]

  push_team_ids = [
    module.developers.id,
  ]

  # webhooks = [
  #   {
  #     active = true

  #     events = [
  #       "issues",
  #     ]

  #     url          = "https://example.com/events"
  #     content_type = "application/json"
  #     insecure_ssl = false
  #     secret       = "sososecret"
  #   },
  # ]

  # admin_collaborators = [
  #   "danielvincenzi",
  # ]

  # branch_protections_v3 = [
  #   {
  #     branch                 = "main"
  #     enforce_admins         = true
  #     require_signed_commits = true

  #     required_status_checks = {
  #       strict = true

  #       # contexts = [
  #       #   "ci/travis"
  #       # ]
  #     }

  #     required_pull_request_reviews = {
  #       dismiss_stale_reviews = true

  #       # dismissal_teams = [
  #       #   github_team.team.slug,
  #       # ]

  #       require_code_owner_reviews      = true
  #       required_approving_review_count = 1
  #     }

  #     # restrictions = {

  #     #   teams = [
  #     #     github_team.team.slug,
  #     #   ]
  #     # }
  #   },
  # ]
}

resource "github_repository_environment" "makefiles_production" {
  environment = "production"
  repository  = "makefiles"
  reviewers {
    teams = [
      module.reviewers.id,
    ]
  }
  deployment_branch_policy {
    protected_branches     = true
    custom_branch_policies = false
  }

  depends_on = [
    module.makefiles,
  ]
}

module "golang_worker" {
  source  = "mineiros-io/repository/github"
  version = "~> 0.11.0"

  module_depends_on = [
    module.reviewers,
  ]

  name        = "golang-worker"
  description = "A description of the repository."
  # homepage_url       = "https://github.com/mineiros-io"
  visibility         = "public"
  has_issues         = true
  has_projects       = false
  has_wiki           = false
  allow_merge_commit = true
  allow_rebase_merge = false
  allow_squash_merge = false
  has_downloads      = false
  auto_init          = true
  gitignore_template = "Terraform"
  license_template   = "apache-2.0"

  topics = [
    "golang-worker",
    "terraform",
  ]

  maintain_team_ids = [
    module.reviewers.id,
  ]

  push_team_ids = [
    module.developers.id,
  ]

  # webhooks = [
  #   {
  #     active = true

  #     events = [
  #       "issues",
  #     ]

  #     url          = "https://example.com/events"
  #     content_type = "application/json"
  #     insecure_ssl = false
  #     secret       = "sososecret"
  #   },
  # ]

  # admin_collaborators = [
  #   "danielvincenzi",
  # ]

  # branch_protections_v3 = [
  #   {
  #     branch                 = "main"
  #     enforce_admins         = true
  #     require_signed_commits = true

  #     required_status_checks = {
  #       strict = true

  #       # contexts = [
  #       #   "ci/travis"
  #       # ]
  #     }

  #     required_pull_request_reviews = {
  #       dismiss_stale_reviews = true

  #       # dismissal_teams = [
  #       #   github_team.team.slug,
  #       # ]

  #       require_code_owner_reviews      = true
  #       required_approving_review_count = 1
  #     }

  #     # restrictions = {

  #     #   teams = [
  #     #     github_team.team.slug,
  #     #   ]
  #     # }
  #   },
  # ]
}

# resource "github_repository_environment" "golang_worker_development" {
#   environment = "development"
#   repository  = "golang-worker"
#   reviewers {
#     teams = [
#       module.reviewers.id,
#     ]
#   }
#   deployment_branch_policy {
#     protected_branches     = true
#     custom_branch_policies = false
#   }

#   depends_on = [
#     module.golang_worker,
#   ]
# }

resource "github_repository_environment" "golang_worker_production" {
  environment = "production"
  repository  = "golang-worker"
  reviewers {
    teams = [
      module.reviewers.id,
    ]
  }
  deployment_branch_policy {
    protected_branches     = true
    custom_branch_policies = false
  }

  depends_on = [
    module.golang_worker.id,
  ]
}

module "terraform_tfe_workspaces" {
  source  = "mineiros-io/repository/github"
  version = "~> 0.11.0"

  module_depends_on = [
    module.reviewers,
  ]

  name        = "terraform-tfe-workspaces"
  description = "A description of the repository."
  # homepage_url       = "https://github.com/mineiros-io"
  visibility         = "public"
  has_issues         = true
  has_projects       = false
  has_wiki           = false
  allow_merge_commit = true
  allow_rebase_merge = false
  allow_squash_merge = false
  has_downloads      = false
  auto_init          = true
  gitignore_template = "Terraform"
  license_template   = "apache-2.0"

  topics = [
    "terraform-tfe-workspaces",
    "terraform",
  ]

  maintain_team_ids = [
    module.reviewers.id,
  ]

  push_team_ids = [
    module.developers.id,
  ]

  # webhooks = [
  #   {
  #     active = true

  #     events = [
  #       "issues",
  #     ]

  #     url          = "https://example.com/events"
  #     content_type = "application/json"
  #     insecure_ssl = false
  #     secret       = "sososecret"
  #   },
  # ]

  # admin_collaborators = [
  #   "danielvincenzi",
  # ]

  # branch_protections_v3 = [
  #   {
  #     branch                 = "main"
  #     enforce_admins         = true
  #     require_signed_commits = true

  #     required_status_checks = {
  #       strict = true

  #       # contexts = [
  #       #   "ci/travis"
  #       # ]
  #     }

  #     required_pull_request_reviews = {
  #       dismiss_stale_reviews = true

  #       # dismissal_teams = [
  #       #   github_team.team.slug,
  #       # ]

  #       require_code_owner_reviews      = true
  #       required_approving_review_count = 1
  #     }

  #     # restrictions = {

  #     #   teams = [
  #     #     github_team.team.slug,
  #     #   ]
  #     # }
  #   },
  # ]
}

resource "github_repository_environment" "terraform_tfe_workspaces_production" {
  environment = "production"
  repository  = "terraform-tfe-workspaces"
  reviewers {
    teams = [
      module.reviewers.id,
    ]
  }
  deployment_branch_policy {
    protected_branches     = true
    custom_branch_policies = false
  }

  depends_on = [
    module.terraform_tfe_workspaces,
  ]
}

# ---------------------------------------------------------------------------------------------------------------------
# TEAM
# ---------------------------------------------------------------------------------------------------------------------
# resource "github_team" "team" {
#   name        = "My Team"
#   description = "The best Team out there."
#   privacy     = "secret"
# }

# ---------------------------------------------------------------------------------------------------------------------
# TEAM MEMBERSHIP
# We are adding a member to this team: "terraform-test-user-2".
# This existing users and already member of the GitHub Organization "terraform-test" that
# is an Organization managed by Mineiros.io to run integration tests with Terratest.
# ---------------------------------------------------------------------------------------------------------------------

# resource "github_team_membership" "team_membership" {
#   team_id  = github_team.team.id
#   username = "terraform-test-user-2"
#   role     = "member"
# }

# ------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES:
# ------------------------------------------------------------------------------
# You can provide your credentials via the
#   GITHUB_TOKEN and
#   GITHUB_OWNER, environment variables,
# representing your Access Token and the organization, respectively.
# ------------------------------------------------------------------------------
