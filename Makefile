SHELL := /bin/bash -o pipefail

export WORKSPACE ?= terraform/

.PHONY: terraform/linter
terraform/linter:
	cd ${WORKSPACE} && tflint --init
	cd ${WORKSPACE} && tflint -f compact

.PHONY: terraform/init
terraform/init:
	cd ${WORKSPACE} && terraform init
	cd ${WORKSPACE} && terraform get

.PHONY: terraform/plan
terraform/plan:
	cd ${WORKSPACE} && terraform fmt -recursive -check -diff
	cd ${WORKSPACE} && terraform init
	cd ${WORKSPACE} && terraform get
	cd ${WORKSPACE} && terraform validate -no-color
	cd ${WORKSPACE} && terraform plan -no-color

.PHONY: terraform/apply
terraform/apply:
	cd ${WORKSPACE} && terraform init
	cd ${WORKSPACE} && terraform get
	cd ${WORKSPACE} && terraform apply -auto-approve

.PHONY: terraform/clean
terraform/clean:
	rm -rf ${WORKSPACE}.terraform
	rm -rf ${WORKSPACE}.*/*/.terraform
	# rm -rf ${WORKSPACE}.terraform.lock.hcl