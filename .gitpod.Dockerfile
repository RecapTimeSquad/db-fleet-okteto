FROM gitpod/workspace-full

# Step 1: Install kubectl and Okteto CLI
RUN curl https://get.okteto.com -sSfL | sh

# Step 2: hardcode our config file path to something like this one.
ENV KUBECONFIG=/workspace/db-fleet-okteto/.k8s/config.yaml GITPOD=1