#!/bin/bash

export DOCKER_BUILDKIT=${DOCKER_BUILDKIT:-"1"}

docker build --file .gitpod.Dockerfile --tag registry.gitlab.com/gitpodify/images/do-not-push:localdev .