# Hello World Go App - DevOps Assessment

This repository contains a simple **Go "Hello World" web application**, along with a **Dockerfile**, **Helm chart**, and **GitHub Actions CI workflow**.  
It demonstrates containerization, Kubernetes deployment with Helm, and CI/CD automation.

---
## Prerequisites

- Docker (I used Docker Desktop)
- Kubernetes cluster (Docker Desktop-local)
- Helm 3
- Git

---

## Build and Deploy Locally

1. **Build the Docker image**:

```bash
docker build -t hello-world:local ./app

##**Install Helm chart**
helm dependency build helm/hello-world
helm upgrade --install hello-world ./helm/hello-world

##**Access the Application**
kubectl port-forward svc/hello-world-hello-world 8080:80
http://localhost:8080         - Hello World page
http://localhost:8080/healthz  - Health check endpoint


