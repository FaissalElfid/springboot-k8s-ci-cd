resource "kubernetes_deployment" "cloud_gateway_app" {
  metadata {
    name = "cloud-gateway-app"

    labels = {
      app = "cloud-gateway-app"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "cloud-gateway-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "cloud-gateway-app"
        }
      }

      spec {
        container {
          name  = "cloud-gateway-app"
          image = "faissalelfid/cloud-gateway:0.0.1"

          port {
            container_port = 9191
          }

          image_pull_policy = "Always"
        }
      }
    }
  }
}

resource "kubernetes_service" "cloud_gateway_svc" {
  metadata {
    name = "cloud-gateway-svc"
  }

  spec {
    port {
      protocol    = "TCP"
      port        = 80
      target_port = "9191"
    }

    selector = {
      app = "cloud-gateway-app"
    }

    type = "LoadBalancer"
  }
}

