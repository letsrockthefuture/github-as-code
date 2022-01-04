module "letsrockthefuture" {
  source  = "mineiros-io/organization/github"
  version = "~> 0.7.0"

  members = [
    "letsrockthefuturebot",
  ]
}
