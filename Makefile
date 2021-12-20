SHELL := /bin/bash

export WORKSPACE ?= terraform/

init:
	cd ${WORKSPACE} && terraform init
	cd ${WORKSPACE} && terraform get

plan:
	cd ${WORKSPACE} && terraform fmt -recursive -check -diff
	cd ${WORKSPACE} && terraform init
	cd ${WORKSPACE} && terraform get
	cd ${WORKSPACE} && terraform validate -no-color
	cd ${WORKSPACE} && terraform plan -no-color

apply:
	cd ${WORKSPACE} && terraform init
	cd ${WORKSPACE} && terraform get
	cd ${WORKSPACE} && terraform apply -auto-approve

tflint:
	cd ${WORKSPACE} && tflint --init
	cd ${WORKSPACE} && tflint -f compact