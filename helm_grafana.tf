
resource "helm_release" "grafana" {
  name             = "grafana"
  repository       = "https://grafana.github.io/helm-charts"
  chart            = "grafana"
  version          = "8.6.0"
  atomic           = true
  force_update     = true
  timeout          = 300
  cleanup_on_fail  = true
  namespace        = "grafana"
  create_namespace = true

  values = [
    file("values/grafana.yaml")
  ]

  depends_on = [
    kind_cluster.this,
    helm_release.prometheus_stack
  ]

}


