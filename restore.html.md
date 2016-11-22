---
title: Restore CloudBees Jenkins Platform on Pivotal Cloud Foundry
owner: London Services
---

Restore guide
=============
This page contains a step-by-step guide you can apply to restore a Jenkins configuration that you backed up by following the corresponding [back up guide](backup.html). You can apply this to CloudBees Jenkins Operations Center instances or to CloudBees Jenkins Enterprise instances.

1. Log in to a host with access to the BOSH Director.
2. Make sure the current `bosh deployment` targets the correct tile. Otherwise, look for the most recent manifest under `/var/tempest/workspaces/default/deployments` and `bosh deployment /var/tempest/workspaces/default/deployments/p-jenkins-xxxx.xml`.
3. Run `bosh vms` and look for the job index you want to apply the restore to:
  * For CJOC, look for `jenkins-oc-xxx/0`, where `xxx` is a generated hash.
  * For CJE, look for  `jenkins_master-xxx/n` where `xxx` is a generated hash and `n` is an integer.
  We refer to this as JOB_INDEX in next steps.
4. Provided your backup file is named `p-jenkins-backup.zip`, and you are currently in the directory containing this backup, run `bosh scp $JOB_INDEX --upload p-jenkins-backup.zip /tmp`.
5. Run `bosh ssh` and select the job named `JOB_INDEX`.
6. Run `sudo su` to switch to root user.
7. Stop the Jenkins service:
  * For CJOC, run `monit stop jenkins-oc`.
  * For CJE, run `monit stop jenkins_master`.
8. (Optional) Run the following command to backup the previous storage:
  * For CJOC, run `mv /var/vcap/store/jenkins-oc /var/vcap/store/jenkins-oc.old`.
  * For CJE, run `mv /var/vcap/store/jenkins_master /var/vcap/store/jenkins_master.old`.
9. Run `mkdir -p /var/vcap/store`.
10. Run `cd /var/vcap/store`.
11. Run `unzip -X /tmp/p-jenkins-backup.zip -d .`.
12. Start the Jenkins service using one of the following commands:
  * For CJOC, run `monit start jenkins-oc`.
  * For CJE, run `monit start jenkins_master`.
13. Check the status of the Jenkins instance by browsing to it. You should see the data you have just restored.

Clean-up
========
Once you have applied the previous steps successfully, clean up the temporary files you have created.

On the root on the VM that you worked on, run the following commands:

1. `rm -rf /var/vcap/store.backup`
2. `rm /tmp/p-jenkins-backup.zip`
