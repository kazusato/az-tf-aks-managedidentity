# Creating a Managed Identity enabled AKS cluster with Terraform

## Directories

- 01_aks: Terraform files for Managed Identity enabled AKS cluster
- 50_cli: CLI scripts to create Managed Identity enabled AKS cluster

## Instruction

### Put an SSH public key

```
$ cd 01_aks
$ mkdir nogit
$ cp /your/public/key/path nogit/id_rsa.pub
```

### Run terraform

```
$ terraform init
$ terraform plan
$ terraform apply
```

### Update kubeconfig

```
$ az aks get-credentials -g aks-mi-rg -n aks-mi-cluster
```

### Connect to the cluster

```
$ kubectl get nodes
```

## References

- https://docs.microsoft.com/en-us/azure/aks/use-managed-identity
- https://twitter.com/tmak_tw/status/1241557850540740611
- https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html 