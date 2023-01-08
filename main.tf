terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.25.2"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "web-1" {
  image = "ubuntu-22-10-x64"
  name = "web-1"
  region = "ams3"
  size = "s-1vcpu-512mb-10gb"
}

resource "digitalocean_droplet" "web-2" {
  image = "ubuntu-22-10-x64"
  name = "web-2"
  region = "ams3"
  size = "s-1vcpu-512mb-10gb"
}

resource "digitalocean_loadbalancer" "loadbalancer-1" {
  name = "loadbalancer-1"
  region = "ams3"

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 5000
    target_protocol = "http"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = [
    digitalocean_droplet.web-1.id,
    digitalocean_droplet.web-2.id
    ]
}
