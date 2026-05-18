#!/bin/bash

set -e

NAMESPACE="monitoring"
RELEASE_NAME="monitoring"
CHART="oci://ghcr.io/prometheus-community/charts/kube-prometheus-stack"

echo "Creating monitoring namespace if it does not exist..."
kubectl create namespace $NAMESPACE --dry-run=client -o yaml | kubectl apply -f -

echo "Installing or upgrading Prometheus and Grafana stack..."
helm upgrade --install $RELEASE_NAME $CHART \
  --namespace $NAMESPACE

echo "Monitoring stack installation completed."

echo "Checking pods..."
kubectl get pods -n $NAMESPACE

echo ""
echo "Grafana access command:"
echo "kubectl port-forward -n monitoring service/monitoring-grafana 3000:80"
