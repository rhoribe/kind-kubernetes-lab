resource "helm_release" "loki" {
  name             = "loki"
  repository       = "https://grafana.github.io/helm-charts"
  chart            = "loki"
  version          = "5.47.2"
  atomic           = true
  force_update     = true
  cleanup_on_fail  = true
  timeout          = 300
  namespace        = "loki"
  create_namespace = true

  values = [
    file("values/loki.yaml")
  ]

  depends_on = [
    kind_cluster.this,
    helm_release.grafana
  ]
}

resource "helm_release" "promtail" {
  name            = "promtail"
  repository      = "https://grafana.github.io/helm-charts"
  chart           = "promtail"
  version         = "6.16.6"
  atomic          = true
  force_update    = true
  cleanup_on_fail = true
  timeout         = 300
  namespace       = "loki"


  values = [
    file("values/promtail.yaml")
  ]

  depends_on = [
    kind_cluster.this,
    helm_release.loki
  ]
}