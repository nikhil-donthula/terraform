https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build

Login to azure in cli -Your browser will open and prompt you to enter your Azure login credentials
```
az login
```
Find the id column for the subscription account you want to use.
Once you have chosen the account subscription ID, set the account with the Azure CLI.
```
az account set --subscription "35akss-subscription-id"
```
Create a Service principle
```
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>"
```
outpt:
```
Creating 'Contributor' role assignment under scope '/subscriptions/35akss-subscription-id'
The output includes credentials that you must protect. Be sure that you do not include these credentials in your code or check the credentials into your source control. For more information, see https://aka.ms/azadsp-cli
{
  "appId": "xxxxxx-xxx-xxxx-xxxx-xxxxxxxxxx",
  "displayName": "azure-cli-2022-xxxx",
  "password": "xxxxxx~xxxxxx~xxxxx",
  "tenant": "xxxxx-xxxx-xxxxx-xxxx-xxxxx"
}
```
Set your environment variables
```
 export ARM_CLIENT_ID="<APPID_VALUE>"
 export ARM_CLIENT_SECRET="<PASSWORD_VALUE>"
 export ARM_SUBSCRIPTION_ID="<SUBSCRIPTION_ID>"
 export ARM_TENANT_ID="<TENANT_VALUE>"
 ```
 to see all the env varaibles
```
printenv
 ```
```
printenv | grep ARM
```
 Initialize your Terraform configuration
 ```
 cd development
 ```
```
terraform init
```
Format and validate the configuration
```
terraform fmt
```
```
terraform validate
```
Plan your config
```
terraform plan
```
Apply your Terraform Configuration
```
terraform apply
```
apply without authentication- typing yes
```
terraform apply -auto-approve
```
Error:
Planning failed. Terraform encountered an error while generating this plan.
Add skip_provider_registration = "true" in provider
```
provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}
```
Inspect the current state using 
```
terraform show.
```
you can see a list of the resources you created with Terraform
```
terraform state list
```
Destroy - terminates resources managed by your Terraform project
```
terraform destroy
```
> Pass variables like names from variables.tf file
to pass custom variable values from cmnd line
```
terraform apply -var "resource_group_name=bottleNewResourceGroupName"
```
> include all the required output values in output.tf file
 command is used to extract the value of an output variable defined in your Terraform configuration and stored in the state file
 > things included in output.tf file will be displayed when apply command is executed
 Explicitly we can run :
```
terraform output
```