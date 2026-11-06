removed {
  from = module.vm

  lifecycle {
    destroy = false
  }
}

removed {
  from = module.webapp

  lifecycle {
    destroy = false
  }
}
