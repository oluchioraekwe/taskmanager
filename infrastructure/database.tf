resource "azurerm_mysql_server" "k8s" {
  name                = "taskmanger-k8s"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  administrator_login          = "mysqladminun"
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "B_Gen5_2"
  storage_mb = 5120
  version    = "8.0"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = false
  ssl_minimal_tls_version_enforced  = "TLSEnforcementDisabled"
}

resource "azurerm_mysql_database" "taskmanagerapp" {
  name                = "taskmanager"
  resource_group_name = azurerm_resource_group.main.name
  server_name         = azurerm_mysql_server.k8s.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}


resource "azurerm_mysql_firewall_rule" "local" {
  name                = "local"
  resource_group_name = azurerm_resource_group.main.name
  server_name         = azurerm_mysql_server.k8s.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}