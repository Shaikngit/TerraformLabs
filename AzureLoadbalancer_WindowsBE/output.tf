output "LoadBalacner Url" {
 value = "http://${azurerm_public_ip.main.ip_address}/"
}
