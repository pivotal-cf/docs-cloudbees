---
title: Jenkins Enterprise by CloudBees for Pivotal CF
---

Release notes for Jenkins Enterprise by CloudBees for Pivotal CF

### 1.3.6
**Release Date: 25th February 2015**

Features included in this release:

* Updated Jenkins Enterprise by CloudBees to [14.11 / 1.580](http://release-notes.cloudbees.com/release/Jenkins+Enterprise/1.580.1.1)

### 1.3.5
**Release Date: 30th January 2015**

Features included in this release:

* Updated stemcell to 2824 to resolve [CVE-2015-0235 Ghost](http://www.pivotal.io/security/cve-2015-0235)

### 1.3.4
**Release Date: 17th December 2014**

Features included in this release:

* Updated version of Ruby to resolve CVE-2014-8080

### 1.3.3
**Release Date: 21st November 2014**

Features included in this release:

* Bug fix for `/tmp` space errors on `slave nodes`

### 1.3.2
**Release Date: 13th October 2014**

Features included in this release:

* Updated stemcell addresses bash-shellshock vulnerabilities: resolves CVEs discussed [here](http://www.pivotal.io/security/CVE-2014-6271) and [here](http://www.pivotal.io/security/CVE-2014-7186)
* Integration with Cloud Foundry UAA for Single Sign On (SSO) support
* Use of the same buildpacks as runtime to ensure consistency
* Automatic provisioning of services instances for your tests
* Ability to deploy to PCF using the CLI
* Automatic master and slave configuration
* Support for Gradle wrapper and Maven

#### Upgrading from 1.3.0.0.alpha.107
If you installed the beta release 1.3.0.0.alpha.107, you can upgrade to 1.3.2 following these steps:

1. In Ops Manager, click the `CloudBees Jenkins for Pivotal CF` tile.
2. Click `Resource Config` on the left hand menu.
3. Change the `Jenkins Slave` - `Ephemeral Disk` size to be a minimum of `8192`.
4. Click `Save`.
