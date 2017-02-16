---
title: CloudBees Jenkins Platform for Pivotal Cloud Foundry
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

CloudBees Jenkins Platform can be deployed to and managed by your Pivotal Cloud Foundry (PCF) environment. 
Deployment is automated: the topology and resourcing requirements of your setup can be changed in OpsManager to suit your needs. 
This product provides a pre-built configuration tailored towards Cloud Foundry integration, with common dependencies, languages, and packages already installed. 
Upgrades to newer versions, which include new versions of CloudBees, dependencies, and new features are seamless to install.

CloudBees Jenkins Platform is tightly integrated with PCF an enhanced application developer and workflow experience. 
Focusing on ensuring tests can be as close to the actual Cloud Foundry runtime experience as possible, to remove any discrepancies or bugs caused by differences in libraries and environments. 
You can utilize the same build packs for Ruby & NodeJS as the runtime to run your tests, create and bind to PCF service instances for integration testing.

CloudBees Jenkins Platform integrates with Cloud Foundry User Account and Authentication (UAA) to provide single sign-on functionality for users 
and a seamless platform experience that segregates builds by user and space for isolation and security. 
Upon a successful build, you can deploy applications to Cloud Foundry with a blue-green deployment strategy using the integrated CLI plugin and credentials store.

### Features

Key features of the product are:

* [Integration with Cloud Foundry UAA for Single Sign On (SSO) support](http://docs.pivotal.io/cloudbees/security.html)
* [Isolation of builds by user and Cloud Foundry space](http://docs.pivotal.io/cloudbees/security.html)
* [Use of the same buildpacks as runtime to ensure consistency for Ruby & NodeJS](#buildpacks)
* [Automatic provisioning of services instances for your tests](#services)
* [Seamless deployment to Cloud Foundry using the integrated CLI](#cli)
* [Automatic master and slave configuration](#topology)
* [Support for Gradle wrapper and Maven](#gradle)

## Product Snapshot

<dl>
<dt>CloudBees Jenkins Platform for PCF Details</dt>
<dd><strong>Version</strong>: v15.11.02.06 </dd>
<dd><strong>Release Date</strong>: June 23rd 2016</dd>
<dd><strong>Software component version</strong>: CloudBees Jenkins Enterprise v1.642.18.2</dd>
<dd><strong>Software component version</strong>: CloudBees Jenkins Operations Center v1.625.18.4</dd>
<dd><strong>Compatible Ops Manager Version(s)</strong>: 1.5.x, 1.6.x, 1.7.x</dd>
<dd><strong>Compatible Elastic Runtime Version(s)</strong>: 1.5.x, 1.6.x, 1.7.x</dd>
<dd><strong>vSphere support?</strong> Yes</dd>
<dd><strong>AWS support?</strong> Yes</dd>
</dl>

### Install with PCF Ops Manager

To install CloudBees Jenkins Platform for PCF, follow the procedure for installing PCF Ops Manager tiles:

1. Download the product file from [Pivotal Network](https://network.pivotal.io/products/cloudbees).
1. Upload the product file to your Ops Manager installation.
1. Click **Add** next to the uploaded product description in the Ops Manager **Available Products** view to add this product to your staging area.
1. Click the newly added tile to review any configurable options.
1. Click **Apply Changes** to install the service.

### Dependencies
This product requires PCF:

* Elastic Runtime v1.5 or later
* Ops Manager v1.5 or later

### Managing Jenkins

#### Licensing

A 15-day trial license is created when the product is installed. This needs to be replaced with your enterprise license, which should be acquired directly from CloudBees. 
You can update the enterprise license in the Jenkins **Manage Jenkins** section if logged in as the UAA Admin user.

The operator's machine that is accessing the Jenkins setup page, requires an internet connection to facilitate obtaining the trial license.

If you are accessing Jenkins from a machine **with** internet access, a trial license will be automatically retrieved on the **Register Jenkins** page.

If you are accessing Jenkins from a machine **without** internet access, you will need provide a valid license. 
Trial licenses can be obtained from [CloudBees](http://www.cloudbees.com/try-jenkins-enterprise).

Upon a trial license expiring after **15 days**, you will be presented with the **Register Jenkins** page where you can enter your updated license details if you have not already done so ahead of the expiration.

#### Installation Details

By default the setup is configured with the following:

* 1 CloudBees Jenkins Operations Center (CJOC)
* 1 CloudBees Jenkins Enterprise (CJE)
* 1 slave attached to the CJE instance
* 1 shared slave attached to the CJOC instance.

You can change these values in the Ops Manager **Resources** tab within the tile.

Once installed, you can access CJOC at `http://jenkins-oc-0.your-cf-domain.example.com`. From there, you can access the CJE instance you defined in the tile configuration.

<p class="note"><strong>Note</strong>: For technical reasons, the tile installation is limited to a single availability zone on AWS. 
When assigning availability zones to the tile, select only one availability zone.</p> 

#### Configuration Details

Slaves are pre-configured with:

* `openjdk8`
* `git`
* `Maven 3`
* `Cloud Foundry CLI (cf CLI)`
* `Ruby` and `Node.js` buildpacks
* `Docker`

You can modify the initial setup by editing the Jenkins Configuration Page. Refer to the standard Jenkins and CJE documentation for further details.


#### Authorization

Cloud Foundry users registered with UAA can log into Jenkins and create jobs, but they cannot edit the details of other users' jobs.

To manage plugins and to access **Manage Jenkins**, log in as the UAA Administrator. The credentials can be obtained from the Elastic Runtime tile in Ops Manager. User access is managed through the UAA.

### Buildpacks and Services

To ensure consistency between your tests and the runtime environment, use the provided commands to execute your builds using the same buildpacks and services as your Cloud Foundry environment.

#### <a name="buildpacks"></a>Buildpacks
To use the correct buildpack, add the `. cf_buildpack` command into a shell step.

<p class="note"><strong>Note</strong>: The full stop is required, as builds execute within the <code>sh</code> shell.</p>

Currently supported buildpacks are Ruby and NodeJS. However, even though the Java buildpack is not pre-installed, it is still possible to build and deliver java applications since all the necessary tools of the Java buildpack are pre-installed and configured.

#### <a name="services"></a>Services
This functionality will create an instance of your required service and expose the `VCAP_SERVICES` environment variable to your application and tests.

An export statement is required for each service that you require. Multiple services can be added by separating them with commas.

An export statement takes the format of `service:plan:name`, where `service` and `plan` can be obtained from the `cf marketplace` command and `name` from `cf services`.

For example, `export REQUIRED_SERVICE_INSTANCES="p-redis:development:redis"` should be added into a shell step.

Then specify `. test_service_instances`.

#### Full Example

<pre class="terminal">
$ . cf_buildpack
$ export REQUIRED_SERVICE_INSTANCES="p-redis:development:redis,p-mongodb:development:mongo"
$ . test_service_instances
$ rspec
</pre>

### <a name="cli"></a>Cloud Foundry CLI
The CF CLI is included via a plugin so that it is available to your Jenkins jobs.
In a shell step you can now use the same `cf` commands that you would use directly from your machine.

The credentials for Cloud Foundry will be set up in the plugin configuration section.

  ![CF CLI Configuration Section]
  (/images/cd-cf-cli.png)

For more details on the CF CLI, see the [documentation](http://docs.pivotal.io/pivotalcf/cf-cli/getting-started.html).

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

<p class="note"><strong>Note</strong>: These plugins cannot be removed.</p>

There are no restrictions on installing any other plugins, including CloudBees Enterprise plugins and open source.
Any user installed plugins will be persisted after an upgrade or a restore of the VMs by Bosh.

#### <a name="gradle"></a>Gradle Wrapper
We recommend that you use `Gradle Wrapper` in your application.

When building your application, unless specified otherwise the generated file will be named after your **Jenkins job** and placed into **/build/libs/**

### <a name="topology"></a>Environment Architecture

#### CloudBees Jenkins Operations Center
By default, the tile is configured to provide a CJOC instance. All masters in the tile will be linked with the CJOC instance.

#### Masters
By default, one CJE instance is configured. You can increase this value in the **Resources** tab in Ops Manager.

#### Shared Slaves
By defaut, one shared slave is configured in the tile. It attaches to CJOC, and can be leased to CJE instances on demand. You can increase this value in the **Resources** tab in Ops Manager.

#### Slaves
By default we configure one Jenkins Slave. You can increase this value in the **Resources** tab in Ops Manager.

The more slaves you add, the more jobs you can run concurrently.

You are also able to add in existing slaves from your infrastructure that are outside of PCF, which is recommended if you would like to add slaves with architecture different than Ubuntu Trusty.

You can add/disable/remove slaves, but built-in slaves  will be automatically re-created when Jenkins restarts.

#### Managing the Topology from GUI

From the Ops Manager GUI you can modify the number of CJE instances, slaves, and shared slaves to be installed.

![Resource Configuration]
  (/images/managing-topology.png)

With this configuration, you can access CJOC at `https://jenkins-oc-0.your-cf-domain.example.com`. It has two shared slaves preconfigured. You will have also two CJE instances pre-configured and connected to CJOC.

### Known Limitations

Limitations with the current CloudBees Jenkins Platform for PCF product include:

* Currently supported buildpacks are Ruby and NodeJS (this limitation does not mean that you cannot build java applications, see buildpacks section for more details)
* The operator's machine which is logged into Ops Manager installing the tile requires an internet connection to obtain the trial license
* Test services are provisioned using the `jenkins` user. This requires this user to have access through the security groups to all of the possible test services that app developers will test against.
* The tile installation is limited to a single availability zone on AWS. When assigning availability zones to the tile, select only one of the availability zones.

We hope to address all of these limitations in future releases.

### Feedback

Provide any bugs, feature requests, or questions to [the PCF Feedback list](mailto:pivotal-cf-feedback@pivotal.io).

### Version

See [Release Notes](release.html)

### Further Reading

* [CloudBees Jenkins Operations Center documentation](https://go.cloudbees.com/docs/cloudbees-documentation/cjoc-user-guide)
* [CloudBees Jenkins Enterprise documentation](https://go.cloudbees.com/docs/cloudbees-documentation/cje-user-guide)
* [Jenkins Open Source](http://jenkins.io)
