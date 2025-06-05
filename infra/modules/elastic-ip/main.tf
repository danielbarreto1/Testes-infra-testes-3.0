resource "aws_eip" "eips_iddev" {
  for_each = {
    for k, v in var.eips : k => v if v.allocation_id == null
  }

  tags = merge(
    var.tags, 
    { Name = "eip-${each.key}" }, 
    each.value.tags       
  )
}