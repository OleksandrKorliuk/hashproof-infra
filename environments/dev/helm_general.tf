resource "helm_release" "argocd-repo" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "6.6.0"
  namespace  = "cicd"
  atomic     = true
  values = [
    file("../../helm/templates/general/argo-cd_values.yaml")
  ]
  set {
    name  = "server.ingress.hosts[0]"
    value = "argo-dev.${var.domain}"
  }
  set {
    name  = "server.ingress.tls[0].hosts[0]"
    value = "argo-dev.${var.domain}"
  }
  set {
    name  = "server.config.url"
    value = "https://argo-dev.${var.domain}/"
  }
  depends_on = [
    kubernetes_namespace.cicd,
    module.infrastructure.endpoint,
  ]
}

resource "helm_release" "external-secrets-repo" {
  name       = "external-secrets"
  repository = "https://charts.external-secrets.io"
  chart      = "external-secrets"
  version    = "0.9.13"
  namespace  = "cicd"
  atomic     = true

  values = [
    file("../../helm/templates/general/external-secrets_values.yaml")
  ]
  depends_on = [
    kubernetes_namespace.cicd,
    module.infrastructure.endpoint,
    kubernetes_secret.google-application-credentials-ci,
  ]
}
