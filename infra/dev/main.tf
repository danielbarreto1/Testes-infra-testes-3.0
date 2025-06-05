provider "aws" {
  region = var.region

}

locals {
  common_tags = var.tags
}