output "key_name" {
  value = aws_key_pair.main.key_name
}

output "key_arn" {
    value = aws_key_pair.main.arn
}

output "public_key" {
  value = tls_private_key.main.public_key_pem
}

output "private_key" {
  value = tls_private_key.main.private_key_pem
  sensitive = true
}