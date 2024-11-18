provider "kind" {}

provider "kubernetes" {
  config_path = kind_cluster.this.kubeconfig_path
}

provider "helm" {
  kubernetes {
    config_path = kind_cluster.this.kubeconfig_path
  }
}