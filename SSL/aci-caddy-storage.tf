resource "azurerm_resource_group" "aci_caddy" {
  name     = "aci_caddy"
  location = local.location
}

resource "azurerm_storage_account" "aci_caddy" {
  name                      = "acicaddy"
  resource_group_name       = azurerm_resource_group.aci_caddy.name
  location                  = azurerm_resource_group.aci_caddy.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true
}

resource "azurerm_storage_share" "aci_caddy" {
  name                 = "aci-caddy-data"
  storage_account_name = azurerm_storage_account.aci_caddy.name
}
