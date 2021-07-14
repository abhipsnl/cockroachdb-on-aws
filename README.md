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
        <li><a href="#prerequisite">Prerequisite</a></li>
        <li><a href="#sow">Scope of Work</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This artifact will help you to deploy Cockroachdb on AWS ( EC2 ).

###Scope of work
-------------
* This is not production ready
* bastion host will be hosted on public subnet and cockroachdb instance will be hosted on private subnet.
* Loadbalancer to route requests to all the nodes on port 26257
* In this terraform project , cockroachdb service is not being deployed as a systemd


### Prerequisite

`AWS Account` An active AWS account.

`aws cli ( >= 2.1.28)` aws cli need to be installed. [Need help ?](https://aws.amazon.com/cli/).

`terraform (>= v0.14.7)`  terraform cli need to be installed. [Need help ?](https://www.terraform.io/downloads.html)

`Github code for this assignment` [here](https://github.com/sharmajee1/cockroachdb-on-aws.git)


<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* npm
  ```sh
  npm install npm@latest -g
  ```

### Installation

1. Get a free API Key at [https://example.com](https://example.com)
2. Clone the repo
   ```sh
   git clone https://github.com/your_username_/Project-Name.git
   ```
3. Install NPM packages
   ```sh
   npm install
   ```
4. Enter your API in `config.js`
   ```JS
   const API_KEY = 'ENTER YOUR API';
   ```



<!-- USAGE EXAMPLES -->
## Usage

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_



<!-- ROADMAP -->
## Roadmap


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Project Link: [https://github.com/sharmajee1/cockroachdb-on-aws.git](https://github.com/sharmajee1/cockroachdb-on-aws.git)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/sharmajee1/cockroachdb-on-aws/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
[forks-url]: https://github.com/sharmajee1/cockroachdb-on-aws/network/members
[product-screenshot]: images/screenshot.png

