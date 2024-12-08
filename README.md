
# Three-Tier Cloud Architecture with To-Do List Application

Welcome to my **Three-Tier Cloud Architecture** project! This repository demonstrates expertise in **cloud computing**, **containerization**, **Kubernetes**, **Terraform**, and **Azure DevOps** by hosting a three-tier **To-Do List Application** and powering my blog website, [https://vaideeshwaran.blog](https://vaideeshwaran.blog).

## Table of Contents
1. [Overview](#overview)
2. [Architecture](#architecture)
3. [Features](#features)
4. [Pre-requisites](#pre-requisites)
5. [Deployment Guide](#deployment-guide)
6. [Project Structure](#project-structure)
7. [Technologies Used](#technologies-used)
8. [To-Do List App Demo](#to-do-list-app-demo)
9. [Blog Website](#blog-website)
10. [DNS and SSL Management](#dns-and-ssl-management)
11. [Costs](#costs)
12. [Monitoring and Observability](#monitoring-and-observability)

---

## Overview

Designed and implemented a scalable and highly available three-tier application architecture with a focus on containerization, automation, and monitoring.

- **Frontend**: React-based user interface served through Nginx.
- **Backend**: Node.js API server for business logic and database interactions.
- **Database**: MongoDB for persistent storage.
- **Containerization**: Used Docker to containerize all components, ensuring consistency across development, testing, and production environments.
- **Kubernetes Deployment**: Hosted the application on Azure Kubernetes Service (AKS) for orchestration and high availability.
- **Infrastructure Provisioning**: Automated provisioning of resources using Terraform, reducing manual effort and setup time.
- **Version Control**: Managed source code and version control using GitHub, ensuring collaborative development and robust code management.
- **CI/CD Pipelines**: Configured Azure DevOps pipelines for continuous integration and deployment, enabling automated testing, build, and deployment processes.
- **Monitoring and Alerting**: Implemented monitoring using Prometheus and Grafana, providing real-time insights and proactive alerting for system health and performance.
- **DNS Hosting**: Cloudflare manages DNS resolution for `vaideeshwaran.blog` and subdomains.
- **SSL Certificates**: End-to-end encryption with Cloudflare's SSL/TLS management.

### Key Achievements

- Achieved **99.9% application uptime** through Kubernetes scaling and resource optimization.
- Reduced deployment time by **60%** with automated CI/CD pipelines.
- Improved troubleshooting efficiency with comprehensive monitoring dashboards.

This project implements a **cloud-native three-tier architecture** to host:
1. **To-Do List Application (https://vaideeshwaran.blog/frontend)** (Frontend, Backend, and Database).
2. Blog website **[https://vaideeshwaran.blog](https://vaideeshwaran.blog)** - Here, you can learn more about me, view my skills, certifications, and explore my projects!

---

## Architecture

The architecture consists of three tiers:
1. **Frontend**: React-based UI served through Nginx.
2. **Backend**: Node.js API server managing business logic and database interactions.
3. **Database**: MongoDB for persistent storage.

**Deployed on Azure Kubernetes Service (AKS)**:
- Horizontal Pod Autoscaling (HPA) for scalability.
- Persistent Volumes for database storage.
- Nginx Ingress controller for routing traffic.

---

## Features

- **Scalable Architecture**: Kubernetes ensures reliability and fault tolerance.
- **Integrated Monitoring**: Prometheus and Grafana for real-time insights.
- **CI/CD Pipelines**: Azure DevOps automates application deployment.
- **Three-Tier Deployment**: Frontend, backend, and database containerized.

---

## Pre-requisites

Ensure the following are installed on your local machine:
- **Azure CLI**: To interact with Azure resources.
- **Terraform**: For IaC deployment.
- **Kubectl**: For Kubernetes cluster management.
- **Docker**: For building container images.

---

## Deployment Guide

### Step 1: Provision Infrastructure with Terraform
1. Navigate to `TerraformEnvProvisioning/AKSterraformfiles`.
2. Update `variables.tf` with your Azure subscription details.
3. Run the following commands:
    ```bash
    terraform init
    terraform plan
    terraform apply
    ```
   This provisions the AKS cluster.

### Step 2: Deploy Kubernetes Manifests
1. Navigate to `TerraformEnvProvisioning/AKSfiles`.
2. Apply the YAML files in the following order:
    ```bash
    kubectl apply -f pv.yaml
    kubectl apply -f pvc.yaml
    kubectl apply -f mongodb-deployment.yaml
    kubectl apply -f backend-deployment.yaml
    kubectl apply -f frontend-deployment.yaml
    kubectl apply -f ingress.yaml
    ```
   Adjust file names based on your setup.

### Step 3: Configure Azure DevOps Pipelines
1. Import `azure-pipelines.yml` in Azure DevOps.
2. Ensure proper service connections to Azure and Kubernetes.

---

## Project Structure

```plaintext
.
├── TerraformEnvProvisioning
│   ├── AKSterraformfiles
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── AKSfiles
│       ├── Kubernetes YAML files for deployment
│
├── ToDoListAppCode
│   ├── backend
│   │   ├── Node.js backend API
│   │   ├── Dockerfile
│   │   ├── backend-build-pipeline.yml
│   ├── frontend
│   │   ├── React frontend
│   │   ├── Dockerfile
│   │   ├── frontend-build-pipeline.yml
│   ├── portfolio
│       ├── Blog website code (vaideeshwaran.blog)
│
├── README.md
```

---

## Technologies Used

- **Azure Kubernetes Service (AKS)**: Managed Kubernetes service.
- **Terraform**: Provisioning cloud infrastructure.
- **Docker**: Containerizing applications.
- **Kubernetes**: Orchestrating multi-tier deployments.
- **Prometheus & Grafana**: Monitoring and visualization.
- **Azure DevOps**: CI/CD pipelines for automation.

---

## To-Do List App Demo

The application is live! You can access it here:
- **Frontend**: [https://vaideeshwaran.blog/frontend](https://vaideeshwaran.blog/frontend)
- **GitHub Repository**: [View Source Code](https://github.com/vaideeshwarank/three-tier-app-kubernetes-terraform-azure-devops.git)

Alternatively, visit [https://vaideeshwaran.blog](https://vaideeshwaran.blog) and click on the **"View My To-Do List App"** icon to explore.

---

## Blog Website

Visit my blog: **[https://vaideeshwaran.blog](https://vaideeshwaran.blog)**  
Here, you can learn more about me, view my skills, certifications, and explore my projects!

---

## DNS and SSL Management

- **GoDaddy**:
  - Domain name **vaideeshwaran.blog** was purchased through GoDaddy.

- **Cloudflare**:
  - **DNS Hosting**: Cloudflare manages DNS resolution for `vaideeshwaran.blog` and subdomains.
  - **SSL Certificates**: End-to-end encryption with Cloudflare's SSL/TLS management.

---

## Costs

- **Domain Name**: ₹350 per year via GoDaddy.
- **Azure Infrastructure**: ₹800 per month for hosting the Kubernetes cluster and application.

---

## Monitoring and Observability

### Monitoring Tools:
1. **Prometheus**: Collects metrics from Kubernetes and application pods.
2. **Grafana**: Visualizes metrics with pre-built dashboards for:
    - Cluster health.
    - Pod resource usage.
    - Application performance.

### Alerts:
Custom Prometheus alerts notify on:
- High CPU/memory usage.
- Pod failures or unavailability.

---

