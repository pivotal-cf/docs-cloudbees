---
title: CloudBees Jenkins Enterprise for Pivotal Cloud Foundry
owner: London Services
---

# Resource requirements
The following table shows the default resource and IP requirements for installing the tile:

<table border="1" class="nice">
	<tr>
		<th>Product</th>
		<th>Resource</th>
		<th>Instances</th>
		<th>CPU</th>
		<th>Ram</th>
		<th>Ephemeral</th>
		<th>Persistent</th>
		<th>Static IP</th>
		<th>Dynamic IP</th>
	</tr>
	<tr>
 		<td>CloudBees</td>
	 	<td>Jenkins Master</td>
	 	<td>1</td>
	 	<td>2</td>
	 	<td>2048</td>
	 	<td>8192</td>
	 	<td>100000</td>
	 	<td>1</td>
	 	<td>0</td>
 	</tr>
 	<tr>
 		<td>CloudBees</td>
 		<td>Jenkins Slave</td>
 		<td>1</td>
 		<td>2</td>
 		<td>2048</td>
 		<td>100000</td>
 		<td>0</td>
 		<td>1</td>
 		<td>0</td>
 	</tr>
 	<tr>
 		<td>CloudBees</td>
 		<td>Compilation</td>
 		<td>2</td>
 		<td>2</td>
 		<td>1024</td>
 		<td>8192</td>
 		<td>0</td>
 		<td>0</td>
 		<td>1</td>
 	</tr>
	<tr>
		<td>CloudBees</td>
		<td>Bootstrap Jenkins with Cloud Foundry</td>
		<td>1</td>
		<td>1</td>
		<td>1024</td>
		<td>2048</td>
		<td>0</td>
		<td>0</td>
		<td>1</td>
	</tr>
	<tr>
		<td>CloudBees</td>
		<td>Deregister Jenkins from Cloud Foundry</td>
		<td>1</td>
		<td>1</td>
		<td>1024</td>
		<td>2048</td>
		<td>0</td>
		<td>0</td>
		<td>1</td>
	</tr>
</table>

#### Notes:
* You can scale out the number of `Jenkins Slaves` in order to run more build jobs.
* Increasing the instance count for `Jenkins Master` does not give you High Availability.
* if you upgrade the Jenkins Product on [Pivotal Cloud Foundry](https://network.pivotal.io/products/pivotal-cf) (PCF) from the older version (13.8), the persistant storage for the slaves will not be set to 0.