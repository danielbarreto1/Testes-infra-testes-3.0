output "route_table_ids" {
  value = {
    for k, v in aws_route_table.rt : k => v.id
  }
}
