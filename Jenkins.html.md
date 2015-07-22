---
title: CloudBees Jenkins Enterprise for Pivotal Cloud Foundry
---

CloudBees Jenkins Enterprise can be deployed to and managed by your Pivotal Cloud Foundry environment. Deployment is automated and easy: the topology and resourcing requirements of your setup can be easily changed in OpsManager to suit your needs. This product provides a pre-built configuration tailored towards Cloud Foundry integration, with common dependencies, languages, and packages already installed. Upgrades to newer versions, which include new versions of CloudBees, dependencies, and new features are seamless and easy to install, making the operator's life easy.

CloudBees Jenkins is tightly integrated into Pivotal Cloud Foundry to provide an enhanced application developer and workflow experience. Focusing on ensuring tests can be as close to the actual Cloud Foundry runtime experience as possible, to remove any discrepancies or bugs caused by differences in libraries and environments. You can utilize the same build packs for Ruby & NodeJS as the runtime to run your tests and easily create and bind to Pivotal Cloud Foundry service instances for integration testing.

CloudBees Jenkins is integrated with UAA to provide single sign-on functionality for users, providing a seamless platform experience as well segregating builds by user and space for isolation and security. Applications can be easily deployed to Cloud Foundry, using a blue-green deployment strategy, upon a successful build using the integrated CLI plugin and credentials store.

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
<dt>CloudBees Jenkins Enterprise for Pivotal Cloud Foundry Details</dt>
<dd><strong>Version</strong>: 15.05.01.00 </dd>
<dd><strong>Release Date</strong>: 22nd July 2015</dd>
<dd><strong>Software component version</strong>: CloudBees Jenkins 1.609.1.1</dd>
<dd><strong>Compatible Ops Manager Version(s)</strong>: 1.4.x, 1.5.x</dd>
<dd><strong>Compatible Elastic Runtime Version(s)</strong>: 1.4.x, 1.5.x</dd>
<dd><strong>vSphere support?</strong> Yes</dd>
<dd><strong>AWS support?</strong> Yes</dd>
</dl>

### Upgrading to the Latest Version

Consider the following compatibility information before upgrading CloudBees Jenkins Enterprise for Pivotal Cloud Foundry.

<p class="note"><strong>Note</strong>: Before you upgrade to Ops Manager 1.4.x, you must first upgrade CloudBees Jenkins Enterprise for Pivotal Cloud Foundry to any version in 1.3.x. This allows CloudBees Jenkins Enterprise for Pivotal Cloud Foundry upgrades after you install OpsManager 1.4.x. </p>

For more information, refer to the full Product Version Matrix.

<table border="1" class="nice">
<tr>
  <th>Ops Manager Version</th>
  <th>Supported Upgrades from Imported CloudBees Jenkins Enterprise Installation</th>
</tr>
<tr>
  <th>1.3.x</th>
  <td><ul>
      <li>From 1.3.2 to 1.3.3, 1.3.4, 1.3.5, 1.3.6, 1.3.7.2, 1.3.8.3</li>
      <li>From 1.3.3 to 1.3.4, 1.3.5, 1.3.6, 1.3.7.2, 1.3.8.3</li>
      <li>From 1.3.4 to 1.3.5, 1.3.6, 1.3.7.2, 1.3.8.3</li>
      <li>From 1.3.5 to 1.3.6, 1.3.7.2, 1.3.8.3</li>
      <li>From 1.3.6 to 1.3.7.2, 1.3.8.3</li>
      <li>From 1.3.7.2 to 1.3.8.3</li>
    </ul>
  </td>
</tr>
<tr>
  <th>1.4.x</th>
  <td><ul>
      <li>From 1.3.2 to 14.11.01.03, 15.05.01.00</li>
      <li>From 1.3.3 to 14.11.01.03, 15.05.01.00</li>
      <li>From 1.3.4 to 14.11.01.03, 15.05.01.00</li>
      <li>From 1.3.5 to 14.11.01.03, 15.05.01.00</li>
      <li>From 1.3.6 to 14.11.01.03, 15.05.01.00</li>
      <li>From 1.3.7.2 to 14.11.01.03, 15.05.01.00</li>
      <li>From 1.3.8.3 to 14.11.01.03, 15.05.01.00</li>
    </ul>
  </td>
</tr>
<tr>
  <th>1.5.x</th>
  <td><ul>
      <li>From 14.11.01.03 to 15.05.01.00</li>
    </ul>
  </td>
</tr>
</table>

### Install via Pivotal Ops Manager

To install CloudBees Jenkins Enterprise for Pivotal Cloud Foundry, follow the procedure for installing Pivotal Ops Manager tiles:

1. Download the product file from [Pivotal Network](https://network.pivotal.io/).
1. Upload the product file to your Ops Manager installation.
1. Click **Add** next to the uploaded product description in the Ops Manager `Available Products` view to add this product to your staging area.
1. Click the newly added tile to review any configurable options.
1. Click **Apply Changes** to install the service.

### Dependencies
This product requires Pivotal Cloud Foundry:

* Elastic Runtime version 1.4 or greater
* Ops Manager version 1.4 or greater

### Managing Jenkins

#### Licensing

A trial license will be created when the product is installed, which is valid for **30 days**. This needs to be replaced with your enterprise license, which should be acquired directly from CloudBees. You can update the enterprise license in the Jenkins `Manage Jenkins` section when logged in as the UAA Admin user.

The operator's machine that is accessing the Jenkins setup page, requires an internet connection to facilitate obtaining the trial license.

If you are accessing Jenkins from a machine **with** internet access, a trial license will be automatically retrieved on the `Register Jenkins` page.

If you are accessing Jenkins from a machine **without** internet access, you will need provide a valid license. Trial licenses can be obtained from [CloudBees](http://www.cloudbees.com/try-jenkins-enterprise).

Upon a trial license expiring after **30 days**, you will be presented with the `Register Jenkins` page where you can enter your updated license details if you have not already done so ahead of the expiration.

#### Installation Details

By default the setup is configured as one Master, with one Slave instance.
This can be incremented in the `Resources` tab within the tile on Ops Manager.

Once installed, Jenkins is accessible via `http://pivotal-cloudbees.your-cf-installation.com` if you upgraded the Jenkins Product on Pivotal Cloud Foundry from an older version (13.8).

If you directly install version 14.11 or higher (15.05), Jenkins will be accessible via `http://jenkins-0.your-cf-installation.com`.

If you install more than one instance of Jenkins, the other instances will be accessible via `http://jenkins-[index].your-cf-installation.com`, where `index` is a numerical value which has as many sequentials values as the number of instances generated.

i.e. if you install 3 masters, then the 3 instances can be accessed via:

 1. `http://jenkins-0.your-cf-installation.com`
 1. `http://jenkins-1.your-cf-installation.com`
 1. `http://jenkins-2.your-cf-installation.com`

#### Configuration Details

Jenkins will come pre-configured with:

1. openjdk8
1. git
1. Maven 3
1. CloudFoundry CLI
1. buildpacks: ruby and nodejs

You can modify the initial set-up simply editing the Jenkins Configuration Page. Please refer to the standard Jenkins and CJE documentation for further details.


#### Authorization

Cloud Foundry users registered with UAA can log into Jenkins and create jobs, but they cannot edit the details of other users' jobs.

To manage plugins and to access `Manage Jenkins`, log in as the UAA Administrator. The credentials can be obtained from the Elastic Runtime tile in Ops Manager. User access is managed through the UAA.

### Buildpacks and Services

To ensure consistency between your tests and the runtime environment, use the provided commands to execute your builds using the same buildpacks and services as your Cloud Foundry environment.

#### <a name="buildpacks"></a>Buildpacks
To use the correct buildpack, add the `. cf_buildpack` command into a shell step.

<p class="note"><strong>Note</strong>: The full stop is required, as builds execute within the `sh` shell.</p>

Currently supported buildpacks are Ruby and NodeJS. However, even though the Java buildpack is not pre-installed, it is still possible to build and deliver java applications since all the necessary tools of the Java Buildpack are pre-installed and configured.

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

For more details on the CF CLI, please see the [documentation](http://docs.pivotal.io/pivotalcf/devguide/installcf/whats-new-v6.html).

### Jenkins Plugins
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

#### Masters
By default we configure one Jenkins Master. You can increase this value in the `Resources` tab in Ops Manager.
If you increase the number of Masters, you can configure them to be stand-by masters in `Configure Jenkins` this will provide high availability in the case of a master going offline, a standby master will assume control and jobs will continue to run.

#### Slaves
By default we configure one Jenkins Slave. You can increase this value in the `Resources` tab in Ops Manager.

The more slaves you add, the more jobs you are able to run concurrently.

You are also able to add in existing slaves from your infrastructure that are outside of PCF, which is recommended if you would like to add slaves with architecture different than Ubuntu Trusty.

You can add/disable/remove slaves, but built-in slaves  will be automatically re-created when Jenkins restarts.

####Managing the Topology from GUI

From the Ops Manager GUI you can easily modify the number of slaves and Jenkins masters to be installed

![Resource Configuration]
  (/images/managing-topology.png)

With this configuration, the 2 Jenkins instances will be available at:

 1. `http://jenkins-0.your-cf-installation.com` or `http://pivotal-cloudbees.your-cf-installation.com` (if you migrated from version 13.8)
 1. `http://jenkins-1.your-cf-installation.com`

Each of them, will have 1 online and pre-configured slave attached.


### Known Limitations

Limitations with the current CloudBees Jenkins Enterprise for Pivotal Cloud Foundry product include:

* Currently supported buildpacks are Ruby and NodeJS (this DOES NOT mean that you can't build java application though, see buildpacks section for more details)
* The operator's machine which is logged into Ops Manager installing the tile requires an internet connection to obtain the trial license
* Test services are provisioned using the `jenkins` user. This requires this user to have access through the security groups to all of the possible test services that app developers will test against.
We hope to address all of these limitations in future releases.

### Feedback

Please provide any bugs, feature requests, or questions to [the Pivotal Cloud Foundry Feedback list](mailto:pivotal-cf-feedback@pivotal.io).

### Version

This product is based on CloudBees Jenkins Enterprise version 1.554.10.1.

### Further Reading

* [Official CloudBees Jenkins Enterprise Documentation](http://wiki.cloudbees.com/bin/view/Jenkins+Enterprise/WebHome)
* [Jenkins Open Source](http://jenkins-ci.org/)
