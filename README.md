
# Three-Tier Cloud Architecture with To-Do List Application

Welcome to my **Three-Tier Cloud Architecture** project! This repository demonstrates expertise in **cloud computing**, **containerization**, **Kubernetes**, **Terraform**, and **Azure DevOps** by hosting a full-stack **To-Do List Application** and powering my blog website, [vaideeshwaran.blog](https://vaideeshwaran.blog).

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
10. [Monitoring and Observability](#monitoring-and-observability)
11. [Future Improvements](#future-improvements)

---

## Overview

This project implements a **cloud-native three-tier architecture** to host:
1. **To-Do List Application (http://frontend.vaideeshwaran.blog)** (Frontend, Backend, and Database).
2. blog website **[vaideeshwaran.blog](https://vaideeshwaran.blog)** - Here, you can learn more about me, view my skills, certifications, and explore my projects!

It showcases:
- Scalable **Kubernetes deployments** with automated CI/CD pipelines.
- **Infrastructure as Code (IaC)** using Terraform.
- Integrated **monitoring and alerting** via Prometheus and Grafana.

---

## Architecture

The architecture consists of three tiers:
1. **Frontend**: React-based UI served through Nginx.
2. **Backend**: Node.js API server managing business logic and database interactions.
3. **Database**: MongoDB for persistent storage.

### Architecture Diagram

![Three-Tier Architecture Diagram](three_tier_architecture_diagram.png)

**Deployed on Azure Kubernetes Service (AKS)**:
- Horizontal Pod Autoscaling (HPA) for scalability.
- Persistent Volumes for database storage.
- Ingress controllers for routing traffic.

---

## Features

- **Scalable Architecture**: Kubernetes ensures reliability and fault tolerance.
- **Integrated Monitoring**: Prometheus and Grafana for real-time insights.
- **CI/CD Pipelines**: Azure DevOps automates application deployment.
- **Secure Configuration**: Secrets managed with Kubernetes and Azure tools.
- **Multi-Tier Deployment**: Frontend, backend, and database containerized.

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
- **Frontend**: [frontend.vaideeshwaran.blog](http://frontend.vaideeshwaran.blog)
- **GitHub Repository**: [View Source Code](https://github.com/vaideeshwarank/MyToDoListAppAKS.git)

Alternatively, visit [vaideeshwaran.blog](https://vaideeshwaran.blog) and click on the **"View My To-Do List App"** icon to explore.

---

## Blog Website

Visit my blog: **[vaideeshwaran.blog](https://vaideeshwaran.blog)**  
Here, you can learn more about me, view my skills, certifications, and explore my projects!

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

## Future Improvements

- Implement Helm charts for better management of Kubernetes manifests.
- Add unit and integration tests for backend and frontend.
- Automate SSL certificate management with Let's Encrypt.

---
