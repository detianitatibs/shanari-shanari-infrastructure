data "google_client_config" "current" {}

provider "kubernetes" {
  host                   = "https://${var.gke_endpoint}"
  token                  = "${data.google_client_config.current.access_token}"
  client_certificate     = "${base64decode(var.gke_client_certificate)}"
  client_key             = "${base64decode(var.gke_client_key)}"
  cluster_ca_certificate = "${base64decode(var.gke_cluster_ca_certificate)}"
}

provider "helm" {
  kubernetes {
    host                   = "https://${var.gke_endpoint}"
    token                  = "${data.google_client_config.current.access_token}"
    client_certificate     = "${base64decode(var.gke_client_certificate)}"
    client_key             = "${base64decode(var.gke_client_key)}"
    cluster_ca_certificate = "${base64decode(var.gke_cluster_ca_certificate)}"
  }
}

resource "kubernetes_namespace" "argo_cd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argo_cd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = ">=3.18.0"
  namespace  = "argocd"

  # set {
  #   name  = "argoServer.service.type"
  #   value = "LoadBalancer"
  # }
}
