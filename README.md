# AI-Assisted Cloud Native CI/CD Pipeline

A cloud-native Flask application containerized with Docker, deployed on Kubernetes, and integrated with monitoring, ingress routing, and CI/CD automation.

---

## Project Overview

This project demonstrates a modern DevOps workflow for a containerized Python application running on Kubernetes.

It includes:

- Python Flask REST API
- Docker containerization
- Kubernetes deployment
- Namespace isolation
- NGINX Ingress routing
- GitHub Actions CI pipeline
- Docker image build automation
- Trivy vulnerability scanning
- AI-generated security review reporting
- Prometheus monitoring
- Grafana dashboards
- Custom application metrics
- Automated monitoring installation

---

## Tech Stack

- Python
- Flask
- Docker
- Kubernetes
- kind
- GitHub Actions
- Trivy
- Helm
- Prometheus
- Grafana
- NGINX Ingress

---

## Project Structure

```text
cloud-native-mini/
├── app/
│   ├── app.py
│   └── requirements.txt
├── k8s/
│   ├── namespace.yaml
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── ingress.yaml
│   └── servicemonitor.yaml
├── monitoring/
│   └── grafana-dashboard.json
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

---

## API Endpoints

```http
GET /
GET /health
GET /metrics
```

---

## Example Response

```json
{
  "message": "Cloud Native Mini Project is running!",
  "status": "success",
  "version": "v1"
}
```

---

## Run Locally with Docker

Build the Docker image:

```bash
docker build -t cloud-native-mini:v2 .
```

Run the container:

```bash
docker run -p 5000:5000 cloud-native-mini:v2
```

Open:

```text
http://localhost:5000
```

---

## Automated Deployment

The application deployment process is automated with the `deploy.sh` script.

Run:

```bash
./deploy.sh
```

This script automatically:

- Builds the Docker image
- Loads the Docker image into the kind cluster
- Applies Kubernetes manifests
- Restarts the Kubernetes deployment
- Waits for rollout completion
- Displays Kubernetes resources

---

## Deploy to Kubernetes with kind

Create a kind cluster:

```bash
kind create cluster --name cloud-mini-cluster
```

Run the deployment script:

```bash
./deploy.sh
```

---

## Access Application with Ingress

Run:

```bash
kubectl port-forward -n ingress-nginx service/ingress-nginx-controller 8080:80
```

Access:

```text
http://cloud-mini.local
```

Example request:

```bash
curl -H "Host: cloud-mini.local" http://localhost:8080
```

---

## Architecture

```text
Client
   ↓
NGINX Ingress
   ↓
Kubernetes Service
   ↓
Flask Application Pod
   ↓
Prometheus
   ↓
Grafana
```

---

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
8. Upload AI review report artifact

---

## Security Scanning

This project uses Trivy to scan Docker images for vulnerabilities.

The scan checks for:

- CRITICAL vulnerabilities
- HIGH vulnerabilities
- Unfixed package issues

---

## AI-Assisted Review

The pipeline includes a Python-based AI review script that generates a security analysis report based on vulnerability scan results.

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

---

## Monitoring & Observability

This project includes a monitoring stack based on Prometheus and Grafana.

### Monitoring Components

- Prometheus → collects Kubernetes and application metrics
- Grafana → visualizes metrics using dashboards
- kube-prometheus-stack → production-ready monitoring stack

### Features

- Kubernetes cluster monitoring
- Node metrics
- Pod metrics
- Namespace monitoring
- Grafana dashboards
- Custom Flask metrics
- Automated monitoring installation

---

## Custom Application Metrics

The Flask application exposes Prometheus metrics through:

```text
/metrics
```

Example metric:

```text
flask_app_requests_total
```

These metrics are collected by Prometheus and visualized through Grafana dashboards.

---

## Install Monitoring Stack

Run:

```bash
./scripts/install_monitoring.sh
```

This script automatically:

- Creates the monitoring namespace
- Installs kube-prometheus-stack
- Deploys Prometheus and Grafana
- Displays monitoring pod status
- Provides Grafana access instructions

---

## Access Grafana

Run:

```bash
kubectl port-forward -n monitoring service/monitoring-grafana 3000:80
```

Open:

```text
http://localhost:3000
```

Grafana credentials are stored in Kubernetes secrets.

---

## Example Dashboards

Included dashboards visualize:

- Kubernetes cluster metrics
- Namespace resource usage
- Pod resource usage
- HTTP request metrics
- Application monitoring

---

## Purpose of Observability

This monitoring setup demonstrates observability fundamentals in cloud-native environments.

It provides visibility into:

- Cluster health
- Pod resource usage
- Node metrics
- Application performance
- Request monitoring

---

## Purpose

This project was created as a practical DevOps / Cloud Engineering portfolio project.

It demonstrates how to:

- Build containerized applications
- Deploy applications on Kubernetes
- Configure ingress routing
- Monitor applications with Prometheus & Grafana
- Perform vulnerability scanning
- Automate CI/CD workflows

---

## Future Improvements

- Horizontal Pod Autoscaler (HPA)
- Loki centralized logging
- Production-grade Helm charts
- Multi-environment deployment strategy
- Terraform infrastructure provisioning
- GitOps deployment with ArgoCD
- Production-ready deployment pipeline

---

## Author

Mustafa Yucel