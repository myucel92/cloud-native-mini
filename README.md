# AI-Assisted Cloud Native CI/CD Pipeline

A cloud-native Flask application containerized with Docker, deployed on Kubernetes, and integrated with a GitHub Actions CI pipeline including security scanning, AI-generated review reporting, and monitoring with Prometheus and Grafana.

## Project Overview

This project demonstrates a modern DevOps workflow for a containerized Python application.

It includes:

* Python Flask REST API
* Docker containerization
* Kubernetes deployment
* Namespace isolation
* GitHub Actions CI pipeline
* Docker image build automation
* Trivy vulnerability scanning
* AI-assisted security review report
* Prometheus monitoring
* Grafana dashboards
* Automated monitoring installation

## Tech Stack

* Python
* Flask
* Docker
* Kubernetes
* kind
* GitHub Actions
* Trivy
* Helm
* Prometheus
* Grafana

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
│   ├── ai_review.py
│   └── install_monitoring.sh
├── .github/
│   └── workflows/
│       └── ci.yml
├── Dockerfile
├── deploy.sh
├── README.md
└── .gitignore
```

## API Endpoints

```http
GET /
GET /health
```

## Example Response

```json
{
  "message": "Cloud Native Mini Project is running!",
  "status": "success",
  "version": "v1"
}
```

## Run Locally with Docker

Build the Docker image:

```bash
docker build -t cloud-native-mini:v1 .
```

Run the container:

```bash
docker run -p 5000:5000 cloud-native-mini:v1
```

Open:

```text
http://localhost:5000
```

## Automated Deployment

The application deployment process is automated with the `deploy.sh` script.

Run:

```bash
./deploy.sh
```

This script automatically:

* Builds the Docker image
* Loads the Docker image into the kind cluster
* Applies Kubernetes manifests
* Restarts the Kubernetes deployment
* Waits for rollout completion
* Displays Kubernetes resources

## Deploy to Kubernetes with kind

Create a kind cluster:

```bash
kind create cluster --name cloud-mini-cluster
```

Run the automated deployment script:

```bash
./deploy.sh
```

Access the application locally:

```bash
kubectl port-forward -n cloud-mini service/cloud-native-mini-service 8080:80
```

Open:

```text
http://localhost:8080
```

## CI/CD Pipeline

The GitHub Actions pipeline runs automatically on every push to the `main` branch.

Pipeline stages:

1. Checkout repository
2. Set up Python environment
3. Install dependencies
4. Validate Flask application syntax
5. Build Docker image
6. Run Trivy vulnerability scan
7. Generate AI-assisted security review
8. Upload AI review report as an artifact

## Security Scanning

This project uses Trivy to scan the Docker image for vulnerabilities.

The scan checks for:

* CRITICAL vulnerabilities
* HIGH vulnerabilities
* Unfixed package issues

## AI-Assisted Review

The pipeline includes a Python-based AI review script that generates a security review report based on the scan result.

The generated report is uploaded as a GitHub Actions artifact.

Example report:

```text
AI Security Review
==================

Analysis Result:
- No CRITICAL vulnerabilities detected.
- No HIGH severity vulnerabilities detected.
- Some MEDIUM and LOW vulnerabilities exist.
- Current container security posture is acceptable for development environments.

Recommendations:
- Keep base images updated regularly.
- Minimize unused packages.
- Run periodic vulnerability scans.
```

## Monitoring & Observability

This project includes a monitoring stack based on Prometheus and Grafana.

### Monitoring Components

* Prometheus → collects Kubernetes and application metrics
* Grafana → visualizes metrics using dashboards
* kube-prometheus-stack → provides a production-ready monitoring stack for Kubernetes

### Features

* Kubernetes cluster monitoring
* Node metrics
* Pod metrics
* Namespace monitoring
* Grafana dashboards
* Automated monitoring stack installation

## Install Monitoring Stack

The monitoring stack can be installed automatically using the provided script.

Run:

```bash
./scripts/install_monitoring.sh
```

This script will:

* Create the monitoring namespace if it does not exist
* Install or upgrade the kube-prometheus-stack Helm chart
* Deploy Prometheus and Grafana
* Display monitoring pod status
* Provide Grafana access instructions

## Access Grafana

Run:

```bash
kubectl port-forward -n monitoring service/monitoring-grafana 3000:80
```

Open:

```text
http://localhost:3000
```

Grafana credentials can be retrieved from Kubernetes secrets.

## Example Dashboards

The monitoring stack includes preconfigured Kubernetes dashboards such as:

* Kubernetes / Compute Resources / Cluster
* Kubernetes / Compute Resources / Namespace
* Kubernetes / Compute Resources / Pod

These dashboards help visualize cluster resource usage and application metrics.

## Purpose of Observability

This monitoring setup demonstrates the basics of observability in cloud-native environments.

It helps monitor:

* cluster health
* pod resource usage
* node metrics
* application performance

and provides visibility into the Kubernetes environment.

## Purpose

This project was created as a beginner-friendly but practical DevOps / Cloud Engineering portfolio project.

It demonstrates how to build, containerize, scan, monitor, and deploy a cloud-native application using modern DevOps tools.

## Future Improvements

* Real OpenAI API integration
* Kubernetes deployment automation
* Helm chart support
* Custom application metrics
* Prometheus alert rules
* Terraform infrastructure provisioning
* GitOps deployment with ArgoCD
