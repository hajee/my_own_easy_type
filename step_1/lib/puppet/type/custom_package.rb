require 'easy_type'

module Puppet
  newtype(:custom_package) do
    include EasyType

    # set_command(:the_righ_command)

    ensurable

    to_get_raw_resources do
      # What commando to give to get a list of all resource.
      # We need to return an Array of Hashes
      []
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
        # how to translate from the Hash-like raw resource to get the name
        # raw_resource.column_data(:name)
      end

    end

  end
end