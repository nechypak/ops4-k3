#!/usr/bin/env bash
set -euo pipefail

PUBLIC_IP="${1:?Usage: ./scripts/verify.sh PUBLIC_IP}"

kubectl get nodes -o wide
kubectl -n minecraft get pods -o wide
kubectl -n minecraft get pvc
kubectl -n minecraft get svc minecraft
nmap -sV -Pn -p T:25565 "$PUBLIC_IP"
