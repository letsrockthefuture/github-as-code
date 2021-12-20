SHELL := /bin/bash

export WORKSPACE ?= terraform/

# fmt:
# 	cd ${WORKSPACE} && terraform fmt -recursive -check -diff

# init:
# 	cd ${WORKSPACE} && terraform init && terraform get

# validate:
# 	cd ${WORKSPACE} && terraform validate -no-color

plan:
	cd ${WORKSPACE} && terraform fmt -recursive -check -diff
	cd ${WORKSPACE} && terraform init
	cd ${WORKSPACE} && terraform validate -no-color
	cd ${WORKSPACE} && terraform plan -no-color

apply:
	cd ${WORKSPACE} && terraform init
	cd ${WORKSPACE} && terraform apply -auto-approve

tflint:
	cd ${WORKSPACE} && tflint --init
	cd ${WORKSPACE} && tflint -f compact