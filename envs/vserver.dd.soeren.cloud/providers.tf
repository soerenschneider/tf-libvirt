terraform {
  required_version = ">= 1.0"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.7.6"
    }
  }

  backend "s3" {
    bucket = "soerenschneider-terraform"
    key    = "libvirt-prd-vserver.dd.soeren.cloud"
    region = "us-east-1"
  }
}

provider "libvirt" {
  uri = var.provider_uri
}
