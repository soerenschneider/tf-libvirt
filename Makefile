init:
	terraform init

plan-vserver-dd:
	terraform workspace select vserver-dd && terraform plan -var-file vserver-dd.tfvars

apply-vserver-dd: init
	terraform workspace select vserver-dd && terraform apply -auto-approve -var-file vserver-dd.tfvars

destroy-vserver-dd:
	terraform workspace select vserver-dd && terraform destroy -var-file vserver-dd.tfvars

plan-nuc:
	terraform workspace select nuc && terraform plan -var-file nuc-dd.tfvars

apply-nuc: init
	terraform workspace select nuc && terraform apply -var-file nuc-dd.tfvars

destroy-nuc:
	terraform workspace select nuc && terraform destroy -var-file nuc-dd.tfvars

output: init
	terraform output
