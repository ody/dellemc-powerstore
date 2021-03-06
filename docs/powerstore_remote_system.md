Document: "dellemc.swagger"


Path: "tag_based/assets/dellemc.swagger.json")

## Remote_system

Information about remote storage systems that connect to the local PowerStore system. The system uses the configuration to access and communicate with the remote system for management and data transfer communications. 
For example, to use remote replication, create a configuration that specifies the remote system to use as the destination for the replication session.

The PowerStore local system can establish a remote system relationship with different types of remote storage systems for replication remote protection and import use-cases. Refer to the RemoteSystemTypeEnum specification for a list of system types supported.  
**NOTE**
Before creating a remote system relationship with PowerStore remote systems, first establish a Certificate Based Trust between the local and remote PowerStore systems using the *verify* and *exchange* operations on the **x509_certificate** resource type.


```puppet
powerstore_remote_system {
  data_network_latency => "data_network_latency (optional)",
  description => "description (optional)",
  discovery_chap_mode => "discovery_chap_mode (optional)",
  import_chap_info => "import_chap_info (optional)",
  iscsi_addresses => "iscsi_addresses (optional)",
  management_address => "management_address (optional)",
  name => "name",
  remote_password => "remote_password (optional)",
  remote_username => "remote_username (optional)",
  session_chap_mode => "session_chap_mode (optional)",
  type => "type (optional)",
}
```

| Name        | Type           | Required       |
| ------------- | ------------- | ------------- |
|data_network_latency | Optional[Enum['Low','High']] | false |
|description | Optional[String[0,256]] | false |
|discovery_chap_mode | Optional[Enum['Disabled','Single','Mutual']] | false |
|import_chap_info | Optional[Struct[{Optional[initiator_discovery_password] => Optional[String], Optional[initiator_discovery_username] => Optional[String], Optional[initiator_session_password] => Optional[String], Optional[initiator_session_username] => Optional[String], Optional[target_discovery_password] => Optional[String], Optional[target_discovery_username] => Optional[String], Optional[target_session_password] => Optional[String], Optional[target_session_username] => Optional[String], }]] | false |
|iscsi_addresses | Optional[Array[String]] | false |
|management_address | Optional[String] | false |
|name | Optional[String[0,128]] | true |
|remote_password | Optional[String] | false |
|remote_username | Optional[String] | false |
|session_chap_mode | Optional[Enum['Disabled','Single','Mutual']] | false |
|type | Optional[Enum['PowerStore','Unity','VNX','PS_Equallogic','Storage_Center','XtremIO']] | false |



## CRUD operations

Here is a list of endpoints that we use to create, read, update and delete the remote_system

| Operation | Path | Verb | Description | OperationID |
| ------------- | ------------- | ------------- | ------------- | ------------- |
|Create|`/remote_system`|Post|Create a new remote system relationship. The type of remote system being connected requires different parameter sets. 
For PowerStore remote system relationships, include the following parameters:
* Management address - Either an IPv4 or IPv6 address. FQDN is not supported.
* Type of remote system 
* Data network latency type




For PowerStore remote system relationships, the relationship is created in both directions. Remote protection policies can be configured using the PowerStore remote system instance on either of the systems. This enables remote replication for storage resources in either direction. The data connections take into account whether Challenge Handshake Authentication Protocol (CHAP) is enabled on local and remote PowerStore systems.




For non-PowerStore remote system relationships, include the following parameters:
* Management address - Either an IPv4 or IPv6 address. FQDN is not supported.
* Type of remote system
* Name
* Description
* Remote administrator credentials
* iSCSI address - IPv4 address
* CHAP mode for discovery or session 
* CHAP secrets details




After the remote system relationship is created, the local system can communicate with the remote system, and open data connections for data transfer.
|remote_system_create|
|List - list all|`/remote_system`|Get|Query remote systems.
|remote_system_collection_query|
|List - get one|`/remote_system/%{id}`|Get|Query a remote system instance.
|remote_system_instance_query|
|List - get list using params|``||||
|Update|`/remote_system/%{id}`|Patch|Modify a remote system instance. The list of valid parameters depends on the type of remote system.




For PowerStore remote system relationships:

* Description
* Management address - An IPv4 or IPv6 address. FQDN is not supported.




For non-PowerStore remote system relationships:

* Name
* Description
* Management address - An IPv4 address. FQDN is not supported.
* Remote administrator credentials
* iSCSI address - An IPv4 address.




After modifying the remote session instance, the system reestablishes the data connections as needed.
|remote_system_modify|
|Delete|`/remote_system/%{id}`|Delete|Delete a remote system. Deleting the remote system deletes the management and data connections established with the remote system. You cannot delete a remote system if there are active import sessions, or if there are remote protection policies active in the system referencing the remote system instance.




For PowerStore remote systems, the relationship is deleted in both directions if the remote system is up and connectable. You cannot delete a PowerStore remote system if there is no management connectivity between the local and remore systems. Only the local end of the relationship is deleted. Manually log in to the remote PowerStore system and remove the relationship.
|remote_system_delete|
