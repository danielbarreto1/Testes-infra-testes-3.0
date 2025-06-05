resource "aws_vpc" "vpc_teste" {
 cidr_block = var.vpc_cidr_block
 tags = merge(
  var.tags,
  { Name = "vpc-${var.tags["Domain"]}" }
)

}
