#!/bin/bash

set -e

APP_NAME="cloud-native-mini"
IMAGE_NAME="cloud-native-mini:v1"
CLUSTER_NAME="cloud-mini-cluster"
NAMESPACE="cloud-mini"

echo "Building Docker image..."
docker build -t $IMAGE_NAME .

echo "Loading Docker image into kind cluster..."
kind load docker-image $IMAGE_NAME --name $CLUSTER_NAME

echo "Applying Kubernetes namespace..."
kubectl apply -f k8s/namespace.yaml

echo "Applying Kubernetes deployment..."
kubectl apply -f k8s/deployment.yaml

echo "Applying Kubernetes service..."
kubectl apply -f k8s/service.yaml

echo "Restarting deployment..."
kubectl rollout restart deployment/$APP_NAME -n $NAMESPACE

echo "Waiting for deployment rollout..."
kubectl rollout status deployment/$APP_NAME -n $NAMESPACE

echo "Checking Kubernetes resources..."
kubectl get all -n $NAMESPACE

echo ""
echo "Deployment completed successfully."
echo ""
echo "Access application with:"
echo "kubectl port-forward -n $NAMESPACE service/cloud-native-mini-service 8080:80"
echo ""
echo "Then open:"
echo "http://localhost:8080"
