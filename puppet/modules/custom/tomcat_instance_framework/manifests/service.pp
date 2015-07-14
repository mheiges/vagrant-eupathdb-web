# manage tomcat service

class tomcat_instance_framework::service {

  service { 'tomcat':
    ensure  => running,
    enable  => true,
    require => Package['tomcat-instance-framework'],
  }

}