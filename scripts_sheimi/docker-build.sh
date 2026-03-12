#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname $(dirname "${BASH_SOURCE[0]}"))" && pwd)"

TAG=$(date +%Y%m%d-%H%M)

TAG_DOCKERHUB="sheimi/openclaw:${TAG}"
TAG_DEPUTY_AI="deputyai.azurecr.io/openclaw:${TAG}"
TAG_CN="registry.cn-hangzhou.aliyuncs.com/deputy-ai/openclaw:${TAG}"

echo "==> Building Docker image: $TAG_DOCKERHUB"
echo "==> Building Docker image: $TAG_DEPUTY_AI"
echo "==> Building Docker image: $TAG_CN"
docker buildx build --platform linux/amd64,linux/arm64 \
  -t "$TAG_DOCKERHUB" \
  -t "$TAG_DEPUTY_AI" \
  -t "$TAG_CN" \
  -f "$ROOT_DIR/Dockerfile" \
  --push \
  "$ROOT_DIR"
