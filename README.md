This repo will be used for creating the AWS Organization

tfstate file will be saved in S3 Bucket network-prod-e1-terraformstate/aws_org

Currently the Repo will create a OU named as Core and Attach the Accounts. To add the accounts in Core OU update variables.tf "ou_account_name" to provide the account Name and add the email id which will be associated to it in "ou_account_email" variable
Both the variable are in List format so add the values as comma separated

The repo is also being used for creating the SCP on AWS Org Account

Inorder to destroy the resources Created kindly update buildspecs.yml and uncomment Terraform Destroy line. Additionally Comment the Terraform Apply line
