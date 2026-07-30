variable "pve_user" {
  description = "Proxmox user for API access"
  type        = string
}
variable "pve_password" {
  description = "Proxmox password for API access"
  type        = string
  sensitive   = true
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