# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket  = "soerenschneider-terraform"
    key     = "libvirt-vserver-2.dd.soeren.cloud/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
