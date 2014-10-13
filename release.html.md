---
title: CloudBees Jenkins Enterprise for Pivotal CF
---

Release notes for CloudBees Jenkins Enterprise for Pivotal CF

### 1.3.2

Features included in this release:

* Updated stemcell addresses bash-shellshock vulnerabilities: resolves CVEs discussed [here](http://www.pivotal.io/security/CVE-2014-6271) and [here](http://www.pivotal.io/security/CVE-2014-7186)
* Integration with Cloud Foundry UAA for Single Sign On (SSO) support
* Use of the same buildpacks as runtime to ensure consistency
* Automatic provisioning of services instances for your tests
* Ability to deploy to PCF using the CLI 
* Automatic master and slave configuration
* Support for Gradle wrapper and Maven

#### Upgrading from 1.3.0.0.alpha.107
If you installed the beta release 1.3.0.0.alpha.107 you can upgrade to 1.3.2 following these steps:

1. In Ops Manager click on the `CloudBees Jenkins for Pivotal CF` tile
2. Click on `Resource Config` on the left hand menu
3. Change the `Jenkins Slave` - `Ephemeral Disk` size to be a minimum of `8192`
4. Press `Save`
