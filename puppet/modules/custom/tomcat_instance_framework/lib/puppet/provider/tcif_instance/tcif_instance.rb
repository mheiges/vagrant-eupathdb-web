Puppet::Type.type(:tcif_instance).provide(:tcif_instance) do

  commands :make => "make", :instance_manager => "instance_manager", :echo => "echo"

  # return true if instance directory exists and jsvc process running
  def present_and_running?
    return active_instance_dir_exists? && running?
  end

  # return true if instance directory exists and jsvc process not running
  def present_and_stopped?
    return inactive_instance_dir_exists?
  end

  # return true if instance directory exists without '_' prefix
  def active_instance_dir_exists?
    return File.directory?( @resource['instances_dir'] + "/" + @resource[:name] )
  end

  # instance directory exists with '_' prefix
  def inactive_instance_dir_exists?
    return File.directory?( @resource['instances_dir'] + "/" + "_" + @resource[:name] )
  end

  # return true if jsvc process is running
  def running?
    execpipe("#{command(:instance_manager)} status") do |out|
      out.each_line do |line|
        if line =~ /^#{@resource[:name]}\s+\d+/
          return true
        end
      end
    end
    return false
  end
  
  def instance_path
    if active_instance_dir_exists?
      return @resource['instances_dir'] + "/" + @resource[:name]
    elsif inactive_instance_dir_exists?
      return @resource['instances_dir'] + "/" + "_" + @resource[:name]
    else
      return nil
    end
  end

  # remove a tomcat instance by deleting its directory and contents.
  # If the instance is running it will be stopped before deletion.
  # If the instance is disabled (named with leading underscore) it will be 
  # assumed to be already not running and its directory will be deleted.
  # If the instance does not exist, there is no action.
  def delete
    stop
    [ @resource['instances_dir'] + "/" + @resource[:name],
      @resource['instances_dir'] + "/" + "_" + @resource[:name]
    ].each do |dir|
      FileUtils.rm_rf(dir) if File.directory?(dir)
    end
  end

  # ensure 1. instance directory is present, either by creating a new instance
  # or renaming the directory of a stopped instance to remove the leading '_'.
  # and 2. a jsvc process is running for the instance.
  def set_present_and_running
    if active_instance_dir_exists?
      return if running?
    elsif inactive_instance_dir_exists?
      activate_instance_dir
    else
      make_instance
    end
    start
  end

  # ensure an instance exists in the `stopped` state
  #  - jsvc process not running
  #  - instance directory named with leading '_'.
  def set_present_and_stopped
    if inactive_instance_dir_exists? && active_instance_dir_exists?
      raise Puppet::Error,
        "Both active and inactive directories exist for " +
        "Tomcat instance #{resource[:name]}. I'm unable to resolve this conflict."
    end
    if inactive_instance_dir_exists?
      return
    elsif active_instance_dir_exists?
      stop
    else
      make_instance
    end
    deactivate_instance_dir
  end

  # start an instance. The instance directory must exist and not
  # be named with a leading '_'.
  def start
    puts "Starting #{@resource[:name]}"
    return if running?
    cmd = [command(:instance_manager)]
    cmd += ["start"]
    cmd += [@resource[:name]]
    run(cmd)
  end

  # Stop a tomcat instance if it is present and running.
  # instance_manager does not support stopping an instance that is not enabled.
  # instance_manager does not support checking if a disable instance is running.
  def stop(force = true)
    return if ! active_instance_dir_exists?
    return if ! running?
    puts "Stopping #{@resource[:name]}"
    cmd = [command(:instance_manager)]
    cmd += ["stop"]
    cmd += [@resource[:name]]
    cmd += ["force"] if force
    run(cmd)
 end

  # disable a tomcat instance by renaming with leading underscore (_).
  # If the instance is running it will be stopped before disabling.
  # If the instance does not exist, it will be created, then disabled.
  def deactivate_instance_dir
    if running?
      stop
    end
    Dir.chdir(@resource['instances_dir'])
    File.rename @resource[:name], "_" + @resource[:name]
  end

  # enable a disabled tomcat instance by renaming without leading
  # underscore (_). If the instance is not running it will be started.
  # If the instance does not exist, it will be created.
  def activate_instance_dir
    return if active_instance_dir_exists?
    if inactive_instance_dir_exists?
      Dir.chdir(@resource['instances_dir'])
      File.rename "_" + @resource[:name], @resource[:name]
    end
  end

  def make_instance
    return if active_instance_dir_exists? or inactive_instance_dir_exists?
    Dir.chdir(@resource['instances_dir'])
    cmd = [command(:make)]
    cmd += ["install"]
    cmd += ["INSTANCE=#{@resource[:name]}"]
    cmd += ["HTTP_PORT=#{@resource[:http_port]}"]
    cmd += ["AJP13_PORT=#{@resource[:ajp13_port]}"]
    cmd += ["JMX_PORT=#{@resource[:jmx_port]}"]
    cmd += ["TOMCAT_USER=#{@resource[:tomcat_user]}"]
    cmd += ["TEMPLATE=#{@resource[:template_ver]}"]
    if defined? @resource[:orcl_jdbc_path]
      cmd += ["ORCL_JDBC_PATH=#{@resource[:orcl_jdbc_path]}"]  
    end
    if defined? @resource[:pg_jdbc_path]
      cmd += ["PG_JDBC_PATH=#{@resource[:pg_jdbc_path]}"]  
    end
    run(cmd)
  end

  def world_readable
    # not implemented
    return @resource[:world_readable]
    #return :true
  end

  def world_readable=(value)
    return
   # path = instance_path()
   # puts "MAKE WORLD READABLE #{value} for " + path
    #setmode('0755', path)
  end

  # from PuppetLabs posix.rb
  def setmode(value, path)
    puts " set mode #{value} on #{path}"
    begin
      File.chmod(value.to_i(8), path)
    rescue => detail
      error = Puppet::Error.new("failed to set mode #{value} on #{path}: #{detail.message}")
      error.set_backtrace detail.backtrace
      raise error
    end
  end

  def run(cmd)
    execute(cmd)
  rescue Puppet::ExecutionFailure => detail
    raise Puppet::Error, "command returned non-zero for class '#{@resource.class.name}', name '#{@resource.name}': #{detail}", detail.backtrace
  end

end