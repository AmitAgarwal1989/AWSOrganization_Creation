variable "create_ou" {
  description = "Controls if OU should be created "
  type        = bool
  default     = true
}
variable "organization_unit" {
  description = "A list of Organization Unit"
  type        = list(string)
  default     = ["core"]
}
variable "ou_account_name" {
    description = "Value for the OU Name"
    type = list(string)
    default = [ "security","network" ]
  
}
variable "ou_account_email" {
    description = "Value for the Email"
    type = list(string)
    default = [ "securit.srrealinvestment@gmail.com","netrowk.srrealinvestment@gmail.com" ]
  
}
variable "allow_access_to_billing" {
    description = "Whether you need to allow the Child Account to access the billing"
    type = string
    default = "ALLOW"
  
}