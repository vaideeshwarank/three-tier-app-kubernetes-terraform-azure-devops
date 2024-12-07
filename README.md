Three-Tier Cloud Architecture with To-Do List Application
Welcome to my Three-Tier Cloud Architecture project! This repository demonstrates expertise in cloud computing, containerization, Kubernetes, Terraform, and Azure DevOps by hosting a full-stack To-Do List Application and powering my blog website, vaideeshwaran.blog.

Table of Contents
Overview
Architecture
Features
Pre-requisites
Deployment Guide
Project Structure
Technologies Used
To-Do List App Demo
Monitoring and Observability
Future Improvements
Overview
This project implements a cloud-native three-tier architecture to host:

A To-Do List Application (Frontend, Backend, and Database).
A blog website vaideeshwaran.blog, with an icon to explore the live application.
It showcases:

Scalable Kubernetes deployments with automated CI/CD pipelines.
Infrastructure as Code (IaC) using Terraform.
Integrated monitoring and alerting via Prometheus and Grafana.
Architecture
The architecture consists of three tiers:

Frontend: React-based UI served through Nginx.
Backend: Node.js API server managing business logic and database interactions.
Database: MongoDB for persistent storage.
Architecture Diagram

Deployed on Azure Kubernetes Service (AKS):

Horizontal Pod Autoscaling (HPA) for scalability.
Persistent Volumes for database storage.
Ingress controllers for routing traffic.
Features
Scalable Architecture: Kubernetes ensures reliability and fault tolerance.
Integrated Monitoring: Prometheus and Grafana for real-time insights.
CI/CD Pipelines: Azure DevOps automates application deployment.
Secure Configuration: Secrets managed with Kubernetes and Azure tools.
Multi-Tier Deployment: Frontend, backend, and database containerized.
Pre-requisites
Ensure the following are installed on your local machine:

Azure CLI: To interact with Azure resources.
Terraform: For IaC deployment.
Kubectl: For Kubernetes cluster management.
Docker: For building container images.
Deployment Guide
Step 1: Provision Infrastructure with Terraform
Navigate to TerraformEnvProvisioning/AKSterraformfiles.
Update variables.tf with your Azure subscription details.
Run the following commands:
bash
Copy code
terraform init
terraform plan
terraform apply
This provisions the AKS cluster.
Step 2: Deploy Kubernetes Manifests
Navigate to TerraformEnvProvisioning/AKSfiles.
Apply the YAML files in the following order:
bash
Copy code
kubectl apply -f pv.yaml
kubectl apply -f pvc.yaml
kubectl apply -f mongodb-deployment.yaml
kubectl apply -f backend-deployment.yaml
kubectl apply -f frontend-deployment.yaml
kubectl apply -f ingress.yaml
Adjust file names based on your setup.
Step 3: Configure Azure DevOps Pipelines
Import azure-pipelines.yml in Azure DevOps.
Ensure proper service connections to Azure and Kubernetes.
Project Structure
plaintext
Copy code
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
Technologies Used
Azure Kubernetes Service (AKS): Managed Kubernetes service.
Terraform: Provisioning cloud infrastructure.
Docker: Containerizing applications.
Kubernetes: Orchestrating multi-tier deployments.
Prometheus & Grafana: Monitoring and visualization.
Azure DevOps: CI/CD pipelines for automation.
To-Do List App Demo
Visit vaideeshwaran.blog and click on the "View My To-Do List App" icon to explore the app.

Monitoring and Observability
Monitoring Tools:
Prometheus: Collects metrics from Kubernetes and application pods.
Grafana: Visualizes metrics with pre-built dashboards for:
Cluster health.
Pod resource usage.
Application performance.
Alerts:
Custom Prometheus alerts notify on:

High CPU/memory usage.
Pod failures or unavailability.
