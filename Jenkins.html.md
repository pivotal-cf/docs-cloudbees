---
title: CloudBees Jenkins Enterprise for Pivotal CF
---

This is the documentation for the Cloudbees Jenkins Enterprise for Pivotal CF.

### Features

Key features of the product are:

* Integration with Cloudfoundry UAA for Single Sign On (SSO) support
* Use of the same buildpacks as runtime to ensure consistency
* Automatic provisioning of services instances for your tests
* Ability to deploy to PCF using the CLI 
* Automatic master and slave configuration.
* Support for Gradle wrapper and Maven

### Install via Pivotal Operations Manager

To install Cloudbees Jenkins Enterprise for Pivotal CF, follow the procedure for installing Pivotal Ops Manager tiles:

1. Download the product file from [Pivotal Network](https://network.pivotal.io/).
1. Upload the product file to your Ops Manager installation.
1. Click **Add** next to the uploaded product description in the Available Products view
   to add this product to your staging area.
1. Click the newly added tile to review any configurable options.
1. Click **Apply Changes** to install the service.

This product requires Pivotal CF version 1.3 or greater.

### Licensing

A trial license will be created when the product is installed. This needs to be replaced with your enterprise license, which should be acquired directly from Cloudbees. The enterprise licence can be updated in the `Manage Jenkins` section, whilst logged in as the UAA Admin user. 

The operators machine currently requires an internet connection to facilitate obtaining the trial license. 

If a trial licence cannot be obtained then you will be presented with the default `Register Jenkins` page where you will be able to input licence details, either a trial licence you have obtained yourself or your enterprise licence. 

Upon a trial licence expiring, you will be presented with the `Register Jenkins` page where you can enter your updated licence details if you have not done this ahead of the expiration. 

For an internet-less install, the trial licence can be copied onto the machine via a USB key with the support of CloudBees. 

### Installation Details

Once installed, Jenkins is accessible via http://pivotal-cloudbees.your-cf-installation.com

By default the setup is configured as one Master, with one Slave instance. 
This can be incremented in the `Resources` tab within the tile on OpsManager. 

### Authorization

To manage plugins and access `Manage Jenkins` you need to log in as the UAA Administrator, the credentials can be obtained from the Elastic Runtime tile in OpsManager. 

CloudFoundry users registered with UAA can log into Jenkins and create jobs, but they cannot see the details of other users jobs. 

### Buildpacks and Services

To ensure consistency between your tests and the runtime environment, use the provided commands to execute your builds using the correct buildpacks and services that match the your environment.  

#### Buildpacks
To use the correct buildpack add `. cf_buildpack` command into a shell step.

**Note:** the full stop is required as its a `sh` shell.

Currently supported buildpacks are Ruby, NodeJS, Java

#### Services

An export statement is required for each service that you require, multiple services can be added if separated by commas. 

It takes the format of `service:plan:name` where `service` and `plan` can be obtained from the `cf marketplace` command and `name` from `cf services`.

For example `export REQUIRED_SERVICE_INSTANCES="p-redis:development:redis"` should be added into a shell step.

Then specify `. test_service_instances`

#### Full Example

```
. cf_buildpack
export REQUIRED_SERVICE_INSTANCES="p-redis:development:redis,p-mongodb:development:mongo"
. test_service_instances
rspec
```

### Cloud Foundry CLI
The CF CLI is included via a plugin so that is is available to your Jenkins jobs. 
In a shell step you can now use the same `cf` commands that you would directly from your machine, including being able to push an app. 

The credentials for Cloud Foundry have to be specified in the shell step in order to connect to the api. 

#### Example
A basic example to authenticate and then push the app to your space would be 

```
cf api https://api.your-cf-installation.com --skip-ssl-validation
cf login -u me -p password -o development -s development
cf push redis-example-app
```

For more details on the CF CLI please see the [documentation](http://docs.pivotal.io/pivotalcf/devguide/installcf/whats-new-v6.html)

### Plugins
As part of the installation, we automatically install the following additional plugins:

1. Cloudfoundry UAA
1. Subversion
1. Syslog Logger
1. Gradle
1. Create Job Advanced

These plugins **cannot** be removed. 

There are no restrictions on installing any other plugins, including CloudBees Enterprise plugins and open source. 
Any user installed plugins will be persisted after an upgrade or a restore of the VMs by Bosh. 

### Environment Architecture

#### Masters
By default we configure one Jenkins Masters. You can increase this value in the `Resources` tab in OpsManager.
If you increase the number of Masters, you can configure them to be stand-by masters in `Configure Jenkins` this will provide high availability in the case of a master going offline, a standby master will assume control and jobs will continue to run. 

#### Slaves
By default we configure one Jenkins Slave. You can increase this value in the `Resources` tab in OpsManager. 

The more slaves you add, the more jobs you are able to run concurrently.

You are also able to add in existing slaves from your infrastructure that are outside of PCF.  

### Known Limitations

Limitations with the current Cloudbees Jenkins Enterprise for Pivotal CF product include:

* Currently supported buildpacks are Java, Ruby, NodeJS
* The operators machine which is logged into OpsManager installing the tile, requires an internet connection to obtain the trial licence
* Test services are provisioned using the `jenkins` user, this requires this user to have access through the security groups to all of the possible test services that app developers will test against. 
* Credentials for the CF CLI have to be passed in the shell step

We hope to address all of these limitations in future releases.

### Feedback

Please provide any bugs, feature requests, or questions to [the Pivotal CF Feedback list](mailto:pivotal-cf-feedback@pivotal.io).

### Version

This product is based on Cloudbees Jenkins Enterprise version 1.554.10.1.

### Further Reading

* [Official Cloudbees Jenkins Documentation](http://wiki.cloudbees.com/bin/view/Jenkins+Enterprise/WebHome)
* [Jenkins Open Source](http://jenkins-ci.org/)
