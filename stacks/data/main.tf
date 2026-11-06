removed {
  from = module.storage

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.keyvault

  lifecycle {
    destroy = false
  }
}
