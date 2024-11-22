variable "key_name" {}

variable "private_key_algorithm" {}

variable "private_key_rsa_bits" {
  type = number
}

variable "tags" {
  type = map(string)
}