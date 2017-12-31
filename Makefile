AWS_DEFAULT_REGION:=ap-northeast-1

TERRAFORM=$(shell which terraform)

terraform/plan: .terraform
	$(TERRAFORM) plan

terraform/apply: .terraform
	$(TERRAFORM) apply

terraform/show: .terraform
	$(TERRAFORM) show

terraform/remote_config: .terraform

.terraform:
	$(TERRAFORM) init \
		-backend-config="bucket=chocopie116-tfstate" \
		-backend-config="region=$(AWS_DEFAULT_REGION)" \
		-backend-config="key=chocopie116.tfstate" \
		-backend=true \
		-force-copy \
		-get=true \
		-input=false


clean:
	rm -rf .terraform
