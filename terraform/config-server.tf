resource "kubernetes_deployment" "cloud_config_server_app" {
  metadata {
    name = "cloud-config-server-app"

    labels = {
      app = "cloud-config-server-app"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "cloud-config-server-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "cloud-config-server-app"
        }
      }

      spec {
        container {
          name  = "cloud-config-server-app"
          image = "faissalelfid/cloud-config-server:0.0.1"

          port {
            container_port = 9296
          }

          image_pull_policy = "Always"
        }
      }
    }
  }
}

resource "kubernetes_service" "cloud_config_server_svc" {
  metadata {
    name = "cloud-config-server-svc"
  }

  spec {
    port {
      port        = 80
      target_port = "9296"
    }

    selector = {
      app = "cloud-config-server-app"
    }
  }
}

