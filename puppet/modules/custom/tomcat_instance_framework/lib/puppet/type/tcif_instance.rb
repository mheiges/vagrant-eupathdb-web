Puppet::Type.newtype(:tcif_instance) do
  desc "Manage instances of Tomcat"

  ensurable do

    # present (exists and running)
    # absent (not exists and not running)
    # disabled (exists and not running)
    # quantum (not exists and running)

    newvalue(:enabled) do
      provider.enable
    end
    aliasvalue(:present, :enabled)

    newvalue(:absent) do
      provider.delete
    end

    newvalue(:disabled) do
      provider.disable
    end

    defaultto :enabled

    def retrieve
      if provider.enabled?
puts "retrieve enabled"
        return :enabled
      elsif provider.enabled_not_running?
puts "retrieve enabled_not_running"
        return :disabled
      elsif provider.disabled?
puts "retrieve disbabled"
        return :disabled
      else
puts "retrieve absent"
        return :absent
      end
    end
  end

  newparam(:instance_name, :namevar => true) do
    desc "Name of Tomcat instance"
    validate do |value|
      if value.start_with?('_')
        raise ArgumentError, "Instance name can not start with '_'." 
      end
    end
  end

  newparam(:http_port) do
    desc "non-SSL HTTP/1.1 Connector port"
    validate do |value|
      validate_port(:http_port, value)
      raise Puppet::Error, "#{http_port} must be defined" if ! defined? value
    end
  end

  newparam(:ajp13_port) do
    desc "AJP/1.3 Connector port"
    validate do |value|
      validate_port(:ajp13_port, value)
      raise Puppet::Error, "#{ajp13_port} must be defined" if ! defined? value
    end
  end

  newparam(:jmx_port) do
    desc "com.sun.management.jmxremote port"
    validate do |value|
      validate_port(:jmx_port, value)
    end
  end

  newparam(:tomcat_user) do
    desc "OS user that owns tomcat jvm process"
  end

  newparam(:template_ver) do
    desc "TcIF template version to use as basis for new instance"
  end

  newparam(:orcl_jdbc_path) do
    desc "Full fileystem path to Oracle JDBC jar file"
  end

  newparam(:pg_jdbc_path) do
    desc "Full fileystem path to PostgreSQL JDBC jar file"
  end

  newparam(:instances_dir) do
    desc "Parent directory for tomcat instances."
    defaultto "/usr/local/tomcat_instances"
  end

end


def validate_port(param, value)
  if value.is_a?(Integer)
      value = value.to_s
  end
  if ! value.to_i.between?(1,65535)
    raise ArgumentError, "#{param} port value must be between 1 and 65535. You requested #{value}."
  end
end
