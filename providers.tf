
terraform {
  required_version = ">= 0.14"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "~> 0.6.3"
    }
  }

  backend "s3" {
    bucket               = "soerenschneider-terraform"
    key                  = "libvirt"
    workspace_key_prefix = "libvirt"
    region               = "us-east-1"
  }
}

provider "libvirt" {
  uri = var.provider_uri
}
