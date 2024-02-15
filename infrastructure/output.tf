output "rg-name" {
  value = azurerm_resource_group.main.name
}

output "aks-name" {
  value = azurerm_kubernetes_cluster.k8s.name
}