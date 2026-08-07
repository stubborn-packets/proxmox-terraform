terraform {
    required_version = ">= 1.5.0"

    required_providers {
        proxmox = {
            source  = "bpg/proxmox"
            version = "~> 0.111"
        }
    }
}

provider "proxmox" {
    endpoint = "https://${var.pve_host}:8006/api2/json"
    api_token = var.pve_api_token
    insecure = false

    ssh {
      agent = true
      username = "root"
    }
}