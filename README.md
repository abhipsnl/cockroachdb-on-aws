<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]


<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/sharmajee1/cockroachdb-on-aws.git">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Cockroachdb on AWS</h3>

  <p align="center">
    Details instractions, on how to setup CockroachDB on AWS ( EC2 )
    <br />
    <a href="https://github.com/sharmajee1/cockroachdb-on-aws.git"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/sharmajee1/cockroachdb-on-aws.git">View Demo</a>
    ·
    <a href="https://github.com/sharmajee1/cockroachdb-on-aws.git/issues">Report Bug</a>
    ·
    <a href="https://github.com/sharmajee1/cockroachdb-on-aws.git/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#scope-of-work">Scope of Work</a></li>
        <li><a href="#overview">Overview</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#general-setup">General setup</a></li>
      </ul>
    </li>
    <li><a href="#setup-s3-backend">Setup S3 backend</a></li>
    <li><a href="#generate-ssh-keys-for-cockroachdb">Generate ssh keys for cockroachDB</a></li>
    <li><a href="#setup-cockroachdb-on-aws">Setup cockroachDB on AWS</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This artifact will help you to deploy Cockroachdb on AWS ( EC2 ).

### Scope of Work
* This is not production ready
* bastion host will be hosted on public subnet and cockroachdb instance will be hosted on private subnet.
* Loadbalancer to route requests to all the nodes on port 26257
* In this terraform project , cockroachdb service is not being deployed as a systemd


### Overview
* Setup S3 backend for terraform state. [details](https://github.com/sharmajee1/cockroachdb-on-aws/tree/main/terraform-s3-backend)
* Generate ssh-keygen for Cockroachdb instances. [details](https://github.com/sharmajee1/cockroachdb-on-aws/blob/main/scripts/create-ssh-keygn.sh)
* Setup Cockroachdb on AWS EC2. [details](https://github.com/sharmajee1/cockroachdb-on-aws/tree/main/deploy-cockroachdb-om-aws-ec2)
* terraform modules for this assignment. [details](https://github.com/sharmajee1/cockroachdb-on-aws/tree/main/terraform-modules)


<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites
`AWS Account` An active AWS account.

`aws cli ( >= 2.1.28)` aws cli need to be installed. [Need help ?](https://aws.amazon.com/cli/).

`terraform (>= v0.14.7)`  terraform cli need to be installed. [Need help ?](https://www.terraform.io/downloads.html)

`Github code for this assignment` [here](https://github.com/sharmajee1/cockroachdb-on-aws.git)

### General setup
```sh
git clone https://github.com/sharmajee1/cockroachdb-on-aws.git
cd cockroachdb-on-aws
```


## Setup S3 backend
```diff
! Skip this step only if you already have S3 backend setup
```

if above steps are done, please perform below steps.
```sh
cd terraform-s3-backend
```

```diff
! setup your default variables `👉` variables.tf under terraform-s3-backend
! [Readme.md](https://github.com/sharmajee1/cockroachdb-on-aws/tree/main/terraform-s3-backend)
```

```sh
# Once above steps are done, please perform below commands
terraform init
terraform plan -out=your_plan_name.tfplan
terraform apply "your_plan_name.tfplan"
```
```diff
! Copy `state_bucket_arn` URL from above output, this will be required for `Setup cockroachDB on AWS` step.
```

```sh
#example
state_bucket_arn = "arn:aws:s3:::abhishek-temp-terraform-backend"
```

## Generate ssh keys for cockroachDB
*Skip this step only if you already ssh keys ready for this setup*
```sh
# From base dir go inside scripts
cd scripts
bash create-ssh-keygn.sh
```

```sh
Above script will create ./ssh and ssh-keys, please see below example.
scripts/ssh
├── cockroachdb-node
└── cockroachdb-node.pub
```

## Setup cockroachDB on AWS
foo

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact
`Author` abhishek sharma [profile](https://github.com/sharmajee1)
`Project Link` [https://github.com/sharmajee1/cockroachdb-on-aws.git](https://github.com/sharmajee1/cockroachdb-on-aws.git)


<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [https://www.cockroachlabs.com/docs/stable/deploy-cockroachdb-on-aws.html](https://www.cockroachlabs.com/docs/stable/deploy-cockroachdb-on-aws.html)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/sharmajee1/cockroachdb-on-aws/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
[forks-url]: https://github.com/sharmajee1/cockroachdb-on-aws/network/members
[product-screenshot]: images/screenshot.png

