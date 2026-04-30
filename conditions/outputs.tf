output "public_ip" {
  value       = aws_instance.terraform.private_ip
}
