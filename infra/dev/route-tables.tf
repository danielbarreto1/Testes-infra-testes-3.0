# module "route_tables" {
#   source = "../modules/route-tables"

#   vpc_id                 = module.vpc.vpc_id
#   public_subnet_ids      = module.subnets.public_subnet_ids
#   private_subnet_ids     = module.subnets.private_subnet_ids
#   internet_gateway_id    = module.internet-gtw.igw_id
#   nat_gateway_id         = module.nat-gtw.nat_gateway_id

#   private_route_table_names = var.private_route_table_names
#   routes_rtb_private1       = var.routes_rtb_private1
#   routes_rtb_private2       = var.routes_rtb_private2

#   destination_cidr_block = "0.0.0.0/0"
#   tags                   = var.tags
# }

# // Route-tables

# private_route_table_names = [
#   "iddev-rtb-private1-us-east-1a",
#   "iddev-rtb-private2-us-east-1b",
#   "iddev-rtb-private4-us-east-1a",
#   "iddev-rtb-private5-us-east-1b",
#   "iddev-rtb-private6-us-east-1c"
# ]

# routes_rtb_private1 = [
#   "10.0.0.0/16"
# ]

# routes_rtb_private2 = [
#   "192.168.0.0/16"
# ]

#######

module "route_tables" {
  source = "../modules/route-tables"

  vpc_id             = module.vpc.vpc_id
  route_table_names  = [
    "rtb-public",
    "rtb-private1",
    "rtb-private2"
  ]

  subnet_route_table_map = {
    "subnet-1-id" = "rtb-public"
    "subnet-2-id" = "rtb-private1"
    "subnet-3-id" = "rtb-private2"
  }

  routes = [
    {
      route_table_name       = "rtb-public"
      destination_cidr_block = "0.0.0.0/0"
      gateway_type           = "igw"
      gateway_id             = module.internet-gtw.igw_id
    },
    {
      route_table_name       = "rtb-private1"
      destination_cidr_block = "0.0.0.0/0"
      gateway_type           = "nat"
      gateway_id             = module.nat-gtw.nat_gateway_id
    },
    {
      route_table_name       = "rtb-private2"
      destination_cidr_block = "192.168.0.0/16"
      gateway_type           = "peering"
      gateway_id             = "pcx-abc123"
    }
  ]

  tags = var.tags
}
