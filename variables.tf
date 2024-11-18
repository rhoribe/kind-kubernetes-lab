variable "cluster_name" {
  description = "Cluster Name "
  type        = string
  default     = "lab"
}

variable "kubernetes_version" {
  description = "Kubernetes Version"
  type        = string
  default     = "v1.30.6"
}