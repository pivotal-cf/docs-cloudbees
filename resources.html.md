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
    	 	<td>Jenkins Operations Center</td>
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
        <td>Jenkins Shared Slave</td>
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
* You can have 0 or 1 instance of `CloudBees Jenkins Operations Center`.
* Each `Jenkins Slave` is attached to a specific `Jenkins Master`.
For the best usage of resources, we recommend you to use `Jenkins Shared Slaves` instead.
These will be attached to `CloudBees Jenkins Operations Center` and leased to Masters when needed.
* Increasing the instance count for `Jenkins Master` does not give you High Availability.
