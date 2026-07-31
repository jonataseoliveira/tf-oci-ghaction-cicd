variable "tenancy_ocid" {
  description = "OCID do tenancy OCI"
  type        = string
}

variable "user_ocid" {
  description = "OCID do usuário OCI (dono da API key)"
  type        = string
}

variable "fingerprint" {
  description = "Fingerprint da API key"
  type        = string
}

variable "private_key" {
  description = "Conteúdo da private key da API key (PEM)"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "Região OCI"
  type        = string
  default     = "sa-saopaulo-1"
}

variable "compartment_id" {
  description = "OCID do compartment onde os recursos serão criados"
  type        = string
  default     = "ocid1.compartment.oc1..aaaaaaaapglqvmmiolkvjwlhynctweqpjw5jl2hovgctqfcagke7zadoimda"
}