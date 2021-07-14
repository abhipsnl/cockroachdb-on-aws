## Setup S3 bucket for terraform

Prerequisite
-------------
`AWS account` An active AWS account.

`terraform` terraform cli has to be installed.

`aws cli along with aws configure setup` before running the terraform we need to setup aws configure.


Variables
----------
`region` name of the region where backend has to be setup. e.g us-east-1

`prefix` bitbucket prefix name, so the final s3 bucket name will be `prefix-terraform-backend`

`algorithm` bitcucket encryption algorithm, be default AES256

`profile_name` provide the aws configure profile name to authenticateto AWS.

Example
---------
```sh
terraform init
terraform plan -out=your_plan_name.tfplan
terraform apply "your_plan_name.tfplan"
```

Output
-------
`dynamo_lock_table` Dynamodb table that stores the terraform lock state.

`iam_roles` IAM roles to be assumed by the backend.

`state_bucket_arn` S3 bucket that stored the terraform state.

Terraform modules for S3 backend
---------------------------------
[Full modules can be find here](https://github.com/sharmajee1/cockroachdb-on-aws/tree/main/terraform-modules/s3-backend)

Author
-------
Abhishek Sharma [profile](https://github.com/sharmajee1)
