resource "kubernetes_deployment" "hystrix_dashboard_app" {
  metadata {
    name = "hystrix-dashboard-app"

    labels = {
      app = "hystrix-dashboard-app"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "hystrix-dashboard-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "hystrix-dashboard-app"
        }
      }

      spec {
        container {
          name  = "hystrix-dashboard-app"
          image = "faissalelfid/hystrix-dashboard:0.0.1"

          port {
            container_port = 9295
          }

          image_pull_policy = "Always"
        }
      }
    }
  }
}

resource "kubernetes_service" "hystrix_dashboard_svc" {
  metadata {
    name = "hystrix-dashboard-svc"
  }

  spec {
    port {
      port        = 80
      target_port = "9295"
    }

    selector = {
      app = "hystrix-dashboard-app"
    }

    type = "NodePort"
  }
}

