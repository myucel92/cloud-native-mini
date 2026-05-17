# AI-Assisted Cloud Native CI/CD Pipeline

A cloud-native Flask application containerized with Docker, deployed on Kubernetes, and integrated with a GitHub Actions CI pipeline including security scanning and AI-generated review reporting.

## Project Overview

This project demonstrates a modern DevOps workflow for a containerized Python application.

It includes:

- Python Flask REST API
- Docker containerization
- Kubernetes deployment
- Namespace isolation
- GitHub Actions CI pipeline
- Docker image build automation
- Trivy vulnerability scanning
- AI-assisted security review report
- GitHub Actions artifact upload

## Tech Stack

- Python
- Flask
- Docker
- Kubernetes
- kind
- GitHub Actions
- Trivy
- AI Review Script

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
├── scripts/
│   └── ai_review.py
├── .github/
│   └── workflows/
│       └── ci.yml
├── Dockerfile
├── deploy.sh
├── README.md
└── .gitignore