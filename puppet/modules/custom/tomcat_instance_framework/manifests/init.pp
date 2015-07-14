# Install Tomcat Instance Framework and manage its service

class tomcat_instance_framework {

  contain tomcat_instance_framework::install
  contain tomcat_instance_framework::service

  Class['::tomcat_instance_framework::install'] ->
  Class['::tomcat_instance_framework::service']

}
