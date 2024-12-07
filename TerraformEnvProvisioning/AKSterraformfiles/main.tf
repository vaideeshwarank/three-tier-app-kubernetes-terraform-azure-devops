# main.tfs

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.9.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "${var.aks_cluster_name}-dns"

  sku_tier = "Free"

  default_node_pool {
    name                   = "sysnodepool"
    node_count             = var.node_count
    vm_size                = var.node_vm_size
    os_disk_size_gb        = 30
    max_pods               = 110
    type                   = "VirtualMachineScaleSets"
    node_public_ip_enabled = false
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

  network_profile {
    network_plugin     = "azure"
    load_balancer_sku  = "basic"
    network_plugin_mode = "overlay"
    outbound_type      = "loadBalancer"
    dns_service_ip     = "10.0.0.10"
    service_cidr       = "10.0.0.0/16"
    pod_cidr           = "10.244.0.0/16"
  }

  tags = {
    env = "portfolio-environment"
  }

  node_os_upgrade_channel    = "None"

}