require 'puppet/resource_api'

# rubocop:disable Style/StringLiterals
Puppet::ResourceApi.register_type(
  name: 'powerstore_file_nis',
  features: ['remote_resource'],
  # rubocop:disable Lint/UnneededDisable
  # rubocop:disable Layout/TrailingWhitespace
  desc: <<-EOS,
    Use these resources to manage the Network Information Service (NIS) settings object for a NAS Server. One NIS settings object may be configured per NAS server. NIS consists of a directory service protocol for maintaining and distributing system configuration information, such as user and group information, hostnames, and such. The port for NIS Service is 111.
  EOS
  attributes:   {
    ensure:      {
      type:      "Enum['present', 'absent']",
      desc:      'Whether this resource should be present or absent on the target system.',
      default:   'present',
    },
    add_ip_addresses:          {
      type:      "Optional[Array[String]]",
      desc:      "IP addresses to add to the current list. The addresses may be IPv4 or IPv6. Error occurs if the IP address already exists. Cannot be combined with ip_addresses.",
    },
    domain:          {
      type:      "Optional[String[1,255]]",
      desc:      "Name of the NIS domain.",
    },
    id:          {
      type:      "String",
      desc:      "Unique identifier of the NIS object.",
      behaviour: :namevar,
    },
    ip_addresses:          {
      type:      "Optional[Array[String]]",
      desc:      "The list of NIS server IP addresses.",
    },
    nas_server_id:          {
      type:      "Optional[String]",
      desc:      "Unique identifier of the associated NAS Server instance that uses this NIS Service object.  Only one NIS Service per NAS Server is supported.",
      behaviour: :init_only,
    },
    remove_ip_addresses:          {
      type:      "Optional[Array[String]]",
      desc:      "IP addresses to remove from the current list. The addresses may be IPv4 or IPv6. Error occurs if the IP address is not present. Cannot be combined with ip_addresses.",
    },
  },
  autorequires: {
    file:    '$source', # will evaluate to the value of the `source` attribute
    package: 'apt',
  },
)
