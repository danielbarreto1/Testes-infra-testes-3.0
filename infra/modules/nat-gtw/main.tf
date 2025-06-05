resource "aws_nat_gateway" "nat_gtw_teste" {
  allocation_id = var.allocation_id
  subnet_id     = var.public_subnet_id

  tags = merge(
    var.tags,
    var.tags_nat,
    { Name = "nat-gtw-${var.tags["Domain"]}" }
  )
}
