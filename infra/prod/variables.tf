variable "vpc_cidr_block" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "tags_vpc" {
  type    = map(string)
  default = {}
}

variable "region" {
  type = string
}

variable "availability_zones" {
  description = "Lista de zonas de disponibilidades usadas nos recursos."
  type        = list(string)
}

// Module Subnet 

// Public subnet

variable "mapPublicIP" {
  default = false
}

# variable "public_subnet_id" {
#   type = string
# }

variable "public_subnet_names" {
  description = "Map para subrede pública."
  type        = list(string)
}

variable "subnet_cidr_blocks_public" {
  description = "Lista de CIDR blocks para as subnets públicas."
  type        = list(string)
}

// Private subnet

# variable "private_subnet_id" {
#   type = string
# }

variable "private_subnet_names" {
  description = "Map para subrede privada."
  type        = list(string)
}

variable "subnet_cidr_blocks_private" {
  description = "Lista de CIDR blocks para as subnets privadas."
  type        = list(string)
}

// Module Security Group

variable "security_groups" {
  description = "Mapa de Security Groups a serem criados"
  type = map(object({
    description = string
    tags        = optional(map(string), {})
    ingress_rules = list(object({
      from_port                  = number
      to_port                    = number
      protocol                   = string
      cidr_blocks                = optional(list(string))
      source_security_group_name = optional(string)
      ipv6_cidr_blocks           = optional(list(string))
      prefix_list_ids            = optional(list(string))
      self                       = optional(bool)
      description                = optional(string)
    }))
    egress_rules = list(object({
      from_port                  = number
      to_port                    = number
      protocol                   = string
      cidr_blocks                = optional(list(string))
      source_security_group_name = optional(string)
      ipv6_cidr_blocks           = optional(list(string))
      prefix_list_ids            = optional(list(string))
      self                       = optional(bool)
      description                = optional(string)
    }))
  }))
}


// EIps

variable "eips" {
  type = map(object({
    allocation_id = optional(string)
    tags          = optional(map(string), {})
  }))
  default = {}
}
