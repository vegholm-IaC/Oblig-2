data "azurerm_subscription" "current" {}

locals {
  rg_id = "${data.azurerm_subscription.current.id}/resourceGroups/${local.rg_navn}"
}

import {
  to = azurerm_resource_group.this
  id = local.rg_id
}

import {
  to = module.vnet.azurerm_virtual_network.this
  id = "${local.rg_id}/providers/Microsoft.Network/virtualNetworks/${local.vnet_navn}"
}
