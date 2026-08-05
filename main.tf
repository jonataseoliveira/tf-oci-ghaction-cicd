terraform {
  cloud {
    organization = "jonataseo"

    workspaces {
      name = "gtactions"
    }
  }
  required_providers {
    oci = {
      source = "oracle/oci"
    }
  }
}

provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  user_ocid    = var.user_ocid
  fingerprint  = var.fingerprint
  private_key  = var.private_key
  region       = var.region
}

resource "oci_core_vcn" "internal" {
  dns_label      = "internal"
  cidr_block     = "172.16.0.0/20"
  compartment_id = "ocid1.compartment.oc1..aaaaaaaapglqvmmiolkvjwlhynctweqpjw5jl2hovgctqfcagke7zadoimda"
  display_name   = "internal_vcn"
}

resource "oci_core_subnet" "dev-2" {
  vcn_id                     = oci_core_vcn.internal.id
  cidr_block                 = "172.16.3.0/24"
  compartment_id             = "ocid1.compartment.oc1..aaaaaaaapglqvmmiolkvjwlhynctweqpjw5jl2hovgctqfcagke7zadoimda"
  display_name               = "Dev subnet 2"
  prohibit_public_ip_on_vnic = true
  dns_label                  = "dev"
}

resource "oci_core_subnet" "staging" {
  vcn_id                     = oci_core_vcn.internal.id
  cidr_block                 = "172.16.1.0/24"
  compartment_id             = "ocid1.compartment.oc1..aaaaaaaapglqvmmiolkvjwlhynctweqpjw5jl2hovgctqfcagke7zadoimda"
  display_name               = "Dev subnet 5"
  prohibit_public_ip_on_vnic = true
  dns_label                  = "staging"
}