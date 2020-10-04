fmt:
	terraform fmt
	terraform fmt domain-cloudinit

init:
	terraform init

plan: init
	terraform plan

apply: init
	terraform apply

destroy:
	terraform destroy

output: init
	terraform output
