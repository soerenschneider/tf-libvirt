generate "backend" {
  path      = "tf_backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "s3" {
    bucket  = "soerenschneider-terraform"
    key     = "${replace(basename(get_repo_root()), "/^tf-/", "")}-${path_relative_to_include()}/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
EOF
}
