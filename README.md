Cockroachdb on AWS
====================

Description
-------------
This artifact will help you to deploy Cockroachdb on AWS ( EC2 ).


prerequisite
--------------
`AWS Account` An active AWS account.

`aws cli ( >= 2.1.28)` aws cli need to be installed. [Need help ?](https://aws.amazon.com/cli/).

`terraform (>= v0.14.7)`  terraform cli need to be installed. [Need help ?](https://www.terraform.io/downloads.html)


Fully automated
-----------------



Manual execution
-----------------



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



Infrastructure as a Code
--------------------------
`ansible-playbook infrastructure-as-a-code/github-watchdog-playbook.yml`

Author
------
Abhishek Sharma ( github sharmajee1)

