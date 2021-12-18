# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A PUBLIC REPOSITORY WITH AN ATTACHED TEAM
#   - create a public repository
#   - create a team and invite members
#   - add the team to the repository and grant admin permissions
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
  license_template   = "mit"

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

  webhooks = [
    {
      active = true

      events = [
        "issues",
      ]

      url          = "https://example.com/events"
      content_type = "application/json"
      insecure_ssl = false
      secret       = "sososecret"
    },
  ]

  # admin_collaborators = [
  #   "danielvincenzi",
  # ]

  branch_protections_v3 = [
    {
      branch                 = "main"
      enforce_admins         = true
      require_signed_commits = true

      required_status_checks = {
        strict = true

        # contexts = [
        #   "ci/travis"
        # ]
      }

      required_pull_request_reviews = {
        dismiss_stale_reviews = true

        # dismissal_teams = [
        #   github_team.team.slug,
        # ]

        require_code_owner_reviews      = true
        required_approving_review_count = 1
      }

      # restrictions = {

      #   teams = [
      #     github_team.team.slug,
      #   ]
      # }
    },
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
