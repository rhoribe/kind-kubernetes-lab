
resource "helm_release" "echo_server" {
  name            = "echo-server"
  chart           = "./echo-server"
  namespace       = "default"
  wait            = true
  cleanup_on_fail = true
  timeout         = 300

  depends_on = [kind_cluster.this, helm_release.keda]
}