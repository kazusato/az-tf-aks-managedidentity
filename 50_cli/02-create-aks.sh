#!/usr/bin/env bash
az aks create -g aks-mi-rg -n aks-mi-cluster \
  --ssh-key-value ~/ssh/id_rsa.pub \
  --enable-managed-identity
