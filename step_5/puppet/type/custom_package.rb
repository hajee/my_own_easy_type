require 'easy_type'

module Puppet
  newtype(:custom_package) do
    include EasyType

    set_command [:rpm, :yum]

    ensurable

    to_get_raw_resources do
      packages_string = rpm('-qa','--qf','%{NAME}, %{VERSION}\n')
      convert_csv_data_to_hash(packages_string,[:name, :version])
    end

    on_create do |command_builder|
      command_builder.add do
        yum "install -y #{name}"
      end
    end

    on_modify do
      # What do we do to modify an existingresource
    end

    on_destroy do | command_builder|
      command_builder.add do
        yum "erase -y #{name}"
      end
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

      on_apply do |command_builder| 
        command_builder.append do
          "-#{version}"
        end
      end


      to_translate_to_resource do | raw_resource|
        raw_resource.column_data(:version)
      end

    end


  end
end