variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "client_id" {
  description = "Azure Client ID"
  type        = string
}
variable "client_secret" {
  description = "Azure Client Secret"
  type        = string
}
variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure location for resource deployment"
  type        = string
  default     = "spaincentral"
}

variable "aks_cluster_name" {
  description = "AKS cluster name"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the AKS cluster"
  type        = number
  default     = 1
}

variable "node_vm_size" {
  description = "VM size for the AKS node pool"
  type        = string
  default     = "Standard_B2ls_v2"
}

variable "kubernetes_version" {
  description = "The version of Kubernetes for the AKS cluster"
  type        = string
  default     = "1.29.9"
}