resource "azurerm_container_group" "aci_caddy" {
  resource_group_name = "aci_caddy"
  location            = local.location
  name                = "aci_caddy"
  os_type             = "Linux"
  dns_name_label      = "aci-caddy"
  ip_address_type     = "public"

  container {
    name   = "app"
    image  = "nginxinc/nginx-unprivileged"
    cpu    = "0.5"
    memory = "0.5"
  }

  container {
    name   = "caddy"
    image  = "caddy"
    cpu    = "0.5"
    memory = "0.5"

    ports {
      port     = 443
      protocol = "TCP"
    }

    ports {
      port     = 80
      protocol = "TCP"
    }

    volume {
      name                 = "aci-caddy-data"
      mount_path           = "/data"
      storage_account_name = azurerm_storage_account.aci_caddy.name
      storage_account_key  = azurerm_storage_account.aci_caddy.primary_access_key
      share_name           = azurerm_storage_share.aci_caddy.name
    }

    commands = ["caddy", "reverse-proxy", "--from", "aci-caddy.westeurope.azurecontainer.io", "--to", "localhost:8080"]
  }
}

output "url" {
  value = "https://${azurerm_container_group.aci_caddy.fqdn}"
  description = "URL"
}
