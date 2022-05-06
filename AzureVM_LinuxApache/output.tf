output "privateIPaddress" {
    value = azurerm_network_interface.main[*].ip_configuration[0].name
}

output "networkinterface" {
    value = azurerm_network_interface.main[*].id
}

output "resourcegroup" {
  value = azurerm_linux_virtual_machine.main[*].resource_group_name
}

output "location" {
  value = azurerm_linux_virtual_machine.main[*].location
}

output "Public" {
 value = azurerm_public_ip.windows_terraform_pip[*].ip_address
}

output "username" {
  value = azurerm_linux_virtual_machine.main[*].admin_username
}
