#require 'puppet/util/resource_template'
#require 'puppet/parser/functions'

Puppet::Type.newtype(:tcif_instance, :self_refresh => true) do
  desc "Manage instances of Tomcat"

#  def generate
#    puts "generate"
#    provider.config_file
#  end

  def refresh 
   if (@parameters[:ensure].value == :running)
      provider.restart
    else
      debug "Skipping restart; service is not running"
    end
  end

  ensurable do

    # running (exists and running)
    # stopped (exists and not running)
    # absent (not exists and not running)

    newvalue(:running) do
      provider.set_present_and_running
    end
    aliasvalue(:present, :running)

    newvalue(:stopped) do
      provider.set_present_and_stopped
    end

    newvalue(:absent) do
      provider.delete
    end

    defaultto :running

    def retrieve
      if provider.present_and_running?
        return :running
      elsif provider.present_and_stopped?
        return :stopped
      else
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
      resource.validate_port(:http_port, value)
      raise Puppet::Error, "#{http_port} must be defined" if ! defined? value
    end
  end

  newparam(:ajp13_port) do
    desc "AJP/1.3 Connector port"
    validate do |value|
      resource.validate_port(:ajp13_port, value)
      raise Puppet::Error, "#{ajp13_port} must be defined" if ! defined? value
    end
  end

  newproperty(:world_readable, :boolean => true) do
    desc "whether instance directories are world readable"
    newvalue(:true)
    newvalue(:false)
    defaultto :false
    munge do |value|
      @resource.munge_boolean(value)
    end
  end

  newparam(:jmx_port) do
    desc "com.sun.management.jmxremote port"
    validate do |value|
      resource.validate_port(:jmx_port, value)
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

  newparam(:environment) do
    desc "additional environment for instance.env configuration."
    defaultto ""
  end

  newparam(:config_file) do
    desc "Instance configuration content."
  end

  autorequire(:tomcat_user) do
    self[:tomcat_user]
  end

  def munge_boolean(value)
    case value
    when true, "true", :true
      :true
    when false, "false", :false
      :false
    else
      fail("munge_boolean only takes booleans")
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

end
