terraform {
    required_version = ">= 0.13.0"

    required_providers {
        proxmox = {
            source  = "telmate/proxmox"
            version = "3.0.2-rc08"
        }
    }
}

variable "pve_host" {
  description = "Proxmox host for API access"
  type        = string
}

variable "pve_token_id" {
  description = "Proxmox API token ID for API access"
  type        = string
}

variable "pve_token_secret" {
  description = "Proxmox API token secret for API access"
  type        = string
  sensitive   = true
}

provider "proxmox" {
    pm_api_url      = "https://${var.pve_host}:8006/api2/json"
    pm_api_token_id = var.pve_token_id
    pm_api_token_secret = var.pve_token_secret
}