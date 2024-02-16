terraform {
  required_version = ">=0.12"
}

resource "azurerm_kubernetes_cluster" "k8s" {
  location            = var.cluster_location
  name                = var.cluster_name
  resource_group_name = var.cluster_rg
  dns_prefix          = var.dns_prefix

  identity {
    type = var.identity
  }

  default_node_pool {
    name       = var.node_pool_name
    vm_size    = var.node_pool_vm_size
    enable_auto_scaling =var.enable_auto_scaling
    node_count = var.node_pool_count
    min_count = var.node_pool_min
    max_count = var.node_pool_max

  }
  http_application_routing_enabled = var.http_routing_enabled
  ingress_application_gateway {
    
  }
  automatic_channel_upgrade = var.automatic_channel_upgrade


  network_profile {
    network_plugin    = var.network_profile_plugin
    load_balancer_sku = var.network_profile_lb_sku
  }
}