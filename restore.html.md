---
title: Restore CloudBees Jenkins Platform on Pivotal CloudFoundry
owner: London Services
---

Restore guide
=============
This page contains a step-by-step guide you can apply to restore a Jenkins configuration you backed up by following the corresponding [backup guide](backup.html). It can be applied to CloudBees Jenkins Operations Center instances or to CloudBees Jenkins Enterprise instances.

* Log in to a host with access to the Bosh Director.
* Make sure the current `bosh deployment` targets the correct tile. Otherwise, look for the most recent manifest under `/var/tempest/workspaces/default/deployments` and `bosh deployment /var/tempest/workspaces/default/deployments/p-jenkins-xxxx.xml`
* `bosh vms` and look for the job index you want to apply the restore to
 * For CJOC it is named like jenkins-oc-xxx/0 where xxx is a generated hash.
 * For CJE it is named like jenkins_master-xxx/n where xxx is a generated hash and n is an integer.
* This will be referred as JOB_INDEX in next steps.
* Provided your backup file is named `p-jenkins-backup.zip` you are currently in the directory containing this backup, `bosh scp $JOB_INDEX --upload p-jenkins-backup.zip /tmp`
* `bosh ssh` and select the job named $JOB_INDEX
* `sudo su` to switch to root user
* Stop the Jenkins service
  * For CJOC, use `monit stop jenkins-oc`
  * For CJE, use `monit stop jenkins_master`
* (optional) Backup the previous storage : `mv /var/vcap/store /var/vcap/store.old`
* `mkdir -p /var/vcap/store`
* `cd /var/vcap/store`
* `unzip -X /tmp/p-jenkins-backup.zip -d .`
* Start the Jenkins service
 * For CJOC, use `monit start jenkins-oc`
 * For CJE, use `monit start jenkins_master`
* Check the status of the Jenkins instance by browsing it. You should see the data you have just restored.

Clean-up
========
Once you have applied the previous steps successfully, don't forget to clean up the temporary files you have created.
* Being root on the vm you have worked on,
 * `rm -rf /var/vcap/store.backup` 
 * `rm /tmp/p-jenkins-backup.zip`
