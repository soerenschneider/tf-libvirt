init:
	pre-commit install
	terraform init

plan-vserver-dd:
	terraform workspace select vserver-dd && terraform plan -var-file envs/vserver-dd.tfvars

apply-vserver-dd: init
	terraform workspace select vserver-dd && terraform apply -var-file envs/vserver-dd.tfvars

apply-auto-vserver-dd: init
	terraform workspace select vserver-dd && terraform apply -auto-approve -var-file envs/vserver-dd.tfvars

destroy-vserver-dd:
	terraform workspace select vserver-dd && terraform destroy -var-file envs/vserver-dd.tfvars

plan-vserver-pt:
	terraform workspace select vserver-pt && terraform plan -var-file envs/vserver-pt.tfvars

apply-vserver-pt: init
	terraform workspace select vserver-pt && terraform apply -var-file envs/vserver-pt.tfvars

apply-auto-vserver-pt: init
	terraform workspace select vserver-pt && terraform apply -auto-approve -var-file envs/vserver-pt.tfvars

destroy-vserver-pt:
	terraform workspace select vserver-pt && terraform destroy -var-file envs/vserver-pt.tfvars

plan-vserver-ez:
	terraform workspace select vserver-ez && terraform plan -var-file envs/vserver-ez.tfvars

apply-vserver-ez: init
	terraform workspace select vserver-ez && terraform apply -var-file envs/vserver-ez.tfvars

apply-auto-vserver-ez: init
	terraform workspace select vserver-ez && terraform apply -auto-approve -var-file envs/vserver-ez.tfvars

destroy-vserver-ez:
	terraform workspace select vserver-ez && terraform destroy -var-file envs/vserver-ez.tfvars

plan-nuc-dd:
	terraform workspace select nuc-dd && terraform plan -var-file envs/nuc-dd.tfvars

apply-auto-nuc-dd: init
	terraform workspace select nuc-dd && terraform apply -auto-approve -var-file envs/nuc-dd.tfvars

apply-nuc-dd: init
	terraform workspace select nuc-dd && terraform apply -var-file envs/nuc-dd.tfvars

destroy-nuc-dd:
	terraform workspace select nuc-dd && terraform destroy -var-file envs/nuc-dd.tfvars

plan-nuc-pt:
	terraform workspace select nuc-pt && terraform plan -var-file envs/nuc-pt.tfvars

apply-nuc-pt: init
	terraform workspace select nuc-pt && terraform apply -var-file envs/nuc-pt.tfvars

apply-auto-nuc-pt: init
	terraform workspace select nuc-pt && terraform apply -auto-approve -var-file envs/nuc-pt.tfvars

destroy-nuc-pt:
	terraform workspace select nuc-pt && terraform destroy -var-file envs/nuc-pt.tfvars

output: init
	terraform output
