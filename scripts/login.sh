#!/bin/env bash

if [[ $1 == "headless" ]]; then
  read -p "Okteto API host (leave blank to use cloud.okteto.com): " -r OKTETO_HOST
  echo "To get your PAT for Okteto:"
  echo " * Sign in to Okteto CLoud or your Okteto Enterprise instnce."
  echo " * Navigate to Settings, then under Developer Settings, press 'New Token'."
  echo " * Give it a name, the press 'Generate'. Copy the API token."
  echo " * Finally, paste it below."
  read -p "Your Okteto API token: " -r OKTETO_TOKEN

  if [[ $OKTETO_TOKEN == "" ]]; then
    echo "No token provided, exiting..."
    exit 1
  elif [[ $OKTETO_HOST == "" ]]; then
    okteto login --token "$OKTETO_TOKEN"
  else
    okteto login "$OKTETO_HOST" --token "$OKTETO_TOKEN"
  fi
else
  okteto login
fi

EXIT_CODE=$?
if [[ $EXIT_CODE != "0" ]]; then
  exit $EXIT_CODE
fi

okteto namespace

if [[ $GITPOD != "" && $KUBECONFIG == "${GITPOD_REPO_ROOT}/.k8s/config.yml" ]] && [[ -f "$HOME/.kube/config" ]]; then
  COMMAND_INVOCATION_ID=$(openssl rand -hex 12)

  if [[ -f "$GITPOD_REPO_ROOT/.k8s/config.yml" ]]; then
    mv "$GITPOD_REPO_ROOT/.k8s/config.yml" "$GITPOD_REPO_ROOT/.k8s/snapshot-$COMMAND_INVOCATION_ID.yml"
    echo "Your old config is at $GITPOD_REPO_ROOT/.k8s/snapshot-$COMMAND_INVOCATION_ID.yml"
  fi

  mv "$HOME/.kube/config" "$GITPOD_REPO_ROOT/.k8s/config.yml"
fi