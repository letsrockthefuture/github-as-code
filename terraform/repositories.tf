####################################################
### https://github.com/letsrockthefuture/.github ###
####################################################

module "github" {
  source  = "mineiros-io/repository/github"
  version = "~> 0.11.0"

  module_depends_on = [
    module.reviewers,
  ]

  name               = ".github"
  description        = "A description of the repository."
  homepage_url       = "https://github.com/letsrockthefuture/.github"
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

###############################################################
### https://github.com/letsrockthefuture/reusable-workflows ###
###############################################################

module "reusable_workflows" {
  source  = "mineiros-io/repository/github"
  version = "~> 0.11.0"

  module_depends_on = [
    module.reviewers,
  ]

  name               = "reusable-workflows"
  description        = "A collection of GitHub Actions workflow templates to centralize all of our workflows used in projects."
  homepage_url       = "https://github.com/letsrockthefuture/reusable-workflows"
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

##########################################################################
### https://github.com/letsrockthefuture/terraform-repository-template ###
##########################################################################

module "terraform_repository_template" {
  source  = "mineiros-io/repository/github"
  version = "~> 0.11.0"

  module_depends_on = [
    module.reviewers,
  ]

  name               = "terraform-repository-template"
  description        = "A example of Terraform repository scaffolding."
  homepage_url       = "https://github.com/letsrockthefuture/terraform-repository-template"
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

#################################################################
### https://github.com/letsrockthefuture/terraform-workspaces ###
#################################################################

module "terraform_workspaces" {
  source  = "mineiros-io/repository/github"
  version = "~> 0.11.0"

  module_depends_on = [
    module.reviewers,
  ]

  name               = "terraform-workspaces"
  description        = "A description of the repository."
  homepage_url       = "https://github.com/letsrockthefuture/terraform-workspaces"
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

######################################################
### https://github.com/letsrockthefuture/makefiles ###
######################################################

module "makefiles" {
  source  = "mineiros-io/repository/github"
  version = "~> 0.11.0"

  module_depends_on = [
    module.reviewers,
  ]

  name               = "makefiles"
  description        = "A collection of Makefiles to facilitate building Terraform, Golang projects, Dockerfiles, and more."
  homepage_url       = "https://github.com/letsrockthefuture/makefiles"
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

##########################################################
### https://github.com/letsrockthefuture/golang-worker ###
##########################################################

module "golang_worker" {
  source  = "mineiros-io/repository/github"
  version = "~> 0.11.0"

  module_depends_on = [
    module.reviewers,
  ]

  name               = "golang-worker"
  description        = "A description of the repository."
  homepage_url       = "https://github.com/letsrockthefuture/golang-worker"
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

#####################################################################
### https://github.com/letsrockthefuture/terraform-tfe-workspaces ###
#####################################################################

module "terraform_tfe_workspaces" {
  source  = "mineiros-io/repository/github"
  version = "~> 0.11.0"

  module_depends_on = [
    module.reviewers,
  ]

  name               = "terraform-tfe-workspaces"
  description        = "A description of the repository."
  homepage_url       = "https://github.com/letsrockthefuture/terraform-tfe-workspaces"
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
