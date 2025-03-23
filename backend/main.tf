resource "tfe_organization" "my-hcp-organization" {
  name  = var.hcp_organization
  email = var.email_address
}

resource "tfe_project" "my-hcp-project" {
  organization = tfe_organization.my-hcp-organization.id
  name         = var.hcp_project
}

resource "tfe_workspace" "my-hcp-workspace" {
  name         = var.hcp_workspace
  organization = tfe_organization.my-hcp-organization.id
  project_id   = tfe_project.my-hcp-project.id
}

resource "tfe_variable" "aws-access-key-env-var" {
  key          = "AWS_ACCESS_KEY_ID"
  value        = var.aws_access_key
  category     = "env"
  description  = "AWS Access Key"
  workspace_id = tfe_workspace.my-hcp-workspace.id
  sensitive    = false
}

resource "tfe_variable" "aws-secret-key-env-var" {
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = var.aws_secret_key
  category     = "env"
  description  = "AWS Secret Key"
  workspace_id = tfe_workspace.my-hcp-workspace.id
  sensitive    = true
}

resource "tfe_variable" "aws-region-env-var" {
  key          = "AWS_REGION"
  value        = var.aws_region
  category     = "env"
  description  = "AWS Region"
  workspace_id = tfe_workspace.my-hcp-workspace.id
  sensitive    = false
}