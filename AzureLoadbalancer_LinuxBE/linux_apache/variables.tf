variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  default = "apachelbtf"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
}

variable "resourcegroup" {
  description = "Name of the resource Group"
}

variable "username" {
  default = "azuser"
}

variable "password" {
  description = "value of the password for the user"
}

variable "hostname" {
  description = "Virtual machine hostname. Used for local hostname, DNS, and storage-related names."
  default     = "vmtf"
}

variable "image_publisher" {
  description = "Name of the publisher of the image (az vm image list)"
  default     = "Canonical"
}

variable "image_offer" {
  description = "Name of the offer (az vm image list)"
  default     = "UbuntuServer"
}

variable "image_sku" {
  description = "Image SKU to apply (az vm image list)"
  default     = "18.04-LTS"
}

variable "image_version" {
  description = "Version of the image to apply (az vm image list)"
  default     = "latest"
}

variable "VMSize" {
  description = "size of the VM"
  default = "Standard_D2s_v3"  
}

variable "backendvmcount" {

    description = "number of backend VMs"
    type = number  
}

variable "vnet_name" {
  description = "Name of the vnet to create."
  type        = string
  default     = "acctvnet"
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  type        = string
  default     = "10.0.0.0/16"
}

variable "address_spaces" {
  description = "The list of the address spaces that is used by the virtual network."
  type        = list(string)
  default     = []
}

# If no values specified, this defaults to Azure DNS 
variable "dns_servers" {
  description = "The DNS servers to be used with vNet."
  type        = list(string)
  default     = []
}

variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "subnet_names" {
  description = "A list of public subnets inside the vNet."
  type        = list(string)
  default     = ["subnet1"]
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)

  default = {
    environment = "dev"
  }
}

variable "subnet_enforce_private_link_endpoint_network_policies" {
  description = "A map with key (string) `subnet name`, value (bool) `true` or `false` to indicate enable or disable network policies for the private link endpoint on the subnet. Default value is false."
  type        = map(bool)
  default     = {}
}

variable "subnet_service_endpoints" {
  description = "A map with key (string) `subnet name`, value (list(string)) to indicate enabled service endpoints on the subnet. Default value is []."
  type        = map(list(string))
  default     = {}
}