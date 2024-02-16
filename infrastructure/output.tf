output "rg-name" {
  value = azurerm_resource_group.main.name
}

output "aks-name" {
  value = module.aks-cluster.cluster_name
}