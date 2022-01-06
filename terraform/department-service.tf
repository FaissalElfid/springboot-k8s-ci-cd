resource "kubernetes_deployment" "department_service_app" {
  metadata {
    name = "department-service-app"

    labels = {
      app = "department-service-app"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "department-service-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "department-service-app"
        }
      }

      spec {
        container {
          name  = "department-service-app"
          image = "faissalelfid/department-service:0.0.1"

          port {
            container_port = 9001
          }

          image_pull_policy = "Always"
        }
      }
    }
  }
}

resource "kubernetes_service" "department_service_svc" {
  metadata {
    name = "department-service-svc"
  }

  spec {
    port {
      port        = 80
      target_port = "9001"
    }

    selector = {
      app = "department-service-app"
    }
  }
}

