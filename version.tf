terraform {
  required_version = "~> 1.9.0"
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.6.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.33.0"
    }

    helm = {
      source  = "hashicorp/helm",
      version = "2.16.1"
    }
  }
}