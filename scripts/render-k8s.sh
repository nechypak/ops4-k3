#!/usr/bin/env bash
set -euo pipefail

: "${ECR_REPOSITORY_URL:?Set ECR_REPOSITORY_URL first, example: export ECR_REPOSITORY_URL=123.dkr.ecr.us-east-1.amazonaws.com/ops4-k3-minecraft}"
: "${IMAGE_TAG:?Set IMAGE_TAG first, example: export IMAGE_TAG=ops4-v1}"

mkdir -p k8s/rendered

IMAGE="${ECR_REPOSITORY_URL}:${IMAGE_TAG}"

sed "s#__IMAGE__#${IMAGE}#g"   k8s/templates/deployment.yaml.tpl > k8s/rendered/deployment.yaml

echo "Rendered Kubernetes deployment with image: $IMAGE"
