terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }

  
  backend "azurerm" {
    resource_group_name   = "basic"                       # Replace with your actual resource group name
    storage_account_name  = "mahesterraformtfstate"       # Replace with your actual storage account name
    container_name        = "tfstate"                    # Replace with your actual container name
    key                   = "terraform.dev.state"         # Name of the state file
  }
}

provider "azurerm" {
  features {}
  subscription_id = "01b8097f-ffba-4863-af6c-e136f04b3330"
}
