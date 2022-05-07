output "LoadBalancer_Url" {
 value = "http://${azurerm_public_ip.main.ip_address}/"
}

output "Adminusername" {
  value = module.vm.username[0]
}