resource "azurerm_kubernetes_cluster" "aks-mi-cluster" {
  dns_prefix = "aksmi"
  location = local.location
  name = "aks-mi-cluster"
  resource_group_name = azurerm_resource_group.aks-mi-rg.name
  kubernetes_version = "1.15.10"
  default_node_pool {
    name = "defaultpool"
    vm_size = "Standard_B2ms"
    node_count = 1
    os_disk_size_gb = "100"
    vnet_subnet_id = azurerm_subnet.aks-mi-cluster-subnet.id
  }
  linux_profile {
    admin_username = "ksadmin"
    ssh_key {
      key_data = file("nogit/id_rsa.pub")
    }
  }
  service_principal {
    client_id = "msi"
    client_secret = "dummy"
  }
  network_profile {
    network_plugin = "azure"
  }
  identity {
    type = "SystemAssigned"
  }
}