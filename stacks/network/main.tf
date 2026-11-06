removed {
  from = module.subnet

  lifecycle {
    destroy = false
  }
}
