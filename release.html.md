---
title: CloudBees Jenkins Platform for Pivotal Cloud Foundry&reg;
owner: London Services
---

Release notes for CloudBees Jenkins Platform for [Pivotal Cloud Foundry&reg;](https://network.pivotal.io/products/pivotal-cf) (PCF).

### 15.11.02.02: March 4th 2016
* Update stemcell to 3146.9
  * [USN-2861-1](http://www.ubuntu.com/usn/usn-2861-1/)
  * [USN-2865-1](http://www.ubuntu.com/usn/usn-2865-1/)
  * [USN-2868-1](http://www.ubuntu.com/usn/usn-2868-1/)
  * [USN-2869-1](http://www.ubuntu.com/usn/usn-2869-1/)
  * [USN-2871-1](http://www.ubuntu.com/usn/usn-2871-1/)
  * [USN-2896-1](http://www.ubuntu.com/usn/usn-2896-1/)
  * [USN-2897-1](http://www.ubuntu.com/usn/usn-2897-1/)
  * [USN-2900-1](http://www.ubuntu.com/usn/usn-2900-1/)
  * [USN-2910-1](http://www.ubuntu.com/usn/usn-2910-1/)
* Update CloudBees Jenkins Operations Center to 1.625.16.1. See [full release notes](http://release-notes.cloudbees.com/product/CloudBees+Jenkins+Operations+Center)
* Update CloudBees Jenkins Enterprise to 1.642.2.1. See [full release notes](http://release-notes.cloudbees.com/product/CloudBees+Jenkins+Enterprise)
* Hardened https frontend settings by disabling weak ciphers.

### 15.11.02.01: January 13th 2016
* Update stemcell to 3146.2
   * [USN-2857-1](http://www.ubuntu.com/usn/usn-2857-1/)
* The tile has been renamed to CloudBees Jenkins Platform. It now includes both CloudBees Jenkins Enterprise and CloudBees Jenkins Operations Center in a single deployment.
* Update CloudFoundry CLI to 6.14.1

### 15.11.01.02: December 14th 2015
* Update stemcell to 3146
   * [USN-2821-1](http://www.ubuntu.com/usn/usn-2821-1/)
* Update CloudBees Jenkins Enterprise to 1.625.3.1. This security release fixes [several vulnerabilities](https://wiki.jenkins-ci.org/display/SECURITY/Jenkins+Security+Advisory+2015-12-09).

### 15.11.01.01: November 27th 2015
* Update stemcell to 3140
* Update Cloudbees Jenkins Enterprise to 15.11 (Jenkins 1.625.2.2). See [full release notes](http://release-notes.cloudbees.com/product/CloudBees+Jenkins+Enterprise).
* Update CloudFoundry CLI to 6.14.0
* Update versions of bundled plugins
* Bundle Gitlab plugin
* Fixed warning about jnlp port already in use.

### 15.05.01.11: November 12th 2015
* Update stemcell to 3130 which fixes the following vulnerabilities
   * [USN-2806-1](http://www.ubuntu.com/usn/usn-2806-1/)
   * [USN-2798-1](http://www.ubuntu.com/usn/usn-2798-1/)
* Update CloudBees Jenkins Enterprise to 1.609.14.1. This security release fixes [several vulnerabilities](https://www.cloudbees.com/jenkins-security-advisory-2015-11-11), including two critical ones.
   * [SECURITY-184] Secret key not verified when connecting a slave
   * [SECURITY-218] The infamous apache commons [de-serialisation vulnerability](https://blogs.apache.org/foundation/entry/apache_commons_statement_to_widespread).
* Update HAProxy to 1.5.15.
* Disable SSLv3 support by default.
* CloudFoundry UAA plugin now supports CLI.

### 15.05.01.09: 20th October 2015

* Update stemcell to 3100.
* Fixed edge case upgrade scenarios.
* Improve supportability of the Pivotal package.

### 15.05.01.08: 9th October 2015

Note one important known issue with the 1.5.6 patch for OpenStack deployments. BOSH stemcell v3094, which this version of Elastic Runtime references, has a limitation affecting OpenStack users only:

Elastic Runtime 1.5.6 on OpenStack does not work with S3/Swift blobstores.
Elastic Runtime 1.5.6 on OpenStack users must configure their object storage to use the internal blobstore option.
vSphere, AWS and vCloud users are not affected.
This will be fixed in the next release.

* Update stemcell to version 3094
* Fix an issue related to jnlp agent listener.

### 15.05.01.07: 2nd October 2015

* Upgrade CloudBees Jenkins Enterprise to version 1.609.3.1.
* Minor enhancements of the setup of slaves for Docker plugins.
* Resolve minor security vulnerabilities upgrading the stemcell to version 3074.
* Upgrade Docker to version 1.8.2.

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

Note that the specific version of the stemcell has to be uploaded and installed in Ops Manager, along with the installation of CloudBees Jenkins Enterprise for Pivotal Cloud Foundry&reg; 15.05.01.00.

### 15.05.01.00: 22nd July 2015

CloudBees Jenkins Enterprise for Pivotal Cloud Foundry&reg; 15.05.01.00 fixes the security issues
[CVE-2015-1420](http://pivotal.io/security/cve-2015-1420), [CVE-2015-1330](https://pivotal.io/security/cve-2015-1330) and [USN-2639-1](https://pivotal.io/security/usn-2639-1) thanks to the upgrade to the Bosh Stemcell 3012.

Note that the specific version of the stemcell has to be uploaded and installed in Ops Manager, along with the installation of CloudBees Jenkins Enterprise for Pivotal Cloud Foundry&reg; 15.05.01.00.

In addition, the new product version bundles the latest version of CloudBees Jenkins Enterprise [15.05 / 1.609.1.1](http://release-notes.cloudbees.com/release/CloudBees+Jenkins+Enterprise/1.609.1.1).

Summary of features included in this release:

* Upgrade of CloudBees Jenkins Enterprise to v15.05
* Upgrade of Bosh Stemcell from 2989 to 3012

**Known limitation:** the `test_service_instances` feature to use Cloud Foundry services bindings in builds has been temporarily disabled. We are working on reintroducing it.


### 14.11.01.03: 19th June 2015

CloudBees Jenkins Enterprise for Pivotal Cloud Foundry&reg; 14.11.01.03 includes a patch for
the Cannonical Ubuntu CVE-2015-1328 security fix. This patch resolves an overlayfs privilege
escalation, which a local user could exploit to gain administrative privileges on the system.
Note that a corresponding stemcell for the specific IaaS that Pivotal Cloud Foundry&reg; is running on
(2989) must be uploaded and installed along with this CloudBees Jenkins Enterprise release in Ops Manager.

Major refactoring of the packaging of CloudBees Jenkins Enterprise for Pivotal Cloud Foundry&reg;

* Security
   * Authentication: load CF Organizations as Jenkins groups in the Cloud Foundry UAA Authentication plugin
   * Change the default authorization model to use [CloudBees RBAC](https://www.cloudbees.com/products/jenkins-enterprise/plugins/role-based-access-control-plugin). By default, the created jobs are isolated by Cloud Foundry Organizations or by user.
* Tools
   * Upgrade the bundled JDK to OpenJDK 8 to match Pivotal Elastic Runtime 1.4 environment
   * Bump Cloud Foundry CLI version to 6.11
* Plugins
   * Bundle the [Cloud Foundry CLI plugin](http://documentation.cloudbees.com/docs/cje-user-guide/cloudfoundry-cli.html) to ease integration of Jenkins jobs with Pivotal Elastic Runtime
   * Bundle the [Jenkins Artifactory](https://wiki.jenkins-ci.org/display/JENKINS/Artifactory+Plugin)
* Configuration
   * Refactor Jenkins auto-configuration procedure to rely on Groovy init scripts
   * Better ability during platform upgrades to merge user defined configuration with configuration provided by the deployments on Pivotal Cloud Foundry&reg; (JVM, slaves, tool installations...)

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

1. In Ops Manager, click the `CloudBees Jenkins for Pivotal Cloud Foundry&reg;` tile.
2. Click `Resource Config` on the left hand menu.
3. Change the `Jenkins Slave` - `Ephemeral Disk` size to be a minimum of `8192`.
4. Click `Save`.
