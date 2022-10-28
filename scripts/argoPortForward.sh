#!/bin/bash
kubectl --kubeconfig kubeconfig_argocd -n argocd port-forward svc/argocd-server 8080:443