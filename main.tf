
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}
###Create  namespace
resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}
###Deploy Prometheus
resource "helm_release" "prometheus" {
  name       = "prometheus"
  chart      = "prometheus"
  namespace  = "monitoring"
}
### Deploy Grafana
resource "helm_release" "grafana" {
  name       = "grafana"
  chart      = "grafana"
  namespace  = "monitoring"
}

