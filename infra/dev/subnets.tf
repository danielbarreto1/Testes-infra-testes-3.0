module "subnets" {
  source = "../modules/subnets"
  vpc_id = module.vpc.vpc_id
  tags   = var.tags

  private_subnet_names = [
    "teste-subnet-private1-us-east-1a",
    "teste-subnet-private2-us-east-1b"
  ]

  public_subnet_names = [
    "teste-subnet-public1-us-east-1a",
    "teste-subnet-public2-us-east-1b"
  ]

  // Cidr Blocks subnets
  subnet_cidr_blocks_private = [
    "10.37.12.0/22",
    "10.37.16.0/22"
  ]

  subnet_cidr_blocks_public = [
    "10.37.0.0/22",
    "10.37.4.0/22"
  ]
  availability_zones = var.availability_zones

}



