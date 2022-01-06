resource "kubernetes_deployment" "user_service_app" {
  metadata {
    name = "user-service-app"

    labels = {
      app = "user-service-app"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "user-service-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "user-service-app"
        }
      }

      spec {
        container {
          name  = "user-service-app"
          image = "faissalelfid/user-service:0.0.1"

          port {
            container_port = 9002
          }

          image_pull_policy = "Always"
        }
      }
    }
  }
}

resource "kubernetes_service" "user_service_svc" {
  metadata {
    name = "user-service-svc"
  }

  spec {
    port {
      port        = 80
      target_port = "9002"
    }

    selector = {
      app = "user-service-app"
    }
  }
}

