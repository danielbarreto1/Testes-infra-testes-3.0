vpc_cidr_block     = "10.37.0.0/18"
availability_zones = ["us-east-1a", "us-east-1b"]
region             = "us-east-1"

tags = {
  Owner       = "infra"
  Domain      = "jddev"
  Environment = "dev"
  Provisioning-method   = "terraform"
}

tags_vpc = {
  CostCenter = "12345"
}

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

// Eips 

eips = {
  nat_gateway = {
    allocation_id = null
    tags = {
      Name       = "eip-nat"
      CostCenter = "1234"
    }
  }
}


// Nat-gtw

