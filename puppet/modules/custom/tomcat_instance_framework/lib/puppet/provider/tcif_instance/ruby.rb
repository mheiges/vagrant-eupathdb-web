Puppet::Type.type(:tcif_instance).provide(:ruby) do

  commands :make => "make", :date => "date"

  def exists?
    return (
      File.directory?( @resource['instances_dir'] + "/" + @resource[:name] ) or
      File.directory?( @resource['instances_dir'] + "/" + "_" + @resource[:name] ) # underscored name disables the instance
    )
  end

  def delete
    if  @resource[:name].empty? 
      raise Puppet::Error, "The impossible happened. The resource name is empty. Aborting..."
    end
    [ @resource['instances_dir'] + "/" + @resource[:name],
      @resource['instances_dir'] + "/" + "_" + @resource[:name]
    ].each do |dir|
      FileUtils.rm_rf(dir) if File.directory?(dir)
    end
  end
  
  def create
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

  def run(cmd)
    execute(cmd)
  rescue Puppet::ExecutionFailure => detail
    raise Puppet::Error, "command returned non-zero for class '#{@resource.class.name}', name '#{@resource.name}': #{detail}", detail.backtrace
  end

end