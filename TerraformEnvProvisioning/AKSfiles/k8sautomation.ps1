# Parameters
param (
    [string]$ResourceGroupName,         
    [string]$AksClusterName,            
    [string]$AksFilesPath,              
    [string]$SslCertPath,               
    [string]$SslPemPath,                
    [string]$DockerUsername,
    [string]$DockerPassword,
    [string]$DockerEmail
)

# Create Secret To Authenticate With Private Docker Repo
kubectl create secret docker-registry dockerhub-secret --docker-server=https://index.docker.io/v1/ --docker-username=$DockerUsername --docker-password=$DockerPassword --docker-email=$DockerEmail

# Create secret for SSL
kubectl create secret tls ssl-secret --key $SslCertPath --cert $SslPemPath
kubectl create namespace monitoring
kubectl create secret tls ssl-secret-monitoring --key $SslCertPath --cert $SslPemPath -n monitoring

# Create CMs for Grafana Dashboards 
kubectl create configmap kubernetes-cluster-dashboard --from-file=kubernetes-cluster-dashboard.json -n monitoring
kubectl create configmap kubernetes-pods-dashboard --from-file=kubernetes-pods-dashboard.json -n monitoring
kubectl create configmap kubernetes-node-dashboard --from-file=kubernetes-node-dashboard.json -n monitoring
# Label CMs for Grafana Dashboards
kubectl label configmap kubernetes-cluster-dashboard grafana_dashboard=1 -n monitoring
kubectl label configmap kubernetes-pods-dashboard grafana_dashboard=1 -n monitoring
kubectl label configmap kubernetes-node-dashboard grafana_dashboard=1 -n monitoring

Write-Host "Adding Prometheus Helm repository..."
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

Write-Host "Installing Prometheus with local prometheus-values.yaml..."
helm upgrade --install prometheus prometheus-community/kube-prometheus-stack `
    --namespace monitoring --create-namespace -f .\prometheus-values.yaml

Write-Host "Waiting for Prometheus and Alertmanager pods to be ready..."
Start-Sleep -Seconds 10

Write-Host "Applying custom Prometheus alerts..."
kubectl apply -f .\custom-alerts.yaml
kubectl apply -f .\testalert.yaml

# Configure Alertmanager
Write-Host "Configuring Alertmanager with alertmanager-config.yaml..."
kubectl delete secret alertmanager-prometheus-kube-prometheus-alertmanager -n monitoring --ignore-not-found
kubectl create secret generic alertmanager-prometheus-kube-prometheus-alertmanager --from-file=alertmanager.yaml=.\alertmanager-config.yaml -n monitoring

# Restart Alertmanager to Apply Configuration
Write-Host "Restarting Alertmanager to apply new configuration..."
kubectl rollout restart statefulset alertmanager-prometheus-kube-prometheus-alertmanager -n monitoring

# Install NGINX Ingress Controller using Helm
Write-Output "Installing NGINX Ingress Controller..."
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install ingress-nginx ingress-nginx/ingress-nginx --create-namespace --namespace ingress-nginx --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-health-probe-request-path"=/healthz --set controller.service.externalTrafficPolicy=Local

# Wait for the NGINX Ingress Controller to be ready
Write-Output "Waiting for NGINX Ingress Controller to be ready..."
do {
    Start-Sleep -Seconds 10
    $status = kubectl get pods -n ingress-nginx -l app.kubernetes.io/name=ingress-nginx -o jsonpath="{.items[0].status.containerStatuses[0].ready}"
} until ($status -eq "true")

# Apply all Kubernetes files in the AKSfiles folder
Write-Output "Applying Kubernetes manifests from $aksFilesPath..."
kubectl apply -f pv.yaml
kubectl apply -f pvc.yaml
kubectl apply -f mongodb-deployment.yaml

# Apply only YAML files in the specified directory
Write-Output "Applying Kubernetes YAML manifests from $AksFilesPath..."
Get-ChildItem -Path "$AksFilesPath" -Filter *.yaml | ForEach-Object {
    kubectl apply --validate=false -f $_.FullName
}

# Setup complete
Write-Host "Kubernetes resources setup complete."
