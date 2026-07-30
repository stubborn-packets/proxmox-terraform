terraform {
    required_version = ">= 0.13.0"

    required_providers {
        proxmox = {
            source  = "telmate/proxmox"
            version = ">=3.0.2"
        }
    }
}
provider "proxmox" {
    pm_api_url      = "https://${var.pve_host}:8006/api2/json"
    pm_api_token_id = var.pve_token_id
    pm_api_token_secret = var.pve_token_secret
}