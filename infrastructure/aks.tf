module "aks-cluster" {
  source           = "./modules"
  cluster_location = var.cluster_location
  cluster_name     = var.cluster_name
  cluster_rg       = azurerm_resource_group.main.name
}