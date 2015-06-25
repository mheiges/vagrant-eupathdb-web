# Create an instance of Tomcat.
# Requires puppetlabs/stdlib module for parameter validation.

define tomcat_instance_framework::instance (
  $instance_name = undef,
  $http_port = undef,
  $ajp13_port = undef,
  $jmx_port = undef,
  $tomcat_user = undef,
  $template_ver = undef,
  $orcl_jdbc_path = undef,
  $pg_jdbc_path = undef,
  $instances_dir = '/usr/local/tomcat_instances',
) {

  if $instance_name == undef { fail("'instance_name' is not defined") }
  if $http_port == undef { fail("'http_port' is not defined") }
  if $ajp13_port == undef { fail("'ajp13_port' is not defined") }
  #if $jmx_port == undef { fail("'jmx_port' is not defined") }
  if $tomcat_user == undef { fail("'tomcat_user' is not defined") }
  if $template_ver == undef { fail("'template_ver' is not defined") }

  if $orcl_jdbc_path {
    validate_absolute_path($orcl_jdbc_path)
  }

  if $pg_jdbc_path {
    validate_absolute_path($pg_jdbc_path)
  }

  if $instances_dir {
    validate_absolute_path($instances_dir)
  }

  $make_cmd = "make install                   \
    INSTANCE=${instance_name}                   \
    HTTP_PORT=${http_port}                      \
    AJP13_PORT=${ajp13_port}                    \
    JMX_PORT=${jmx_port}                        \
    TOMCAT_USER=${tomcat_user}                  \
    TEMPLATE=${template_ver}
  "
  exec { "make ${instance_name}":
    command => $make_cmd,
    path    => ['/usr/local/bin', '/bin', '/usr/bin'],
    cwd     => $instances_dir,
    creates => "${instances_dir}/${instance_name}",
  }

}