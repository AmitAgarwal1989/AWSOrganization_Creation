This repo will be used for creating the AWS Organization

Currently the Repo will create a OU named as Core and Attach the Accounts. To add the accounts in Core OU update variables.tf "ou_account_name" to provide the account Name and add the email id which will be associated to it in "ou_account_email" variable
Both the variable are in List format so add the values as comma separated