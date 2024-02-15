
resource "azurerm_kubernetes_cluster" "k8s" {
  location            = azurerm_resource_group.main.location
  name                = var.cluster_name
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "task"

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = "agentpool"
    vm_size    = "Standard_D2_v2"
    node_count = 2
  }

  automatic_channel_upgrade = "patch"
  #   linux_profile {
  #     admin_username = var.username

  #     ssh_key {
  #       key_data = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
  #     }
  #   }
  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }
}