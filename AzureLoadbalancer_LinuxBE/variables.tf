variable "prefix" {
    description = "name of resourcegroup"
    type = string
    default = "shaiknlbtf"
   
    }

variable "location" {
    description = "Locationvalue"
    default = "westeurope"
  }

variable "backendvmcount" {

    description = "number of backend VMs"
    type = number  
    }

variable "subId" {
    description = "subscription id"
    type = string
}

variable "client_Id" {
    description = "client id"
    type = string
}
 
 variable "client_secret" {
    description = "client secret"
    type = string
   
 }

variable "tenant_id" {
    description = "tenant id"
    type = string
   
 }
  