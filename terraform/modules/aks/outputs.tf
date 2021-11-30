output "aks_private_fqdn" {
  description = "Private FQDN of aks cluster"
  value       = azurerm_kubernetes_cluster.aksprivate.private_fqdn
}

output "aks_node_resource_group" {
  /* Note that AKS creates a seperate resource group called Node resource group
  (not the resource group that was
  selected during the initialization of AKS)*/
  description = "Node resource group created by AKS"
  value       = azurerm_kubernetes_cluster.aksprivate.node_resource_group
}

output "aks_generated_managed_identity" {
  /* Usage of this  generated managed identity
     1. From Pods, this identity can be used to 
        access other Azure resources like Azure Key Vault for example, to 
        retrieve secrets.
        (Of course we need to add this managed identity 
        in Azure vault's access policies, But we will do that in another module.
         )*/
  description = "Managed identity generated by AKS cluster"
  value       = azurerm_kubernetes_cluster.aksprivate.identity[0].principal_id
}