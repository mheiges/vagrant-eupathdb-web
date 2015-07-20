
class profiles::ebrc_tomcat_instances_stack {

  include ::profiles::ebrc_java_stack
  include ::profiles::ebrc_tomcat
  include ::ebrc_packages::make
  include ::profiles::ebrc_postgresql94_jdbc

  $global = hiera('tomcat_instance_framework::global')
  tomcat_instance_framework::global_config{ 'tcif':
    catalina_home => $global['catalina_home'],
    java_home     => $global['java_home'],
    instances_dir => $global['instances_dir'],
    oracle_home   => $global['oracle_home'],
    environment   => $global['environment'],
  }

  profiles::tomcat_instance{ 'TemplateDB': }

  file { "${global['instances_dir']}/TemplateDB/shared/lib/postgresql-jdbc.jar":
    source  => '/usr/share/java/postgresql94-jdbc.jar',
    links   => 'follow',
    require => Class['profiles::ebrc_postgresql94_jdbc'],
    notify  => Service["tcif-TemplateDB"],
  }

}