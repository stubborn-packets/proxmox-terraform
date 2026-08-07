# create lab-dns-srv1 container from Ubuntu 24 template
resource "proxmox_virtual_environment_container" "lab_dns_srv1" {
    description = "Technitium DNS server - managed by Terraform"
    node_name = "pve"
    vm_id = 901
    tags = ["dns", "technitium", "terraform"]

    unprivileged = true

    features {
        nesting = true # useful if Docker is needed later
    }

    started = true
    start_on_boot = true

    cpu {
        cores = 1
    }

    memory {
        dedicated = 1024
        swap = 1024
    }

    disk {
        datastore_id = "local-lvm"
        size = "8"
    }

    network_interface {
        name = "eth0"
        bridge = "vmbr0"
        vlan_id = 99
    }

    initialization {
        hostname = "lab-dns-srv1"

        ip_config {
            ipv4 {
                address = "172.16.99.5/24"
                gateway = "172.16.99.1"
            }
        }
        dns {
            domain = "lab.stubbornpackets.com"
            servers = ["172.16.99.1"]
        }
        user_account {
            keys = [trimspace(file("~/.ssh/id_ed25519_lab.pub"))]
        }
    }

    operating_system {
        template_file_id = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
        type = "ubuntu"
    }
    
}

output "container_id" {
    value = proxmox_virtual_environment_container.lab_dns_srv1.vm_id
}
output "ip_address" {
    value = proxmox_virtual_environment_container.lab_dns_srv1.initialization[0].ip_config[0].ipv4[0].address
}
output "hostname" {
    value = proxmox_virtual_environment_container.lab_dns_srv1.initialization[0].hostname
}