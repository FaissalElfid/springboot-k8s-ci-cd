terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
    }
    kubernetes= {
      source = "hashicorp/kubernetes"
    }
  }
}
provider "digitalocean" {
  token = var.token
}

resource "digitalocean_kubernetes_cluster" "mydroplet" {
  name   = "springboot"
  region = "nyc1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.21.5-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = var.node_count
  }
}

provider "kubernetes" {
  version = "1.13.2"

  load_config_file = false
  host  = digitalocean_kubernetes_cluster.mydroplet.endpoint
  token = digitalocean_kubernetes_cluster.mydroplet.kube_config[0].token
  cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.mydroplet.kube_config[0].cluster_ca_certificate
  )
}