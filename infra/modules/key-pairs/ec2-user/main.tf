resource "aws_key_pair" "main" {
  key_name        = var.key_name
  public_key      = tls_private_key.main.public_key_openssh

  tags            = var.tags

}

resource "tls_private_key" "main" {
  algorithm = var.private_key_algorithm
  rsa_bits  = var.private_key_rsa_bits
}