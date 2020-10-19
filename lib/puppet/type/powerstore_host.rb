require 'puppet/resource_api'

Puppet::ResourceApi.register_type(
  name: 'powerstore_host',
  features: [ 'remote_resource' ],

  desc: <<-EOS,
    
  EOS
  attributes:   {
    ensure:      {
      type: "Enum['present', 'absent']",
      desc: "Whether this resource should be present or absent on the target system.",
      default: "present",
    },

    add_initiators:          { 
      type:      "Optional[Array[Struct[{Optional[chap_mutual_password] => String[12,64], Optional[chap_mutual_username] => String[1,64], Optional[chap_single_password] => String[12,64], Optional[chap_single_username] => String[1,64], port_name => String, port_type => Enum['iSCSI','FC'], }]]]",
      desc:      "The list of initiators to be added. CHAP username and password are optional.",
    },
    description:          { 
      type:      "Optional[String[1,256]]",
      desc:      "An optional description for the host. The description should not be more than 256 UTF-8 characters long and should not have any unprintable characters.",
    },
    host_group_id:          { 
      type:      "Optional[String]",
      desc:      "Associated host group, if host is part of host group.",
    },
    host_initiators:          { 
      type:      "Optional[Array[Struct[{Optional[active_sessions] => Array[Struct[{Optional[appliance_id] => String, Optional[bond_id] => String, Optional[eth_port_id] => String, Optional[fc_port_id] => String, Optional[node_id] => String, Optional[port_name] => String, Optional[veth_id] => String, }]], Optional[chap_mutual_username] => String[1,64], Optional[chap_single_username] => String[1,64], Optional[port_name] => String, Optional[port_type] => Enum['iSCSI','FC'], Optional[port_type_l10n] => String, }]]]",
      desc:      "Filtering on the fields of this embedded resource is not supported.",
    },
    id:          { 
      type:      "Optional[String]",
      desc:      "Unique id of the host.",
    },
    initiators:          { 
      type:      "Array[Struct[{Optional[chap_mutual_password] => String[12,64], Optional[chap_mutual_username] => String[1,64], Optional[chap_single_password] => String[12,64], Optional[chap_single_username] => String[1,64], port_name => String, port_type => Enum['iSCSI','FC'], }]]",
      desc:      "",
      behaviour: :init_only,
    },
    modify_initiators:          { 
      type:      "Optional[Array[Struct[{Optional[chap_mutual_password] => String[12,64], Optional[chap_mutual_username] => String[1,64], Optional[chap_single_password] => String[12,64], Optional[chap_single_username] => String[1,64], Optional[port_name] => String, }]]]",
      desc:      "Update list of existing initiators, identified by port_name, with new CHAP usernames and/or passwords.",
    },
    name:          { 
      type:      "String[1,128]",
      desc:      "The host name. The name should not be more than 128 UTF-8 characters long and should not have any unprintable characters.",
      behaviour: :namevar,
    },
    os_type:          { 
      type:      "Enum['Windows','Linux','ESXi','AIX','HP-UX','Solaris']",
      desc:      "Operating system of the host.",
      behaviour: :init_only,
    },
    os_type_l10n:          { 
      type:      "Optional[String]",
      desc:      "Localized message string corresponding to os_type",
    },
    remove_initiators:          { 
      type:      "Optional[Array[String]]",
      desc:      "The list of initiator port_names to be removed.",
    },
  },
  autorequires: {
    file:    '$source', # will evaluate to the value of the `source` attribute
    package: 'apt',
  },
)
