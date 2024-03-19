resource "kubernetes_namespace" "dev" {
  metadata {
    annotations = {
      name = "dev"
    }

    labels = {
      mylabel = "dev"
    }

    name = "dev"
  }
  lifecycle {
    ignore_changes = [
      metadata,
    ]
  }
  depends_on = [
    module.infrastructure
  ]
}

resource "kubernetes_namespace" "stage" {
  metadata {
    annotations = {
      name = "stage"
    }

    labels = {
      mylabel = "stage"
    }

    name = "stage"
  }
  lifecycle {
    ignore_changes = [
      metadata,
    ]
  }
  depends_on = [
    module.infrastructure
  ]
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    annotations = {
      name = "monitoring"
    }

    labels = {
      mylabel = "monitoring"
    }

    name = "monitoring"
  }
  lifecycle {
    ignore_changes = [
      metadata,
    ]
  }
  depends_on = [
    module.infrastructure
  ]
}

resource "kubernetes_namespace" "cicd" {
  metadata {
    annotations = {
      name = "cicd"
    }

    labels = {
      mylabel = "cicd"
    }

    name = "cicd"
  }
  lifecycle {
    ignore_changes = [
      metadata,
    ]
  }
  depends_on = [
    module.infrastructure
  ]
}

resource "kubernetes_namespace" "cert-manager" {
  metadata {
    annotations = {
      name = "cert-manager"
    }

    labels = {
      mylabel = "cert-manager"
    }

    name = "cert-manager"
  }
  lifecycle {
    ignore_changes = [
      metadata,
    ]
  }
  depends_on = [
    module.infrastructure
  ]
}

resource "kubernetes_namespace" "nginx" {
  metadata {
    annotations = {
      name = "nginx"
    }

    labels = {
      mylabel = "nginx"
    }

    name = "nginx"
  }
  lifecycle {
    ignore_changes = [
      metadata,
    ]
  }
  depends_on = [
    module.infrastructure
  ]
}

resource "google_service_account_key" "sa_key" {
  service_account_id = var.service_account
}

resource "kubernetes_secret" "google-application-credentials-ci" {
  metadata {
    name = "gcp-creds"
    namespace = "cicd"
  }
  data = {
    "credentials.json" = base64decode(google_service_account_key.sa_key.private_key)
  }
  depends_on = [
    module.infrastructure,
    kubernetes_namespace.cicd
  ]
}
