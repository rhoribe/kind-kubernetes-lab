# KIND Cluster Deployment with Terraform

This project automates the deployment of a Kubernetes cluster using **KIND (Kubernetes in Docker)** and **Terraform**. The cluster consists of one control plane node and three worker nodes. Additionally, this setup includes monitoring and observability tools such as Prometheus, Grafana, Loki, and a sample application called **Echo Request** running on port `8080`.

## Features

- **Cluster Setup**:
  - One control plane node
  - Three worker nodes
  - Provisioned using KIND and Terraform

- **Monitoring Stack**:
  - **Prometheus**: Collects and stores metrics
  - **Node Exporter**: Exposes hardware and OS metrics
  - **Alertmanager**: Manages alerts based on Prometheus metrics
  - **Grafana**: Visualizes metrics with customizable dashboards
  - **Loki**: Centralized log aggregation

- **Application**:
  - A sample application **Echo Request** that responds on port `8080`

## Prerequisites

Before running this project, ensure you have the following installed:

- [Docker](https://www.docker.com/)
- [Terraform](https://www.terraform.io/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Helm](https://helm.sh/)
- [Kind](https://kind.sigs.k8s.io)

## Getting Started

### Clone the Repository

```bash
git clone https://github.com/rhoribe/kind-kubernetes-lab
cd kind-kubernetes-lab
```

### Initialize Terraform

```bash
terraform init
````

### Deploy the Cluster

Run the following command to create the KIND cluster and deploy the stack:

```bash
terraform apply --auto-approve
````

## Access



Prometheus is available at:

```bash
 kubectl port-forward svc/prometheus-stack-kube-prom-prometheus -n prometheus-stack default 9090:9090
````

Grafana is available at:

```bash
kubectl port-forward svc/grafana -n grafana 3000:80
````

App Echo Server is available at:

```bash
kubectl port-forward svc/echo-server -n default 8080:8080
````

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.16.1 |
| <a name="requirement_kind"></a> [kind](#requirement\_kind) | 0.6.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.33.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.16.1 |
| <a name="provider_kind"></a> [kind](#provider\_kind) | 0.6.0 |


## Resources

| Name | Type |
|------|------|
| [helm_release.echo_server](https://registry.terraform.io/providers/hashicorp/helm/2.16.1/docs/resources/release) | resource |
| [helm_release.grafana](https://registry.terraform.io/providers/hashicorp/helm/2.16.1/docs/resources/release) | resource |
| [helm_release.keda](https://registry.terraform.io/providers/hashicorp/helm/2.16.1/docs/resources/release) | resource |
| [helm_release.loki](https://registry.terraform.io/providers/hashicorp/helm/2.16.1/docs/resources/release) | resource |
| [helm_release.metrics-server](https://registry.terraform.io/providers/hashicorp/helm/2.16.1/docs/resources/release) | resource |
| [helm_release.prometheus_stack](https://registry.terraform.io/providers/hashicorp/helm/2.16.1/docs/resources/release) | resource |
| [helm_release.promtail](https://registry.terraform.io/providers/hashicorp/helm/2.16.1/docs/resources/release) | resource |
| [kind_cluster.this](https://registry.terraform.io/providers/tehcyx/kind/0.6.0/docs/resources/cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Cluster Name | `string` | `"lab"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Kubernetes Version | `string` | `"v1.30.6"` | no |