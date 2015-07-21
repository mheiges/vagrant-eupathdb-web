
define tomcat_instance_framework::tomcat_instance() {

  include tomcat_instance_framework

  $instances_data = hiera('tomcat_instance_framework::instances')

  $ensure         = $instances_data[$name]['ensure']
  $http_port      = $instances_data[$name]['http_port']
  $ajp13_port     = $instances_data[$name]['ajp13_port']
  $jmx_port       = $instances_data[$name]['jmx_port']
  $tomcat_user    = $instances_data[$name]['tomcat_user']
  $template_ver   = $instances_data[$name]['template_ver']
  $orcl_jdbc_path = $instances_data[$name]['orcl_jdbc_path']
  $pg_jdbc_path   = $instances_data[$name]['pg_jdbc_path']
  $world_readable = $instances_data[$name]['world_readable']
  $environment    = $instances_data[$name]['environment']
  $public_logs    = $instances_data[$name]['public_logs']

  tomcat_instance_framework::instance { $name:
    ensure         => $ensure,
    http_port      => $http_port,
    ajp13_port     => $ajp13_port,
    jmx_port       => $jmx_port,
    tomcat_user    => $tomcat_user,
    template_ver   => $template_ver,
    orcl_jdbc_path => $orcl_jdbc_path,
    pg_jdbc_path   => $pg_jdbc_path,
    environment    => $environment,
    public_logs    => $public_logs,
    config_file    => template('tomcat_instance_framework/instance.env.erb'),
    require        => Class['tomcat_instance_framework'],
  }

}