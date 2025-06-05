# variable "vpc_id" {
#   type = string
# }

# variable "public_subnet_ids" {
#   type = list(string)
# }

# variable "private_subnet_ids" {
#   type = list(string)
# }

# variable "internet_gateway_id" {
#   type = string
# }

# variable "nat_gateway_id" {
#   type = string
# }

# variable "private_route_table_names" {
#   type = list(string)
# }

# variable "routes_rtb_private1" {
#   type = list(string)
# }

# variable "routes_rtb_private2" {
#   type = list(string)
# }

# variable "destination_cidr_block" {
#   type    = string
#   default = "0.0.0.0/0"
# }

# variable "tags" {
#   type    = map(string)
#   default = {}
# }

#####

variable "vpc_id" {
  type = string
}

variable "route_table_names" {
  type = list(string)
}

variable "subnet_route_table_map" {
  description = "Mapeamento de subnets para route tables"
  type        = map(string)
}

variable "routes" {
  description = "Rotas customizadas"
  type = list(object({
    route_table_name       = string
    destination_cidr_block = string
    gateway_type           = string
    gateway_id             = string
  }))
}

variable "tags" {
  type = map(string)
}
