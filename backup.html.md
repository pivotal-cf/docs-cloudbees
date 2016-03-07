---
title: Backup CloudBees Jenkins Platform on Pivotal Cloud Foundry&reg;
owner: London Services
---

This page contains a step-by-step guide you can apply to backup your current Jenkins configuration. It can be applied to CloudBees Jenkins Operations Center instances or to CloudBees Jenkins Enterprise instances.

1. Log in to a host with access to your BOSH installation.
2. Make sure the current `bosh deployment` targets the correct tile. Otherwise, look for the most recent manifest under `/var/tempest/workspaces/default/deployments` and `bosh deployment /var/tempest/workspaces/default/deployments/p-jenkins-xxxx.xml`.
3. Use `bosh ssh` to connect to the VM running the Jenkins instance you wish to backup.
  * For CJOC, connect to `jenkins-oc-xxx/0`
  * For CJE, connect to `jenkins_master-xxx/n`
  We refer to this job name as `JOB_INDEX` in next steps.
4. Run `sudo su` to switch to root user.
5. Run `cd /var/vcap/store`
6. Run `zip -y -r -0 /tmp/p-jenkins-store.zip *`
7. Run `exit`
8. Run `bosh scp $JOB_INDEX --download /tmp/p-jenkins-backup.zip .`
  A file named `p-jenkins-backup.zip.jenkins-oc.0` (or similar, depending on the job name) will be created in the current directory.

