provider "aws" {
  region = var.region

}

locals {
  common_tags = var.tags
}

module "vpc" {
  source         = "../modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  tags           = var.tags # Utilizar tags = merge(var.tags, var.tags_vpc) em caso de adição de tags específicas
}

module "subnets" {
  source                     = "../modules/subnets"
  vpc_id                     = module.vpc.vpc_id
  tags                       = var.tags
  private_subnet_names       = var.private_subnet_names
  public_subnet_names        = var.public_subnet_names
  subnet_cidr_blocks_private = var.subnet_cidr_blocks_private
  subnet_cidr_blocks_public  = var.subnet_cidr_blocks_public
  availability_zones         = var.availability_zones
}

module "internet-gtw" {
  source = "../modules/internet-gtw"
  vpc_id = module.vpc.vpc_id
  tags   = var.tags

}

module "security_group" {
  source          = "../modules/security-group"
  vpc_id          = module.vpc.vpc_id
  security_groups = var.security_groups
  tags            = var.tags

}

module "elastic-ip" {
  source = "../modules/elastic-ip"
  eips   = var.eips
  tags   = var.tags
}

module "nat-gtw" {
  source           = "../modules/nat-gtw"
  allocation_id    = module.elastic-ip.allocation_ids["nat_gateway"]
  public_subnet_id = module.subnets.public_subnet_ids[0]
  depends_on       = [module.internet-gtw]
  tags             = var.tags
}