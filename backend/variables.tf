variable "hcp_token" {
  description = "value of the hcp token"
  type        = string
  sensitive   = true
}

variable "hcp_organization" {
  description = "value of your hcp organization"
  type        = string
}

variable "email_address" {
  description = "value of your email address"
  type        = string
}

variable "hcp_project" {
  description = "value of your hcp project"
  type        = string
}

variable "hcp_workspace" {
  description = "value of your hcp workspace"
  type        = string
}

variable "aws_access_key" {
  description = "value of aws access key"
  type        = string
}

variable "aws_secret_key" {
  description = "value of aws secret key"
  type        = string
  sensitive   = true
}

variable "aws_region" {
  description = "value of aws region"
  type        = string
}