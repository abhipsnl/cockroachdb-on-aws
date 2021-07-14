Cockroachdb on AWS
====================

Description
-------------
This artifact will help you to deploy Cockroachdb on AWS ( EC2 ).

Scope of work
-------------
* This is not production ready
* bastion host will be hosted on public subnet and cockroachdb instance will be hosted on private subnet.
* Loadbalancer to route requests to all the nodes on port 26257
* In this terraform project , cockroachdb service is not being deployed as a systemd

prerequisite
--------------
`AWS Account` An active AWS account.

`aws cli ( >= 2.1.28)` aws cli need to be installed. [Need help ?](https://aws.amazon.com/cli/).

`terraform (>= v0.14.7)`  terraform cli need to be installed. [Need help ?](https://www.terraform.io/downloads.html)

`Github code for this assignment` [here](https://github.com/sharmajee1/cockroachdb-on-aws.git)

Overview
-----------
* Setup S3 backend for terraform state. [details](https://github.com/sharmajee1/cockroachdb-on-aws/tree/main/terraform-s3-backend)
* Generate ssh-keygen for Cockroachdb instances. [details](https://github.com/sharmajee1/cockroachdb-on-aws/blob/main/scripts/create-ssh-keygn.sh)
* Setup Cockroachdb on AWS EC2. [details](https://github.com/sharmajee1/cockroachdb-on-aws/tree/main/deploy-cockroachdb-om-aws-ec2)
* terraform modules for this assignment. [details](https://github.com/sharmajee1/cockroachdb-on-aws/tree/main/terraform-modules)


General setup
--------------
```sh
git clone https://github.com/sharmajee1/cockroachdb-on-aws.git
cd cockroachdb-on-aws
```

Automated 
-----------------
if above steps are done, please perform below steps.
```sh
cd terraform-s3-backend
```
setup your default variables 👉 [Readme.md](https://github.com/sharmajee1/cockroachdb-on-aws/tree/main/terraform-s3-backend)
```sh
# Once above steps are done, please perform below commands
terraform init
terraform plan -out=your_plan_name.tfplan
terraform apply "your_plan_name.tfplan"
```

Manual execution
-----------------


Author
------
Abhishek Sharma ( github sharmajee1)

