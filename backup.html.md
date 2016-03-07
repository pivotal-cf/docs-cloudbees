---
title: Backup CloudBees Jenkins Platform on Pivotal CloudFoundry
owner: London Services
---

This page contains a step-by-step guide you can apply to backup your current Jenkins configuration. It can be applied to CloudBees Jenkins Operations Center instances or to CloudBees Jenkins Enterprise instances.

* Log in to a host with access to your Bosh installation.
* Make sure the current `bosh deployment` targets the correct tile. Otherwise, look for the most recent manifest under `/var/tempest/workspaces/default/deployments` and `bosh deployment /var/tempest/workspaces/default/deployments/p-jenkins-xxxx.xml`
* Use `bosh ssh` to connect to the vm running the Jenkins instance you wish to backup.
 * For CJOC it is named jenkins-oc-xxx/0
 * For CJE it is named jenkins_master-xxx/n
* We will refer to this job name as JOB_INDEX in next steps.
* `sudo su` to switch to root user.
* `cd /var/vcap/store`
* `zip -y -r -0 /tmp/p-jenkins-store.zip *`
* `exit`
* `bosh scp $JOB_INDEX --download /tmp/p-jenkins-backup.zip .`
* A file named `p-jenkins-backup.zip.jenkins-oc.0` (or similar, depending on the job name) will be created in the current directory.

