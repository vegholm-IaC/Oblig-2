locals {
  rg_id     = local.net.resource_group_id
  subnet_id = "${local.net.vnet_id}/subnets/snet-${var.tjeneste}"
  nsg_id    = "${local.rg_id}/providers/Microsoft.Network/networkSecurityGroups/nsg-${var.tjeneste}"
  er_vm     = var.runtime == "vm" ? toset([var.tjeneste]) : toset([])
  er_webapp = var.runtime == "webapp" ? toset([var.tjeneste]) : toset([])
}

import {
  to = module.subnet.azurerm_subnet.this
  id = local.subnet_id
}

import {
  to = module.subnet.azurerm_network_security_group.this
  id = local.nsg_id
}

import {
  to = module.subnet.azurerm_network_security_rule.http
  id = "${local.nsg_id}/securityRules/allow-http"
}

import {
  to = module.subnet.azurerm_subnet_network_security_group_association.this
  id = local.subnet_id
}

import {
  to = module.storage.azurerm_storage_account.this
  id = "${local.rg_id}/providers/Microsoft.Storage/storageAccounts/st${var.kortnavn}${var.tjeneste}${var.miljo}"
}

import {
  to = module.keyvault.azurerm_key_vault.this
  id = "${local.rg_id}/providers/Microsoft.KeyVault/vaults/kv-${var.kortnavn}-${var.tjeneste}-${var.miljo}"
}

import {
  for_each = local.er_vm
  to       = module.vm[0].azurerm_public_ip.this
  id       = "${local.rg_id}/providers/Microsoft.Network/publicIPAddresses/pip-${each.key}"
}

import {
  for_each = local.er_vm
  to       = module.vm[0].azurerm_network_interface.this
  id       = "${local.rg_id}/providers/Microsoft.Network/networkInterfaces/nic-${each.key}"
}

import {
  for_each = local.er_vm
  to       = module.vm[0].azurerm_linux_virtual_machine.this
  id       = "${local.rg_id}/providers/Microsoft.Compute/virtualMachines/vm-${each.key}"
}

import {
  for_each = local.er_webapp
  to       = module.webapp[0].azurerm_service_plan.this
  id       = "${local.rg_id}/providers/Microsoft.Web/serverFarms/asp-${each.key}"
}

import {
  for_each = local.er_webapp
  to       = module.webapp[0].azurerm_linux_web_app.this
  id       = "${local.rg_id}/providers/Microsoft.Web/sites/app-${var.kortnavn}-${each.key}-${var.miljo}"
}
