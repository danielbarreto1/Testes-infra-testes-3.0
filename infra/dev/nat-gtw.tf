module "nat-gtw" {
  source           = "../modules/nat-gtw"
  allocation_id    = module.elastic-ip.allocation_ids["nat_gateway"]
  public_subnet_id = module.subnets.public_subnet_ids[0]
  depends_on       = [module.internet-gtw]
  tags             = var.tags
}

