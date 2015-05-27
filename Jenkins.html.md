---
title: Jenkins Enterprise by CloudBees for PCF
---

This is the documentation for the Jenkins Enterprise by CloudBees for [Pivotal Cloud Foundry](https://network.pivotal.io/products/pivotal-cf) (PCF).

### Installation on PCF Ops Manager 1.4 for AWS

* Use the AWS Xen-HVM Ubuntu Trusty 2840 stemcell: [light-bosh-stemcell-2840-aws-xen-hvm-ubuntu-trusty-go_agent](https://s3.amazonaws.com/bosh-jenkins-artifacts/bosh-stemcell/aws/light-bosh-stemcell-2840-aws-xen-hvm-ubuntu-trusty-go_agent.tgz).
* In "Settings / Resource Config", increase the Ephemeral Disk of the Compilation jobs to 16384 MB and ensure that the instance type of these Compilation jobs is at least c4.large.

### Features

Key features of the product are:

* Integration with Cloud Foundry UAA for Single Sign On (SSO) support
* Use of the same buildpacks as runtime to ensure consistency
* Automatic provisioning of services instances for your tests
* Ability to deploy to PCF using the CLI
* Automatic master and slave configuration
* Support for Gradle wrapper and Maven

### Install via Pivotal Ops Manager

To install Jenkins Enterprise by CloudBees for PCF, follow the procedure for installing Pivotal Ops Manager tiles:

1. Download the product file from [Pivotal Network](https://network.pivotal.io/).
1. Upload the product file to your Ops Manager installation.
1. Click **Add** next to the uploaded product description in the Ops Manager `Available Products` view to add this product to your staging area.
1. Click the newly added tile to review any configurable options.
1. Click **Apply Changes** to install the service.

### Dependencies
This product requires Pivotal Cloud Foundry:

* Elastic Runtime version 1.3 or greater
* Ops Manager version 1.3 or greater

### Managing Jenkins

#### Licensing

A trial license will be created when the product is installed, which is valid for **30 days**. This needs to be replaced with your enterprise license, which should be acquired directly from CloudBees. You can update the enterprise license in the Jenkins `Manage Jenkins` section when logged in as the UAA Admin user.

The operator's machine that is accessing the Jenkins setup page, requires an internet connection to facilitate obtaining the trial license.

If you are accessing Jenkins from a machine **with** internet access, a trial license will be automatically retrieved on the `Register Jenkins` page.

If you are accessing Jenkins from a machine **without** internet access, you will need provide a valid license. Trial licenses can be obtained from [CloudBees](http://www.cloudbees.com/try-jenkins-enterprise).

Upon a trial license expiring after **30 days**, you will be presented with the `Register Jenkins` page where you can enter your updated license details if you have not already done so ahead of the expiration.

#### Installation Details

Once installed, Jenkins is accessible via `http://pivotal-cloudbees.your-cf-installation.com`.

By default the setup is configured as one Master, with one Slave instance.
This can be incremented in the `Resources` tab within the tile on Ops Manager.

#### Authorization

Cloud Foundry users registered with UAA can log into Jenkins and create jobs, but they cannot edit the details of other users' jobs.

To manage plugins and to access `Manage Jenkins`, log in as the UAA Administrator. The credentials can be obtained from the Elastic Runtime tile in Ops Manager. User access is managed through the UAA.

### Buildpacks and Services

To ensure consistency between your tests and the runtime environment, use the provided commands to execute your builds using the same buildpacks and services as your Cloud Foundry environment.

#### Buildpacks
To use the correct buildpack, add the `. cf_buildpack` command into a shell step.

<p class="note"><strong>Note</strong>: The full stop is required, as builds execute within the `sh` shell.</p>

Currently supported buildpacks are Ruby and NodeJS.

#### Services
This functionality will create an instance of your required service and expose the `VCAP_SERVICES` environment variable to your application and tests.

An export statement is required for each service that you require. Multiple services can be added by separating them with commas.

An export statement takes the format of `service:plan:name`, where `service` and `plan` can be obtained from the `cf marketplace` command and `name` from `cf services`.

For example, `export REQUIRED_SERVICE_INSTANCES="p-redis:development:redis"` should be added into a shell step.

Then specify `. test_service_instances`.

#### Full Example

```
. cf_buildpack
export REQUIRED_SERVICE_INSTANCES="p-redis:development:redis,p-mongodb:development:mongo"
. test_service_instances
rspec
```

### Cloud Foundry CLI
The CF CLI is included via a plugin so that it is available to your Jenkins jobs.
In a shell step you can now use the same `cf` commands that you would directly from your machine, including being able to push an app.

The credentials for Cloud Foundry have to be specified in the shell step in order to connect to the api.

#### Example
A basic example to authenticate and then push the app to your space would be:

```
cf api https://api.your-cf-installation.com # add `--skip-ssl-validation` if needed
cf login -u me -p password -o development -s development
cf push redis-example-app
```

For more details on the CF CLI, please see the [documentation](http://docs.pivotal.io/pivotalcf/devguide/installcf/whats-new-v6.html).

### Jenkins Plugins
As part of the installation, we automatically install the following additional plugins:

1. Cloud Foundry UAA
1. Subversion
1. Syslog Logger
1. Gradle
1. Create Job Advanced

These plugins **cannot** be removed.

There are no restrictions on installing any other plugins, including CloudBees Enterprise plugins and open source.
Any user installed plugins will be persisted after an upgrade or a restore of the VMs by Bosh.

#### Gradle Wrapper
We recommend that you use `Gradle Wrapper` in your application.

When building your application, unless specified otherwise the generated file will be named after your **Jenkins job** and placed into **/build/libs/**

### Environment Architecture

#### Masters
By default we configure one Jenkins Master. You can increase this value in the `Resources` tab in Ops Manager.
If you increase the number of Masters, you can configure them to be stand-by masters in `Configure Jenkins` this will provide high availability in the case of a master going offline, a standby master will assume control and jobs will continue to run.

#### Slaves
By default we configure one Jenkins Slave. You can increase this value in the `Resources` tab in Ops Manager.

The more slaves you add, the more jobs you are able to run concurrently.

You are also able to add in existing slaves from your infrastructure that are outside of PCF.

### Known Limitations

Limitations with the current Jenkins Enterprise by CloudBees for PCF product include:

* Currently supported buildpacks are Ruby and NodeJS
* The operator's machine which is logged into Ops Manager installing the tile requires an internet connection to obtain the trial license
* Test services are provisioned using the `jenkins` user. This requires this user to have access through the security groups to all of the possible test services that app developers will test against.
* Credentials for the CF CLI have to be passed in the shell step

We hope to address all of these limitations in future releases.

### Feedback

Please provide any bugs, feature requests, or questions to [the Pivotal Cloud Foundry Feedback list](mailto:pivotal-cf-feedback@pivotal.io).

### Version

This product is based on Jenkins Enterprise by CloudBees version 1.554.10.1.

### Further Reading

* [Official Jenkins Enterprise by CloudBees Documentation](http://wiki.cloudbees.com/bin/view/Jenkins+Enterprise/WebHome)
* [Jenkins Open Source](http://jenkins-ci.org/)
