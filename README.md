# Cloud Native Mini Project

A simple cloud-native Python Flask application containerized with Docker and deployed on Kubernetes.

## Tech Stack

- Python
- Flask
- Docker
- Kubernetes
- kind
- Git / GitHub

## Project Structure

```text
cloud-native-mini/
├── app/
│   ├── app.py
│   └── requirements.txt
├── k8s/
│   ├── namespace.yaml
│   ├── deployment.yaml
│   └── service.yaml
├── Dockerfile
├── deploy.sh
├── README.md
└── .gitignore