init:
	terraform init

plan-nuc:
	terraform workspace select nuc && terraform plan -var-file nuc-dd.tfvars

apply-nuc: init
	terraform workspace select nuc && terraform apply -var-file nuc-dd.tfvars

destroy-nuc:
	terraform workspace select nuc && terraform destroy -var-file nuc-dd.tfvars

output: init
	terraform output
