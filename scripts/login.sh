#!/bin/env bash

okteto login

if [[ $GITPOD != "" && $KUBECONFIG == "${GITPOD_REPO_ROOT}/.k8s/config.yml" ]] && [[ -f "$HOME/.kube/config" ]]; then
  COMMAND_INVOCATION_ID=$(openssl rand -hex 12)

  if [[ -f "$GITPOD_REPO_ROOT/.k8s/config.yml" ]]; then
    mv "$GITPOD_REPO_ROOT/.k8s/config.yml" "$GITPOD_REPO_ROOT/.k8s/snapshot-$COMMAND_INVOCATION_ID.yml"
    echo "Your old config is at $GITPOD_REPO_ROOT/.k8s/snapshot-$COMMAND_INVOCATION_ID.yml"
  fi

  mv "$HOME/.kube/config" "$GITPOD_REPO_ROOT/.k8s/config.yml"
fi