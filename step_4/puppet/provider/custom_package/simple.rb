require 'easy_type'

Puppet::Type.type(:custom_package).provide(:simple) do
	include EasyType::Provider

  desc "Manage an Oracle Tablespace in an Oracle Database via regular SQL"

  mk_resource_methods

end

