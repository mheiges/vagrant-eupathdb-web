
class tomcat_instance_framework::install {
  package { 'tomcat-instance-framework':
    ensure => installed,
  }
}