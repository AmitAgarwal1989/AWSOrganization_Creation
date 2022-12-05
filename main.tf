terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.73"
    }
  }
}

resource "aws_organizations_organization" "my_org" {
  aws_service_access_principals = [
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
    "controltower.amazonaws.com",
    "servicecatalog.amazonaws.com",
    "sso.amazonaws.com",
  ]
  enabled_policy_types = [
           "SERVICE_CONTROL_POLICY",
        ]
}

resource "aws_organizations_organizational_unit" "OU" {
  count = var.create_ou ? length(var.organization_unit) : 0
  name      = element(var.organization_unit,count.index)
  parent_id = aws_organizations_organization.my_org.roots[0].id
}

resource "aws_organizations_account" "ou_account" {
  # A friendly name for the member account
  count = var.create_ou ? length(var.ou_account_name) : 0
  name  = element(var.ou_account_name,count.index)
  email = element(var.ou_account_email,count.index)

  # Enables IAM users to access account billing information 
  # if they have the required permissions
  iam_user_access_to_billing = "ALLOW"


  parent_id = element(aws_organizations_organizational_unit.OU[*].id,count.index)
}