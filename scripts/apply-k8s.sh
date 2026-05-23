#!/usr/bin/env bash
set -euo pipefail

: "${KUBECONFIG:=/etc/rancher/k3s/k3s.yaml}"

kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/pv.yaml
kubectl apply -f k8s/pvc.yaml
kubectl apply -f k8s/configmap.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/rendered/deployment.yaml

kubectl -n minecraft rollout status deployment/minecraft --timeout=10m
kubectl -n minecraft get pods -o wide
kubectl -n minecraft get svc minecraft
