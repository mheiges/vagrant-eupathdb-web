module Puppet
  newtype(:tcif_instance_conf) do

    @doc = "This type allows puppet to manage instance.env parameters."

    newparam(:name) do
      desc "The instance name to manage."
      isnamevar
    end

    newproperty(:target) do
      desc "The path to instance.env"
      defaultto {
        if @resource.class.defaultprovider.ancestors.include?(Puppet::Provider::ParsedFile)
          @resource.class.defaultprovider.default_target
        else
          nil
        end
      }
    end

  end
end