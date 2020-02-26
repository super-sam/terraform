
# Passing Variables to terraform
There are few ways to pass the variables in terraform:
- **via variable**: We can directly assign variable while running the _terraform command_
	> ``` terraform console -var region=us-east-1```
- **via file** : We can  assign variable while running the _terraform command_ by passing the reference to the file
	> ``` terraform console -var-file am-dev/terraform.tfvars```

## **Variable Definition Precedence**
**Terraform loads variables in the following order, with later sources taking precedence over earlier ones:**
-   Environment variables
-   The terraform.tfvars file, if present.
-   The terraform.tfvars.json file, if present.
-   Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
-   Any -var and -var-file options on the command line, in the order they are provided. (This includes variables set by a Terraform Cloud workspace.)
