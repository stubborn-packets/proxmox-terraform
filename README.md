# Proxmox Terraform

Infrastructure as Code for my Proxmox homelab.

This repository manages LXC containers and VMs on Proxmox using Terraform.  
Each service lives in its own folder so they can be applied independently.

## Structure

```text
proxmox-terraform/
├── dns/                  # Technitium DNS server
├── npm/                  # Nginx Proxy Manager (planned)
├── cml/                  # Cisco Modeling Labs (planned)
├── modules/
│   └── lxc-base/         # Reusable LXC module (future)
├── shared/               # Shared variables / provider config (optional)
├── .gitignore
└── README.md
```
## Prerequisites
- Terraform >= 1.5
- Proxmox VE with an API token
- SSH key authentication set up to the Proxmox host

## Getting Started
1. Clone the repository
2. Copy the example variables file in the service folder you want to work on:
```Bash
cd dns
cp terraform.tfvars.example terraform.tfvars
```
3. Edit `terraform.tfvars` and add your Proxmox API token and Proxmox host details:
```hcl
pve_host = "pve-host.local"
pve_api_token = "user@realm!tokenid=secret"
```
4. Initialize and apply:
```Bash
terraform init
terraform plan
terraform apply
```
## Current Services

| Service | Path   | Status  | Notes                    |
|---------|--------|---------|--------------------------|
| DNS     | `dns/` | Active  | Technitium DNS (LXC 901) |
| NPM     | `npm/` | Planned | Nginx Proxy Manager      |
| CML     | `cml/` | Planned | Cisco Modeling Labs      |

## Security Notes
- Never commit `terraform.tfvars` (it is already in .gitignore)
- Only commit `terraform.tfvars.example`
- API tokens should have the minimum required privileges
- Prefer SSH keys over passwords

## Future Plans
- Move common LXC settings into a reusable module (modules/lxc-base)
- Add Ansible for configuration management
- Integrate with NetBox for IPAM and documentation