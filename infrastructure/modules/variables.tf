variable "cluster_location" {
  type        = string
  description = "The location where the Managed Kubernetes Cluster should be created. Changing this forces a new resource to be created."
}

variable "cluster_name" {
  type        = string
  description = "Specifies the Resource Group where the Managed Kubernetes Cluster should exist. Changing this forces a new resource to be created."
}

variable "cluster_rg" {
  type        = string
  description = "Specifies the Resource Group where the Managed Kubernetes Cluster should exist. Changing this forces a new resource to be created."
}

variable "dns_prefix" {
  type = string
  description = "DNS prefix specified when creating the managed cluster. Possible values must begin and end with a letter or number, contain only letters, numbers, and hyphens and be between 1 and 54 characters in length. Changing this forces a new resource to be created"
  default = "task-app"
}

variable "node_pool_name" {
  type = string
  description = "The name which should be used for the default Kubernetes Node Pool"
  default = "agentpool"
}

variable "node_pool_vm_size" {
  type = string
  description = "The size of the Virtual Machine, such as Standard_DS2_v2. temporary_name_for_rotation must be specified when attempting a resize."
  default = "Standard_DS2_v2"
}

variable "node_pool_count" {
  type = number
  description = "The initial number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000 and between min_count and max_count."
  default = 2
}

variable "node_pool_max" {
  type = number
  description = "The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000"
  default = 10
}

variable "node_pool_min" {
  type = number
  description = "The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
  default = 1
}

variable "identity" {
  type = string
  description = "Specifies the type of Managed Service Identity that should be configured on this Kubernetes Cluster. Possible values are SystemAssigned or UserAssigned."
  default = "SystemAssigned"
}

variable "network_profile_plugin" {
  type = string
  description = "Network plugin to use for networking. Currently supported values are azure, kubenet and none. Changing this forces a new resource to be created."
  default = "kubenet"
}

variable "network_profile_lb_sku" {
  type = string
  description = "Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are basic and standard. Defaults to standard. Changing this forces a new resource to be created."
  default = "standard"
}

variable "enable_auto_scaling" {
  type = bool
  description = "Should the Kubernetes Auto Scaler be enabled for this Node Pool?"
  default = true
}

variable "automatic_channel_upgrade" {
  type = string
  description = "The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable. Omitting this field sets this value to none."
  default = "patch"
}

variable "http_routing_enabled" {
  type = bool
  description = "Should HTTP Application Routing be enabled?"
  default = true
}