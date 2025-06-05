availability_zones = ["us-east-1a", "us-east-1b"]
region             = "us-east-1"

tags = {
  Owner               = "infra"
  Domain              = "iddev"
  Environment         = "dev"
  Provisioning-method = "terraform"
}

tags_vpc = {
  CostCenter = "12345"
}
