resource "kubernetes_config_map" "eureka_cm" {
  metadata {
    name = "eureka-cm"
  }

  data = {
    eureka_service_address = "http://eureka-0.eureka:8761/eureka"
  }
}

resource "kubernetes_service" "eureka" {
  metadata {
    name = "eureka"

    labels = {
      app = "eureka"
    }
  }

  spec {
    port {
      name = "eureka"
      port = 8761
    }

    selector = {
      app = "eureka"
    }

    cluster_ip = "None"
  }
}

resource "kubernetes_stateful_set" "eureka" {
  metadata {
    name = "eureka"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "eureka"
      }
    }

    template {
      metadata {
        labels = {
          app = "eureka"
        }
      }

      spec {
        container {
          name  = "eureka"
          image = "faissalelfid/service-registry:0.0.1"

          port {
            container_port = 8761
          }

          env {
            name = "EUREKA_SERVER_ADDRESS"

            value_from {
              config_map_key_ref {
                name = "eureka-cm"
                key  = "eureka_service_address"
              }
            }
          }
        }
      }
    }

    service_name = "eureka"
  }
}

resource "kubernetes_service" "eureka_lb" {
  metadata {
    name = "eureka-lb"

    labels = {
      app = "eureka"
    }
  }

  spec {
    port {
      port        = 80
      target_port = "8761"
    }

    selector = {
      app = "eureka"
    }

    type = "NodePort"
  }
}

