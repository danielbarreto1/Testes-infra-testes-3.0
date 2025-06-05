module "vpc" {
  source         = "../modules/vpc"
  vpc_cidr_block = "10.37.0.0/18"
  tags           = var.tags # Utilizar tags = merge(var.tags, var.tags_vpc) em caso de adição de tags específicas
}

