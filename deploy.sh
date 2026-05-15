#!/bin/bash

set -e

APP_NAME="cloud-native-mini"
IMAGE_NAME="cloud-native-mini:v1"
CLUSTER_NAME="dev"
NAMESPACE="cloud-mini"

echo "Docker image build ediliyor..."
docker build -t $IMAGE_NAME .

echo "Image kind cluster'a yükleniyor..."
kind load docker-image $IMAGE_NAME --name $CLUSTER_NAME

echo "Kubernetes manifestleri uygulanıyor..."
kubectl apply -f k8s/

echo "Durum kontrol ediliyor..."
kubectl get all -n $NAMESPACE

echo "Tamamlandı."
echo "Local erişim için:"
echo "kubectl port-forward svc/cloud-native-mini-service 8080:80 -n cloud-mini"