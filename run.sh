#!/bin/bash

function check_command {
  COMMAND_PARAMETER=$1

  if ! command -v ${COMMAND_PARAMETER} &> /dev/null
  then
    echo "Command '${COMMAND_PARAMETER}' could not be found. Please use 'brew install ${COMMAND_PARAMETER}'"
    exit
  fi
}

check_command kubectl
check_command helm
check_command cloudflared

if [ -e ~/.cloudflared/cert.pem ]; then
  cp ~/.cloudflared/cert.pem charts/cloudflared/files/
fi

if compgen -G "~/.cloudflared/*.json" > /dev/null; then
  echo "Tunnel UUID credential does no exist. Please use with 'cloudflared tunnel login' command. And create a tunnel e.g. 'cloudflared tunnel create pi-cluster'"
  exit
fi

cp ~/.cloudflared/*.json charts/cloudflared/files/

ADDITIONAL_VALUES_FILE=""
if [ -e ./values.yaml ]; then
  ADDITIONAL_VALUES_FILE="-f values.yaml"
fi

helm upgrade --install \
  --namespace cloudflare \
  --create-namespace ${ADDITIONAL_VALUES_FILE} \
  cloudflare \
  ./charts/cloudflared
