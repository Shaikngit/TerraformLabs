output "LoadBalancer_Url" {
 value = "http://${azurerm_public_ip.main.ip_address}/"
}

output "username" {
  value = azurerm_linux_virtual_machine.main[*].admin_username
}