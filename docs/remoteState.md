https://learn.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage?tabs=terraform
First execute create-remote-storage.tf file in remotestate folder byusing
```
cd remotestate
```
```
terraform init
terraform apply
```
then create access key using below command -to authenticate to azure - change values $RESOURCE_GROUP_NAME $STORAGE_ACCOUNT_NAME

also save accesskey as environment variable by doing this it wont be saved on disk
```
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)
export ARM_ACCESS_KEY=$ACCOUNT_KEY
```
now add backend block in main.tf
```
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstatec7ftv"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
  ```
```
cd ..
```
```
terraform init
terraform apply
```
