#!/bin/bash
argoPwd=$(kubectl --kubeconfig kubeconfig_argocd -n argocd get secrets argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d)
echo $argoPwd