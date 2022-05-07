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
    subscription_id = var.subId
    client_id = var.client_Id
    client_secret = var.client_secret
    tenant_id = var.tenant_id
}


resource "azurerm_public_ip" "main" {
  name                = "PublicIPForLB"
  location            = var.location
  resource_group_name = module.vm.resourcegroup[0]
  allocation_method   = "Static"
  sku = "Standard"
}

resource "azurerm_lb" "main" {
  name                = "TestLoadBalancer"
  location            = var.location
  resource_group_name = module.vm.resourcegroup[0]
  sku = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.main.id
  }
}

resource "azurerm_lb_backend_address_pool" "main" {
  loadbalancer_id = azurerm_lb.main.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_rule" "main" {
  
  loadbalancer_id                = azurerm_lb.main.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  probe_id = azurerm_lb_probe.main.id
  backend_address_pool_ids = ["${azurerm_lb_backend_address_pool.main.id}"]
  depends_on = [
    azurerm_lb_backend_address_pool.main
  ]
}

resource "azurerm_lb_probe" "main" {
  
  loadbalancer_id     = azurerm_lb.main.id
  name                = "http-running-probe"
  port                = 80
}

module "vm" {
    source = "github.com/Shaikngit/Terraformlabs//AzureVM_LinuxApache"
    prefix = var.prefix
    location = var.location
    resourcegroup = var.resourcegroup
    username = var.username
    password = var.password
    hostname = var.hostname
    image_publisher = var.image_publisher
    image_offer = var.image_offer
    image_sku = var.image_sku
    image_version = var.image_version
    VMSize = var.VMSize
    backendvmcount = var.backendvmcount
    vnet_name = var.vnet_name
    address_space = var.address_space
    address_spaces = var.address_spaces
    dns_servers = var.dns_servers
    subnet_prefixes = var.subnet_prefixes
    subnet_names = var.subnet_names
    tags = var.tags
    subnet_enforce_private_link_endpoint_network_policies = var.subnet_enforce_private_link_endpoint_network_policies
    subnet_service_endpoints = var.subnet_service_endpoints
    subId = var.subId
    client_Id = var.client_Id
    client_secret = var.client_secret
    tenant_id = var.tenant_id
    }

resource "azurerm_network_interface_backend_address_pool_association" "main" {
  count = var.backendvmcount
  network_interface_id    = "${element(module.vm.networkinterface[*], count.index)}"
  ip_configuration_name = "${element(module.vm.privateIPaddress[*], count.index)}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.main.id
}

