---
title: Troubleshooting guide for CloudBees Jenkins Platform on Pivotal Cloud Foundry
owner: London Services
---

Troubleshooting guide
=====================

How to get ssh access to the instances
--------------------------------------
1. Log in to a host with access to your BOSH installation. Usually this will be the machine from where _Ops Manager_ is running.
* Make sure you target the right _Ops Manager_ using `bosh target`.
* You may need to log in using `bosh login`. The credentials can be retrieved from Ops Manager, in the _Ops Manager Director_ tile. The entry is named _Uaa Admin User Credentials_.
* Set the bosh deployment to the current CJP tile: `bosh deployment /var/tempest/workspaces/default/deployments/$(bosh deployments | grep p-jenkins | cut -f 2 -d "|" | xargs).yml`
* Use `bosh ssh`. The list of virtual machines managed by the tile is displayed.
 1. jenkins_slave/0
 * jenkins_master/0
 * jenkins_shared_slave/0
 * jenkins-oc/0
* Select the one you are interested to troubleshoot.
* Switch to root user using `sudo su`.
  
Where is everything?
--------------------
* Jenkins storage is in `/var/vcap/store`
* Logs are in `/var/vcap/sys/log/`
* JDK installation is in `/var/vcap/packages/openjdk-8`
 * Utilities such as `jstack`, `jstat` are under the bin/ subdirectory.

How to...
---------
* Check services status: `monit status`
* Restart a service: `monit restart <service>`