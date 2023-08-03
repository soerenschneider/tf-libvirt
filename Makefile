init:
	pre-commit install
	test -d ".terraform" || terraform init

plan-vserver-dd:
	test "$(terraform workspace show)" != "vserver-dd" && terraform workspace select vserver-dd; terraform plan -var-file envs/vserver-dd.tfvars

apply-vserver-dd: init
	test "$(terraform workspace show)" != "vserver-dd" && terraform workspace select vserver-dd; terraform apply -var-file envs/vserver-dd.tfvars

apply-auto-vserver-dd: init
	test "$(terraform workspace show)" != "vserver-dd" && terraform workspace select vserver-dd; terraform apply -auto-approve -var-file envs/vserver-dd.tfvars

destroy-vserver-dd:
	test "$(terraform workspace show)" != "vserver-dd" && terraform workspace select vserver-dd; terraform destroy -var-file envs/vserver-dd.tfvars

apply-nuc-pt:
	test "$(terraform workspace show)" != "nuc-pt" && terraform workspace select nuc-pt; terraform apply -var-file envs/nuc-pt.tfvars

plan-nuc-pt:
	test "$(terraform workspace show)" != "nuc-pt" && terraform workspace select nuc-pt; terraform plan -var-file envs/nuc-pt.tfvars

destroy-nuc-pt:
	test "$(terraform workspace show)" != "nuc-pt" && terraform workspace select nuc-pt; terraform destroy -var-file envs/nuc-pt.tfvars

plan-vserver-pt:
	test "$(terraform workspace show)" != "vserver-pt" && terraform workspace select vserver-pt; terraform plan -var-file envs/vserver-pt.tfvars

apply-vserver-pt: init
	test "$(terraform workspace show)" != "vserver-pt" && terraform workspace select vserver-pt; terraform apply -var-file envs/vserver-pt.tfvars

apply-auto-vserver-pt: init
	test "$(terraform workspace show)" != "vserver-pt" && terraform workspace select vserver-pt; terraform apply -auto-approve -var-file envs/vserver-pt.tfvars

destroy-vserver-pt:
	test "$(terraform workspace show)" != "vserver-pt" && terraform workspace select vserver-pt; terraform destroy -var-file envs/vserver-pt.tfvars

plan-vserver-ez:
	test "$(terraform workspace show)" != "vserver-ez" && terraform workspace select vserver-ez; terraform plan -var-file envs/vserver-ez.tfvars

apply-vserver-ez: init
	test "$(terraform workspace show)" != "vserver-ez" && terraform workspace select vserver-ez; terraform apply -var-file envs/vserver-ez.tfvars

apply-auto-vserver-ez: init
	test "$(terraform workspace show)" != "vserver-ez" && terraform workspace select vserver-ez; terraform apply -auto-approve -var-file envs/vserver-ez.tfvars

destroy-vserver-ez:
	test "$(terraform workspace show)" != "vserver-ez" && terraform workspace select vserver-ez; terraform destroy -var-file envs/vserver-ez.tfvars

apply-nuc-dd:
	test "$(terraform workspace show)" != "nuc-dd" && terraform workspace select nuc-dd; terraform apply -var-file envs/nuc-dd.tfvars

plan-nuc-dd:
	test "$(terraform workspace show)" != "nuc-dd" && terraform workspace select nuc-dd; terraform plan -var-file envs/nuc-dd.tfvars

destroy-nuc-dd:
	test "$(terraform workspace show)" != "nuc-dd" && terraform workspace select nuc-dd; terraform destroy -var-file envs/nuc-dd.tfvars

output: init
	terraform output
