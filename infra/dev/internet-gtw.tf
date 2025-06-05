module "internet-gtw" {
  source = "../modules/internet-gtw"
  vpc_id = module.vpc.vpc_id
  tags   = var.tags

}

