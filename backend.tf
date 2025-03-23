terraform {
  cloud {

    organization = "ssm-organization"

    workspaces {
      name = "ssm-workspace"
    }
  }
}