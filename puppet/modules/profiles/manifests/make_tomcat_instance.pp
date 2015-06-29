# install ToxoDB tomcat instance using the Tomcat Instance Framework

define profiles::make_tomcat_instance($ensure) {

  include tomcat_instance_framework

  $instances_data = hiera('tomcat_instance_framework::instances')

  $http_port      = $instances_data[$name]['http_port']
  $ajp13_port     = $instances_data[$name]['ajp13_port']
  $jmx_port       = $instances_data[$name]['jmx_port']
  $tomcat_user    = $instances_data[$name]['tomcat_user']
  $template_ver   = $instances_data[$name]['template_ver']
  $orcl_jdbc_path = $instances_data[$name]['orcl_jdbc_path']
  $pg_jdbc_path   = $instances_data[$name]['pg_jdbc_path']


  tcif_instance { $name:
    ensure         => $ensure,
    http_port      => $http_port,
    ajp13_port     => $ajp13_port,
    jmx_port       => $jmx_port,
    tomcat_user    => $tomcat_user,
    template_ver   => $template_ver,
    orcl_jdbc_path => $orcl_jdbc_path,
    pg_jdbc_path   => $pg_jdbc_path,
    require        => Class['tomcat_instance_framework'],
  }

}
