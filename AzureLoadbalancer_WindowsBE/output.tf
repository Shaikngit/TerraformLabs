output "LoadBalacner Url" {
 value = "http://${azurerm_public_ip.main.ip_address}/"
}

output "username" {
  value = azurerm_windows_virtual_machine.main[*].admin_username
}