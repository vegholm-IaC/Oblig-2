tjeneste = "ordre"
runtime  = "vm"
prefix   = "10.10.0.0/24"

ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGMQ32gu8mGVI86gkUex5JsBeg7WC58bsUOVuxmeHDJW oblig2-ingen-privat-nokkel"

inbound_rules = {
  allow-8067 = {
    priority = 110
    port     = "8067"
    source   = "172.16.111.0/24"
  }
}
