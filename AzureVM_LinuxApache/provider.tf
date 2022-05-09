terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  /* commented out for now so that az cli credentials will be used for auth
    subscription_id = var.subId
    client_id = var.client_Id
    client_secret = var.client_secret
    tenant_id = var.tenant_id
 */
}
