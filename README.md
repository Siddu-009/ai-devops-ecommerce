# AI DevOps E-Commerce Platform

## Project Overview

AI DevOps E-Commerce Platform is a cloud-native microservices application deployed on AWS using modern DevOps practices.

The project demonstrates Infrastructure as Code (Terraform), Containerization (Docker), Container Orchestration (Amazon EKS), CI/CD (Jenkins & GitHub), and AI integration capabilities.

---

# Architecture

![Architecture](screenshots/architecture.png)

## High-Level Architecture

User
↓
Application Load Balancer (ALB)
↓
Amazon EKS
├── Frontend Service
├── Backend API Service
└── AI Engine Service
↓
Amazon ECR
↓
GitHub + Jenkins CI/CD

---

# Technology Stack

## Cloud

* AWS EC2
* AWS EKS
* AWS ECR
* AWS IAM
* AWS VPC
* AWS ALB

## Infrastructure as Code

* Terraform

## Containerization

* Docker

## Container Orchestration

* Kubernetes
* Amazon EKS

## CI/CD

* Jenkins
* GitHub Actions

## Backend

* Python FastAPI

## Frontend

* React

## AI Integration

* OpenAI API

---

# Repository Structure

```text
ai-devops-ecommerce/
├── frontend/
├── backend/
├── ai-engine/
├── terraform/
├── kubernetes/
├── screenshots/
├── Jenkinsfile
└── README.md
```

---

# Infrastructure Provisioning

Infrastructure was provisioned using Terraform.

Resources Created:

* VPC
* Public Subnets
* Internet Gateway
* Route Tables
* Security Groups
* IAM Roles
* Amazon EKS Cluster
* Managed Node Groups
* Amazon ECR Repositories

Terraform Execution:

```bash
terraform init
terraform plan
terraform apply
```

# Amazon EKS Cluster

Amazon EKS was used to host Kubernetes workloads.

Features:

* Managed Control Plane
* Managed Node Groups
* Auto Scaling
* High Availability

# Docker Containerization

Each service was containerized.

Services:

* Frontend
* Backend
* AI Engine

Build Example:

```bash
docker build -t backend .
```

Push to ECR:

```bash
docker push <ecr-repository-url>
```

---

# Amazon ECR

Container images are stored in Amazon ECR.

Repositories:

* frontend
* backend
* ai-engine

# Kubernetes Deployment

Resources Created:

* Namespace
* Deployments
* Services
* ConfigMaps
* Secrets
* Ingress
* Horizontal Pod Autoscaler

Deployment Example:

```bash
kubectl apply -f .
```

# Application Load Balancer

AWS Load Balancer Controller was used to provision an ALB automatically.

Features:

* External Access
* Traffic Routing
* High Availability
  
# CI/CD Pipeline

Pipeline Flow:

GitHub
↓
Webhook
↓
Jenkins
↓
Docker Build
↓
Push to ECR
↓
Kubernetes Deployment
↓
Amazon EKS

---

# Jenkins

Jenkins was configured as the CI/CD orchestrator.

Pipeline Stages:

1. Source Checkout
2. Docker Build
3. Image Push
4. Kubernetes Deployment

Jenkins Dashboard:

![Jenkins Dashboard](screenshots/jenkins-dashboard.png)

# GitHub Integration

GitHub repository is integrated with Jenkins using Webhooks.

Workflow:

* Developer pushes code
* GitHub triggers Jenkins
* Jenkins executes deployment pipeline

# AI Engine

AI Engine provides intelligent capabilities.

Features:

* Product Recommendations
* Customer Support Chatbot
* Product Search Assistance
* AI-Based Suggestions

Technology:

* Python
* FastAPI
* OpenAI API

---

# Kubernetes Verification

Check Pods

```bash
kubectl get pods -n ai-devops
```

Check Services

```bash
kubectl get svc -n ai-devops
```

Check Ingress

```bash
kubectl get ingress -n ai-devops
```

---

# Security

Implemented Security Controls:

* IAM Roles
* Kubernetes Secrets
* Security Groups
* Private Container Registry
* HTTPS Ready Architecture

---

# Future Enhancements

* Prometheus Monitoring
* Grafana Dashboards
* ArgoCD GitOps
* Blue/Green Deployment
* Canary Deployment
* SonarQube
* Trivy Security Scanning
* Route53 Custom Domain
* ACM SSL Certificates

---

# Screenshots

## AWS Infrastructure

![AWS Infrastructure](screenshots/aws-infrastructure.png)

## Kubernetes Pods

![Pods](screenshots/kubernetes-pods.png)

## Jenkins

![Jenkins](screenshots/jenkins-dashboard.png)

## Application

![Application](screenshots/application-homepage.png)

---
# End-to-End Working Flow

## Step 1: Developer Writes Code

The developer makes changes in one of the services:

* Frontend (React)
* Backend (FastAPI)
* AI Engine

Example:

```bash
git add .
git commit -m "Added new product recommendation feature"
git push origin main
```

---

## Step 2: Code is Pushed to GitHub

The latest code is stored in the GitHub repository.

GitHub acts as the central source code management platform.

Responsibilities:

* Source Code Management
* Version Control
* Collaboration
* Triggering CI/CD Pipeline

---

## Step 3: GitHub Webhook Triggers Jenkins

GitHub sends a webhook event to Jenkins whenever code is pushed.

Flow:

GitHub
↓
Webhook Event
↓
Jenkins

The webhook notifies Jenkins that new code is available.

---

## Step 4: Jenkins Starts CI/CD Pipeline

Jenkins automatically starts the deployment pipeline.

Pipeline Stages:

1. Source Code Checkout
2. Docker Image Build
3. Docker Image Tagging
4. Push Image to Amazon ECR
5. Deploy to Kubernetes
6. Verify Deployment

---

## Step 5: Jenkins Clones Repository

Jenkins downloads the latest code from GitHub.

Example:

```bash
git clone https://github.com/username/ai-devops-ecommerce.git
```

Jenkins always works with the latest version of the application.

---

## Step 6: Docker Builds Container Images

Each microservice is packaged into a Docker image.

Services:

* frontend
* backend
* ai-engine

Example:

```bash
docker build -t backend:latest .
```

Benefits:

* Portability
* Consistency
* Faster Deployment

---

## Step 7: Images are Pushed to Amazon ECR

After the build is completed, Jenkins pushes the images to Amazon Elastic Container Registry (ECR).

Flow:

Docker Image
↓
Amazon ECR

Repositories:

* frontend
* backend
* ai-engine

Example:

```bash
docker push <account-id>.dkr.ecr.ap-south-1.amazonaws.com/backend:latest
```

---

## Step 8: Kubernetes Deployment Update

Jenkins updates Kubernetes deployments.

Example:

```bash
kubectl rollout restart deployment backend -n ai-devops
```

Kubernetes pulls the latest image from ECR.

---

## Step 9: Amazon EKS Schedules Pods

Amazon EKS manages Kubernetes workloads.

Tasks performed:

* Pull Image from ECR
* Create New Pods
* Schedule Pods on Worker Nodes
* Maintain Desired Replica Count

Example:

```bash
kubectl get pods -n ai-devops
```

---

## Step 10: Services Expose Applications

Kubernetes Services provide internal networking.

Services:

* frontend-service
* backend-service
* ai-engine-service

Responsibilities:

* Service Discovery
* Internal Load Balancing
* Stable Networking

---

## Step 11: Ingress Routes Traffic

AWS Load Balancer Controller automatically creates an Application Load Balancer (ALB).

Traffic Flow:

Internet User
↓
AWS ALB
↓
Kubernetes Ingress
↓
Frontend / Backend / AI Engine

Routing:

/ → Frontend

/api → Backend

/ai → AI Engine

---

## Step 12: User Accesses Application

Users access the application using the ALB DNS URL.

Example:

```text
http://<alb-dns-name>
```

Frontend communicates with Backend APIs.

Backend communicates with AI Engine.

---

## Step 13: AI Engine Processes Requests

AI Engine provides intelligent capabilities.

Examples:

* Product Recommendations
* AI Chatbot
* Customer Support
* Smart Search

Flow:

User Query
↓
Backend API
↓
AI Engine
↓
OpenAI API
↓
Response

---

## Step 14: Horizontal Pod Autoscaler (HPA)

Kubernetes continuously monitors CPU and Memory utilization.

When traffic increases:

2 Pods
↓
4 Pods
↓
6 Pods

When traffic decreases:

6 Pods
↓
4 Pods
↓
2 Pods

Benefits:

* Cost Optimization
* High Availability
* Better Performance

---

## Step 15: Continuous Deployment

Every new GitHub push automatically follows the same process:

Developer
↓
GitHub
↓
Webhook
↓
Jenkins
↓
Docker Build
↓
Amazon ECR
↓
Amazon EKS
↓
Kubernetes Deployment
↓
Application Updated

No manual deployment is required.

---

# Complete Architecture Flow

Developer
↓
GitHub Repository
↓
GitHub Webhook
↓
Jenkins Pipeline
↓
Docker Build
↓
Amazon ECR
↓
Amazon EKS
↓
Kubernetes Pods
↓
Kubernetes Services
↓
Ingress
↓
AWS Application Load Balancer
↓
Users

AI Requests

Users
↓
Frontend
↓
Backend API
↓
AI Engine
↓
OpenAI API
↓
Response

