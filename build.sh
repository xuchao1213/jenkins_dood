#!/usr/bin/env bash
set -euxo pipefail

docker build -t registry.cn-shanghai.aliyuncs.com/gen-iot/jenkins:lts .
docker push registry.cn-shanghai.aliyuncs.com/gen-iot/jenkins:lts
