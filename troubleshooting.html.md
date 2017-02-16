---
title: Troubleshooting Guide for CloudBees Jenkins Platform on Pivotal Cloud Foundry
owner: London Services
---

<style>
    .note.warning {
        background-color: #fdd;
        border-color: #fbb
    }

    .note.warning:before {
        color: #f99;
     }
</style>

<p class="note warning"><strong>WARNING</strong>: CloudBees Jenkins Platform for PCF is deprecated, and no further development will be made against this tile.</p>

This topic contains troubleshooting information for CloudBees Jenkins Platform on Pivotal Cloud Foundry (PCF).

##<a id='ssh'></a>Step 1: SSH into the VM

To troubleshoot CloudBees Jenkins Platform on PCF, SSH into its VMs by performing the following steps:

1. SSH into a host with access to your BOSH installation. Usually, this is the Ops Manager VM. To SSH into Ops Manager, perform the procedures in the [SSH into Ops Manager](https://docs.pivotal.io/pivotalcf/customizing/trouble-advanced.html#ssh) section of the <em>Advanced Troubleshooting with the BOSH CLI</em> topic.
1. Perform the procedures in the [Log into BOSH](https://docs.pivotal.io/pivotalcf/1-8/customizing/trouble-advanced.html#log-in) section of the <em>Advanced Troubleshooting with the BOSH CLI</em> topic to target and log in to the BOSH Director from the host with access to BOSH. 

1. Set the BOSH deployment to the current CloudBees Jenkins Platform tile: 

	<pre class="terminal">
	$ bosh deployment /var/tempest/workspaces/default/deployments/$(bosh deployments | grep p-jenkins | cut -f 2 -d "|" | xargs).yml
	</pre>

1. List the VMs managed by the CloudBees Jenkins Platform tile:
	<pre class="terminal">
	$ bosh ssh
	</pre>
	This command lists the following VMs:
	 * `jenkins_slave/0`
	 * `jenkins_master/0`
	 * `jenkins_shared_slave/0`
	 * `jenkins-oc/0`
1. Enter the number of the VM you want to troubleshoot.
1. From the VM, switch to root user:
	<pre class="terminal">$ sudo su</pre>

##<a id='troubleshoot'></a>Step 2: Perform Troubleshooting Procedures

Consult the following list for the locations of critical files on the VMs managed by the Cloudbees Jenkins Platform tile:

* Jenkins storage: `/var/vcap/store`
* Logs: `/var/vcap/sys/log/`
* JDK installation: `/var/vcap/packages/openjdk-8`
* Utilities, including `jstack` and `jstat`: `/bin/`

You can use `monit` to troubleshoot with the following commands:

* Check services status: `monit status`
* Restart a service: `monit restart YOUR-SERVICE`