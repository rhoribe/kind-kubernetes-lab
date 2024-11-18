resource "helm_release" "prometheus_stack" {
  name             = "prometheus-stack"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  version          = "66.2.1"
  atomic           = true
  force_update     = true
  timeout          = 300
  cleanup_on_fail  = true
  namespace        = "prometheus-stack"
  create_namespace = true

  values = [
    file("values/prometheus.yaml")
  ]

  depends_on = [
    kind_cluster.this
  ]
}
