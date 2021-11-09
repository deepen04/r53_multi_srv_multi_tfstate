output "private_dns" {
  #value       = "$(aws_instance.web.*.private_dns)"
  value = "${compact(concat(coalescelist(aws_instance.web.*.private_dns, list(""))))}"
}
