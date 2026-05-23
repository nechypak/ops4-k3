#!/usr/bin/env bash
set -euo pipefail

ssh -i ~/Downloads/cs312-key.pem ubuntu@"${1:?Usage: ./scripts/backup-now.sh PUBLIC_IP}" 'sudo /usr/local/bin/minecraft-k8s-backup.sh'
