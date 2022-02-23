# ----------------------------------------------------------------------------------------------------------------------
# CREATE A TEAM AND TWO REPOSITORIES
#
# We create a team and two repositories. The team will have pull permissions for one repository and push permissions
# for the other. We also add lists of members and maintainers to the team.
# ----------------------------------------------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES:
# ----------------------------------------------------------------------------------------------------------------------
# You can provide your credentials via the
#   AWS_ACCESS_KEY_ID and
#   AWS_SECRET_ACCESS_KEY, environment variables,
# representing your AWS Access Key and AWS Secret Key, respectively.
# Note that setting your AWS credentials using either these (or legacy)
# environment variables will override the use of
#   AWS_SHARED_CREDENTIALS_FILE and
#   AWS_PROFILE.
# The
#   AWS_DEFAULT_REGION and
#   AWS_SESSION_TOKEN environment variables are also used, if applicable.
# ----------------------------------------------------------------------------------------------------------------------

module "owners" {
  source  = "mineiros-io/team/github"
  version = "~> 0.8.0"

  name = "owners"
  # description = "A team of users that are mandatory for reviewing pull requests."
  privacy = "closed"

  members = [
    "danielvincenzi",
  ]
}

module "security" {
  source  = "mineiros-io/team/github"
  version = "~> 0.8.0"

  name = "security"
  # description = "A team of users that are mandatory for reviewing pull requests."
  privacy = "closed"

  members = [
    "danielvincenzi",
  ]
}

module "reviewers" {
  source  = "mineiros-io/team/github"
  version = "~> 0.8.0"

  name        = "reviewers"
  description = "A team of users that are mandatory for reviewing pull requests."
  privacy     = "closed"

  members = [
    "danielvincenzi",
  ]
}

module "developers" {
  source  = "mineiros-io/team/github"
  version = "~> 0.8.0"

  name        = "developers"
  description = "A team of users that will pushes on features branch."
  privacy     = "closed"

  members = [
    "danielvincenzi",
  ]
}
