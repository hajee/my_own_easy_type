require 'easy_type'

module Puppet
  newtype(:custom_package) do
    include EasyType

    set_command(:rpm)

    ensurable

    to_get_raw_resources do
      packages_string = rpm('-qa','--qf','%{NAME}, %{VERSION}-%{RELEASE}\n')
      convert_csv_data_to_hash(packages_string,[:name, :version])
    end

    on_create do
      # What do we do to create a resource
    end

    on_modify do
      # What do we do to modify an existingresource
    end

    on_destroy do
      # What do we do to destroy/delete an existingresource
    end

    newparam(:name) do
      include EasyType
      isnamevar

      to_translate_to_resource do | raw_resource|
        raw_resource.column_data(:name)
      end

    end

    newproperty(:version) do
      include EasyType

      to_translate_to_resource do | raw_resource|
        raw_resource.column_data(:version)
      end

    end


  end
end