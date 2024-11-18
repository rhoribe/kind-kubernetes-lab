resource "helm_release" "keda" {
  name             = "keda"
  repository       = "https://kedacore.github.io/charts"
  chart            = "keda"
  version          = "2.16.0"
  atomic           = true
  force_update     = true
  timeout          = 300
  cleanup_on_fail  = true
  namespace        = "keda"
  create_namespace = true


  wait = true

  depends_on = [
    kind_cluster.this
  ]
}
