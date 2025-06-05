// Eips 

locals {
  eips = {
    nat_gateway = {
      allocation_id = null
      tags = {
        Name       = "eip-nat"
        CostCenter = "1234"
      }
    }
  }
}

module "elastic-ip" {
  source = "../modules/elastic-ip"
  eips   = local.eips
  tags   = var.tags
}



