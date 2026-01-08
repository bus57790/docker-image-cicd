# Docker Image CI/CD Pipeline (Jenkins)

## Overview
This project demonstrates a full Docker image CI/CD pipeline using:
- Docker
- Jenkins
- Nexus / Artifactory / Docker Hub
- Trivy security scanning

## Pipeline Flow
1. Checkout source
2. Build Docker image
3. Scan image for vulnerabilities
4. Push image to registry

## Prerequisites
- Ubuntu 22.04+
- Docker
- Jenkins
- Nexus / Artifactory / Docker Hub account

## Build Locally
```bash
docker build -t docker-cicd-demo .
docker run -p 8080:80 docker-cicd-demo

