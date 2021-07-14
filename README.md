Cockroachdb on AWS
====================

Description
-------------
This artifact will help you to deploy Cockroachdb on AWS ( EC2 ).

<br />
prerequisite
--------------
`AWS Account` An active AWS account.

`aws cli ( >= 2.1.28)` aws cli need to be installed. [Need help ?](https://aws.amazon.com/cli/).

`terraform (>= v0.14.7)`  terraform cli need to be installed. [Need help ?](https://www.terraform.io/downloads.html)

`Github code for this assignment ` [here](https://github.com/sharmajee1/cockroachdb-on-aws.git)

<br />
Overview
-----------
* Setup S3 backend for terraform state. [details](https://github.com/sharmajee1/cockroachdb-on-aws/tree/main/terraform-s3-backend)
* Generate ssh-keygen for Cockroachdb instances. [details](https://github.com/sharmajee1/cockroachdb-on-aws/blob/main/scripts/create-ssh-keygn.sh)
* Setup Cockroachdb on AWS EC2. [details](https://github.com/sharmajee1/cockroachdb-on-aws/tree/main/deploy-cockroachdb-om-aws-ec2)
* terraform modules for this assignment. [details](https://github.com/sharmajee1/cockroachdb-on-aws/tree/main/terraform-modules)


<br />
Fully automated
-----------------


<br />
Manual execution
-----------------


<br />
Example
---------
1) git clone https://github.com/sharmajee1/assignment-embibe.git

2) Modify config/github_watchdog.conf based on your need.

2) cd assignment-embibe && ./monolithic-way.sh

3) service github-watchdog status 


Docker Way
-----------
`NOTE` Docker should be install and running for this testing.

./docker-build-run.sh


<br />
Infrastructure as a Code
--------------------------
`ansible-playbook infrastructure-as-a-code/github-watchdog-playbook.yml`

Author
------
Abhishek Sharma ( github sharmajee1)

