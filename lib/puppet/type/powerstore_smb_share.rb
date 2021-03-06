require 'puppet/resource_api'

# rubocop:disable Style/StringLiterals
Puppet::ResourceApi.register_type(
  name: 'powerstore_smb_share',
  features: ['remote_resource'],
  # rubocop:disable Lint/UnneededDisable
  # rubocop:disable Layout/TrailingWhitespace
  desc: <<-EOS,
    SMB Shares use the SMB protocol to provide an access point for configured Windows hosts to access file system storage. The system uses Active Directory to authenticate user and user group access to the Share.
  EOS
  attributes:   {
    ensure:      {
      type:      "Enum['present', 'absent']",
      desc:      'Whether this resource should be present or absent on the target system.',
      default:   'present',
    },
    description:          {
      type:      "Optional[String[0,511]]",
      desc:      "SMB share description.",
    },
    file_system_id:          {
      type:      "Optional[String]",
      desc:      "Unique identifier of the file system on which the SMB Share will be created.",
      behaviour: :init_only,
    },
    id:          {
      type:      "Optional[String]",
      desc:      "SMB Share object id.",
      behaviour: :read_only,
    },
    is_abe_enabled:          {
      type:      "Optional[Boolean]",
      desc:      "Indicates whether Access-based Enumeration (ABE) is enabled. ABE filters the list of available files and folders on a server to include only those to which the requesting user has access. Values are:- true - ABE is enabled.- false - ABE is disabled.",
    },
    is_branch_cache_enabled:          {
      type:      "Optional[Boolean]",
      desc:      "Indicates whether BranchCace optimization is enabled. BranchCache optimization technology copies content from your main office or hosted cloud content servers and caches the content at branch office locations, allowing client computers at branch offices to access the content locally rather than over the WAN. Values are:- true - BranchCache is enabled.- false - BranchCache is disabled.",
    },
    is_continuous_availability_enabled:          {
      type:      "Optional[Boolean]",
      desc:      "Indicates whether continuous availability for Server Message Block (SMB) 3.0 is enabled for the SMB Share. Values are:- true - Continuous availability for SMB 3.0 is enabled for the SMB Share.- false - Continuous availability for SMB 3.0 is disabled for the SMB Share.",
    },
    is_encryption_enabled:          {
      type:      "Optional[Boolean]",
      desc:      "Indicates whether encryption for Server Message Block (SMB) 3.0 is enabled at the shared folder level. Values are:- true - encryption for SMB 3.0 is enabled.- false - encryption for SMB 3.0 is disabled.",
    },
    name:          {
      type:      "String[1,80]",
      desc:      "SMB share name.",
      behaviour: :namevar,
    },
    offline_availability:          {
      type:      "Optional[Enum['Manual','Documents','Programs','None']]",
      desc:      "Defines valid states of Offline Availability,   * Manual - Only specified files will be available offline.   * Documents - All files that users open will be available offline.   * Programs - Program will preferably run from the offline cache even when connected to the network. All files that users open will be available offline.   * None - Prevents clients from storing documents and programs in offline cache (default).",
    },
    offline_availability_l10n:          {
      type:      "Optional[String]",
      desc:      "Localized message string corresponding to offline_availability",
    },
    path:          {
      type:      "Optional[String]",
      desc:      "Local path to the file system or any existing sub-folder of the file system that is shared over the network.This path is relative to the NAS Server and must start with the filesystem's mountpoint path, which is the filesystem name.For example to share the top-level of a filesystem named svr1fs1, which is on the /svr1fs1 mountpoint of the NAS Server, use /svr1fs1 in the path parameter.SMB shares allow you to create multiple network shares for the same local path.",
      behaviour: :init_only,
    },
    umask:          {
      type:      "Optional[String]",
      desc:      "The default UNIX umask for new files created on the Share. If not specified the umask defaults to 022.",
    },
  },
  autorequires: {
    file:    '$source', # will evaluate to the value of the `source` attribute
    package: 'apt',
  },
)
