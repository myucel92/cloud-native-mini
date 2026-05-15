# Cloud Native Mini

This project demonstrates how to containerize a simple HTML application with Docker and deploy it to a local Kubernetes cluster running on kind.

## Technologies Used

- Ubuntu WSL
- Docker
- kind
- Kubernetes
- kubectl
- k9s
- Nginx

## Project Structure

```text
cloud-native-mini/
├── app/
│   └── index.html
├── k8s/
│   ├── namespace.yaml
│   ├── deployment.yaml
│   └── service.yaml
├── Dockerfile
├── deploy.sh
└── README.md