variable "allocation_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "tags_nat" {
  type    = map(string)
  default = {}
}

variable "name" {
  type    = string
  default = null
}
