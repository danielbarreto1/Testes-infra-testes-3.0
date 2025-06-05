output "allocation_ids" {
  value = {
    for k, eip in aws_eip.eips_iddev : k => eip.id
  }
}