output "kube_config" {
  description = "Kubernetes configuration for access"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}
