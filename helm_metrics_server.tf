resource "helm_release" "metrics-server" {
  name            = "metrics-server"
  repository      = "https://kubernetes-sigs.github.io/metrics-server/"
  chart           = "metrics-server"
  version         = "3.12.2"
  atomic          = true
  force_update    = true
  timeout         = 300
  cleanup_on_fail = true
  namespace       = "kube-system"

  set {
    name  = "args"
    value = "{--kubelet-insecure-tls=true}"
  }

  wait = true

  depends_on = [
    kind_cluster.this
  ]
}
