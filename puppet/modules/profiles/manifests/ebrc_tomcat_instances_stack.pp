
class profiles::ebrc_tomcat_instances_stack {

  include ::profiles::ebrc_java_stack
  include ::profiles::ebrc_tomcat
  include ::profiles::ebrc_postgresql94

  $global = hiera('tomcat_instance_framework::global')

  tomcat_instance_framework::global_config{ 'tcif':
    catalina_home => $global['catalina_home'],
    java_home     => $global['java_home'],
    instances_dir => $global['instances_dir'],
    oracle_home   => $global['oracle_home'],
    environment   => $global['environment'],
  }

  profiles::tomcat_instance{ ['TemplateDB', 'FooDB']:
    require => Class['::profiles::ebrc_postgresql94'],
  }

  profiles::tomcat_instance{ ['TooDB']:
    require => Class['::profiles::ebrc_postgresql94'],
  }

}