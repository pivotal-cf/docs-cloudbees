---
title: CloudBees Jenkins Enterprise for Pivotal Cloud Foundry
---

Release notes for CloudBees Jenkins Enterprise for Pivotal Cloud Foundry

### 15.05.01.05: 10th September 2015

* Fix bug in definition of Docker insecure registries and registry mirrors.
* Resolve security vulnerabilities upgrading the stemcell to version 3062
   * [USN-2694-1](http://www.ubuntu.com/usn/usn-2694-1/) PCRE vulnerabilities
   * [USN-2698-1](http://www.ubuntu.com/usn/usn-2698-1/) SQLite vulnerabilities
   * [USN-2710-1](http://www.ubuntu.com/usn/USN-2710-1) OpenSSH vulnerabilities
   * [USN-2710-2](http://www.ubuntu.com/usn/USN-2710-2) OpenSSH regression
   * [USN-2718-1](http://www.ubuntu.com/usn/USN-2718-1) Linux kernel (Vivid HWE) vulnerability

### 15.05.01.04: 1st September 2015

* Upgrade Docker to version 1.8.1.
* Refactor Jenkins slaves configuration to make it more "Docker friendly" (replace "Slave level environment variables" by a ".bashrc" script invoked by the SSH connector).
* Freeze random Jenkins listen ports to ease security hardening and firewalling:
   * SSH Daemon: 2222
   * JNLP port: 10000
* Resolve security vulnerabilities upgrading the stemcell to version 3058

### 15.05.01.03: 08th August 2015

* Fix Docker container setup on Jenkins slaves: use the ephemeral disk instead of the VM root file system.


### 15.05.01.02: 08th August 2015

* Add support for docker containers on build slaves (integrated with the [CloudBees Docker Custom Build Environment Plugin](https://wiki.jenkins-ci.org/display/JENKINS/CloudBees+Docker+Custom+Build+Environment+Plugin) and the [Jenkins Docker Workflow](https://wiki.jenkins-ci.org/display/JENKINS/CloudBees+Docker+Workflow+Plugin).
* Fix [CVE-2015-3290](https://security-tracker.debian.org/tracker/CVE-2015-3290) upgrading the BOSH stemcell to version 3026.

Note that the specific version of the stemcell has to be uploaded and installed in Ops Manager, along with the installation of CloudBees Jenkins Enterprise for Pivotal Cloud Foundry 15.05.01.00.

### 15.05.01.00: 22nd July 2015

CloudBees Jenkins Enterprise for Pivotal Cloud Foundry 15.05.01.00 fixes the security issues 
[CVE-2015-1420](http://pivotal.io/security/cve-2015-1420), [CVE-2015-1330](https://pivotal.io/security/cve-2015-1330) and [USN-2639-1](https://pivotal.io/security/usn-2639-1) thanks to the upgrade to the Bosh Stemcell 3012.

Note that the specific version of the stemcell has to be uploaded and installed in Ops Manager, along with the installation of CloudBees Jenkins Enterprise for Pivotal Cloud Foundry 15.05.01.00.

In addition, the new product version bundles the latest version of CloudBees Jenkins Enterprise [15.05 / 1.609.1.1](http://release-notes.cloudbees.com/release/CloudBees+Jenkins+Enterprise/1.609.1.1).

Summary of features included in this release:

* Upgrade of CloudBees Jenkins Enterprise to v15.05
* Upgrade of Bosh Stemcell from 2989 to 3012

**Known limitation:** the `test_service_instances` feature to use Cloud Foundry services bindings in builds has been temporarily disabled. We are working on reintroducing it.


### 14.11.01.03: 19th June 2015

CloudBees Jenkins Enterprise for Pivotal Cloud Foundry 14.11.01.03 includes a patch for
the Cannonical Ubuntu CVE-2015-1328 security fix. This patch resolves an overlayfs privilege 
escalation, which a local user could exploit to gain administrative privileges on the system. 
Note that a corresponding stemcell for the specific IaaS that Pivotal Cloud Foundry is running on 
(2989) must be uploaded and installed along with this CloudBees Jenkins Enterprise release in Ops Manager.

Major refactoring of the packaging of CloudBees Jenkins Enterprise for Pivotal Cloud Foundry

* Security
   * Authentication: load CF Organizations as Jenkins groups in the Cloud Foundry UAA Authentiction plugin
   * Change the default authorization model to use [CloudBees RBAC](https://www.cloudbees.com/products/jenkins-enterprise/plugins/role-based-access-control-plugin). By default, the created jobs are isolated by Cloud Foundry Organizations or by user.
* Tools 
   * Upgrade the bundled JDK to OpenJDK 8 to match Pivotal Elastic Runtime 1.4 environment
   * Bump Cloud Foundry CLI version to 6.11
* Plugins
   * Bundle the [Cloud Foundry CLI plugin](http://documentation.cloudbees.com/docs/cje-user-guide/cloudfoundry-cli.html) to ease integration of Jenkins jobs with Pivotal Elastic Runtime
   * Bundle the [Jenkins Artifactory](https://wiki.jenkins-ci.org/display/JENKINS/Artifactory+Plugin)
* Configuration
   * Refactor Jenkins auto-configuration procedure to rely on Groovy init scripts
   * Better ability during platform upgrades to merge user defined configuration with configuration provided by the deployments on Pivotal Cloud Foundry (JVM, slaves, tool installations...)

**Known limitation:** the `test_service_instances` feature to use Cloud Foundry services bindings in builds has been temporarily disabled. We are working on reintroducing it.

### 1.3.8: 1st April 2015

Features included in this release:

* Updated CloudBees Jenkins Enterprise to [14.11 / 1.580.13.1](http://release-notes.cloudbees.com/release/Jenkins+Enterprise/1.580.13.1) to provide security fixes for SECURITY-171, SECURITY-177 and SECURITY-180. See [Jenkins Security Advisory 2015-03-23](https://www.cloudbees.com/jenkins-security-advisory-2015-03-23)

### 1.3.7
**Release Date: 3rd March 2015**

Features included in this release:

* Updated CloudBees Jenkins Enterprise to [14.11 / 1.580.12.2](http://release-notes.cloudbees.com/release/Jenkins+Enterprise/1.580.12.2) to provide security fixes for SECURITY-125, SECURITY-162, SECURITY-163, SECURITY-165, SECURITY-166 and SECURITY-167. See [Jenkins Security Advisory 2015-02-27](https://wiki.jenkins-ci.org/display/SECURITY/Jenkins+Security+Advisory+2015-02-27)

### 1.3.6
**Release Date: 25th February 2015**

Features included in this release:

* Updated CloudBees Jenkins Enterprise to [14.11 / 1.580](http://release-notes.cloudbees.com/release/Jenkins+Enterprise/1.580.1.1)

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

1. In Ops Manager, click the `CloudBees Jenkins for Pivotal Cloud Foundry` tile.
2. Click `Resource Config` on the left hand menu.
3. Change the `Jenkins Slave` - `Ephemeral Disk` size to be a minimum of `8192`.
4. Click `Save`.
