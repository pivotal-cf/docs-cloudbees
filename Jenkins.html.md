---
title: CloudBees Jenkins Platform for Pivotal Cloud Foundry
owner: London Services
---

CloudBees Jenkins Platform can be deployed to and managed by your Pivotal Cloud Foundry environment. Deployment is automated and easy: the topology and resourcing requirements of your setup can be easily changed in OpsManager to suit your needs. This product provides a pre-built configuration tailored towards Cloud Foundry integration, with common dependencies, languages, and packages already installed. Upgrades to newer versions, which include new versions of CloudBees, dependencies, and new features are seamless and easy to install, making the operator's life easy.

CloudBees Jenkins Platform is tightly integrated into Pivotal Cloud Foundry to provide an enhanced application developer and workflow experience. Focusing on ensuring tests can be as close to the actual Cloud Foundry runtime experience as possible, to remove any discrepancies or bugs caused by differences in libraries and environments. You can utilize the same build packs for Ruby & NodeJS as the runtime to run your tests and easily create and bind to Pivotal Cloud Foundry service instances for integration testing.

CloudBees Jenkins Platform is integrated with UAA to provide single sign-on functionality for users, providing a seamless platform experience as well segregating builds by user and space for isolation and security. Applications can be easily deployed to Cloud Foundry, using a blue-green deployment strategy, upon a successful build using the integrated CLI plugin and credentials store.

### Features

Key features of the product are:

* [Integration with Cloud Foundry UAA for Single Sign On (SSO) support](http://docs.pivotal.io/cloudbees/security.html)
* [Isolation of builds by user and Cloud Foundry space](http://docs.pivotal.io/cloudbees/security.html)
* [Use of the same buildpacks as runtime to ensure consistency for Ruby & NodeJS](#buildpacks)
* [Automatic provisioning of services instances for your tests](#services)
* [Seamless deployment to Cloud Foundry using the integrated CLI](#cli)
* [Automatic master and slave configuration](#topology)
* [Support for Gradle wrapper and Maven](#gradle)

## Product snapshot

<dl>
<dt>CloudBees Jenkins Platform for Pivotal Cloud Foundry Details</dt>
<dd><strong>Version</strong>: 15.11.02.06 </dd>
<dd><strong>Release Date</strong>: June 23rd 2016</dd>
<dd><strong>Software component version</strong>: CloudBees Jenkins Enterprise 1.642.18.2</dd>
<dd><strong>Software component version</strong>: CloudBees Jenkins Operations Center 1.625.18.4</dd>
<dd><strong>Compatible Ops Manager Version(s)</strong>: 1.5.x, 1.6.x, 1.7.x</dd>
<dd><strong>Compatible Elastic Runtime Version(s)</strong>: 1.5.x, 1.6.x, 1.7.x</dd>
<dd><strong>vSphere support?</strong> Yes</dd>
<dd><strong>AWS support?</strong> Yes</dd>
</dl>

### Install via Pivotal Cloud Foundry Ops Manager

To install CloudBees Jenkins Platform for Pivotal Cloud Foundry, follow the procedure for installing Pivotal Cloud Foundry Ops Manager tiles:

1. Download the product file from [Pivotal Network](https://network.pivotal.io/products/cloudbees).
1. Upload the product file to your Ops Manager installation.
1. Click **Add** next to the uploaded product description in the Ops Manager `Available Products` view to add this product to your staging area.
1. Click the newly added tile to review any configurable options.
1. Click **Apply Changes** to install the service.

### Dependencies
This product requires Pivotal Cloud Foundry:

* Elastic Runtime version 1.5 or greater
* Ops Manager version 1.5 or greater

### Managing Jenkins

#### Licensing

A 15 days trial license will be created when the product is installed. This needs to be replaced with your enterprise license, which should be acquired directly from CloudBees. You can update the enterprise license in the Jenkins `Manage Jenkins` section when logged in as the UAA Admin user.

The operator's machine that is accessing the Jenkins setup page, requires an internet connection to facilitate obtaining the trial license.

If you are accessing Jenkins from a machine **with** internet access, a trial license will be automatically retrieved on the `Register Jenkins` page.

If you are accessing Jenkins from a machine **without** internet access, you will need provide a valid license. Trial licenses can be obtained from [CloudBees](http://www.cloudbees.com/try-jenkins-enterprise).

Upon a trial license expiring after **15 days**, you will be presented with the `Register Jenkins` page where you can enter your updated license details if you have not already done so ahead of the expiration.

#### Installation Details

By default the setup is configured with:
* 1 CloudBees Jenkins Operations Center (CJOC)
* 1 CloudBees Jenkins Enterprise (CJE)
* 1 slave attached to the CJE instance
* 1 shared slave attached to the CJOC instance.

These values can be changed in the `Resources` tab within the tile on Ops Manager.

Once installed, CJOC is accessible via `http://jenkins-oc-0.your-cf-domain.com`. From there, you will be able to access the CJE instance you defined in the tile configuration.

**For technical reasons, the tile installation is limited to a single availability zone on AWS. When assigning availability zones to the tile, please make sure only one is selected.**

#### Configuration Details

Slaves come pre-configured with:

1. openjdk8
1. git
1. Maven 3
1. CloudFoundry CLI
1. buildpacks: ruby and nodejs

You can modify the initial setup simply editing the Jenkins Configuration Page. Please refer to the standard Jenkins and CJE documentation for further details.


#### Authorization

Cloud Foundry users registered with UAA can log into Jenkins and create jobs, but they cannot edit the details of other users' jobs.

To manage plugins and to access `Manage Jenkins`, log in as the UAA Administrator. The credentials can be obtained from the Elastic Runtime tile in Ops Manager. User access is managed through the UAA.

### Buildpacks and Services

To ensure consistency between your tests and the runtime environment, use the provided commands to execute your builds using the same buildpacks and services as your Cloud Foundry environment.

#### <a name="buildpacks"></a>Buildpacks
To use the correct buildpack, add the `. cf_buildpack` command into a shell step.

<p class="note"><strong>Note</strong>: The full stop is required, as builds execute within the `sh` shell.</p>

Currently supported buildpacks are Ruby and NodeJS. However, even though the Java buildpack is not pre-installed, it is still possible to build and deliver java applications since all the necessary tools of the Java buildpack are pre-installed and configured.

#### <a name="services"></a>Services
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

### <a name="cli"></a>Cloud Foundry CLI
The CF CLI is included via a plugin so that it is available to your Jenkins jobs.
In a shell step you can now use the same `cf` commands that you would use directly from your machine.

The credentials for Cloud Foundry will be set up in the plugin configuration section.

  ![CF CLI Configuration Section]
  (/images/cd-cf-cli.png)

For more details on the CF CLI, please see the [documentation](http://docs.pivotal.io/pivotalcf/cf-cli/getting-started.html).

### Jenkins Plugins
As part of the installation, we automatically install the following additional plugins:

1. Cloud Foundry UAA
1. Cloud Foundry CLI
1. Artifactory
1. Mock Security Realm
1. RBAC Autoconfigurer
1. Subversion
1. Github
1. Syslog Logger
1. Gradle

These plugins **cannot** be removed.

There are no restrictions on installing any other plugins, including CloudBees Enterprise plugins and open source.
Any user installed plugins will be persisted after an upgrade or a restore of the VMs by Bosh.

#### <a name="gradle"></a>Gradle Wrapper
We recommend that you use `Gradle Wrapper` in your application.

When building your application, unless specified otherwise the generated file will be named after your **Jenkins job** and placed into **/build/libs/**

### <a name="topology"></a>Environment Architecture

#### CloudBees Jenkins Operations Center
By default, the tile is configured to provide a CJOC instance. All masters in the tile will be linked with the CJOC instance.

#### Masters
By default, one CJE instance is configured. You can increase this value in the `Resources` tab in Ops Manager.

#### Shared slaves
By defaut, one shared slave is configured in the tile. It attaches to CJOC, and can be leased to CJE instances on demand. You can increase this value in the `Resources` tab in Ops Manager.

#### Slaves
By default we configure one Jenkins Slave. You can increase this value in the `Resources` tab in Ops Manager.

The more slaves you add, the more jobs you can run concurrently.

You are also able to add in existing slaves from your infrastructure that are outside of PCF, which is recommended if you would like to add slaves with architecture different than Ubuntu Trusty.

You can add/disable/remove slaves, but built-in slaves  will be automatically re-created when Jenkins restarts.

#### Managing the Topology from GUI

From the Ops Manager GUI you can easily modify the number of CJE instances, slaves and shared slaves to be installed

![Resource Configuration]
  (/images/managing-topology.png)

With this configuration, you will access CJOC through
`https://jenkins-oc-0.your-cf-domain.com`. It will have two shared slaves preconfigured.
You'll have also two CJE instances pre-configured and connected to CJOC.

### Known Limitations

Limitations with the current CloudBees Jenkins Platform for Pivotal Cloud Foundry product include:

* Currently supported buildpacks are Ruby and NodeJS (this DOES NOT mean that you can't build java application though, see buildpacks section for more details)
* The operator's machine which is logged into Ops Manager installing the tile requires an internet connection to obtain the trial license
* Test services are provisioned using the `jenkins` user. This requires this user to have access through the security groups to all of the possible test services that app developers will test against.
* The tile installation is limited to a single availability zone on AWS. When assigning availability zones to the tile, please make sure only one is selected.

We hope to address all of these limitations in future releases.

### Feedback

Please provide any bugs, feature requests, or questions to [the Pivotal Cloud Foundry Feedback list](mailto:pivotal-cf-feedback@pivotal.io).

### Version

See [Release Notes](release.html)

### Further Reading

* [CloudBees Jenkins Operations Center documentation](https://go.cloudbees.com/docs/cloudbees-documentation/cjoc-user-guide)
* [CloudBees Jenkins Enterprise documentation](https://go.cloudbees.com/docs/cloudbees-documentation/cje-user-guide)
* [Jenkins Open Source](http://jenkins.io)
