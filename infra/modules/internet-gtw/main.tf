resource "aws_internet_gateway" "igw_teste" {
  vpc_id = var.vpc_id
  tags = merge(
  var.tags,
  { Name = "igw-${var.tags["Domain"]}" }
)
}