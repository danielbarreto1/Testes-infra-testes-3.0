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

variable "mapPublicIP" {
  default = false
}

