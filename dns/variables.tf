variable "pve_host" {
  description = "Proxmox host for API access"
  type        = string
}

variable "pve_api_token" {
  description = "Full Proxmox API token (user@realm!tokenid=secret)"
  type        = string
  sensitive   = true
}