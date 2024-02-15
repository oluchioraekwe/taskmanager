variable "rg-name" {
  type        = string
  description = "The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
}

variable "rg-location" {
  type        = string
  description = "The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
}


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