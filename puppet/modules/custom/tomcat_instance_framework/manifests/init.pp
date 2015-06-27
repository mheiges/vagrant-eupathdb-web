
class tomcat_instance_framework {

  contain tomcat_instance_framework::install
  contain tomcat_instance_framework::config
  contain tomcat_instance_framework::service

  Class['::tomcat_instance_framework::install'] ->
  Class['::tomcat_instance_framework::config'] ->
  Class['::tomcat_instance_framework::service']

}
