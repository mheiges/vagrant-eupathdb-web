
class profiles::ebrc_tomcat_instances_stack {

  include ::profiles::ebrc_java_stack
  include ::profiles::ebrc_tomcat
  include ::profiles::ebrc_postgresql94

  profiles::make_tomcat_instance{ ['TemplateDB', 'FooDB']:
    require => Class['::profiles::ebrc_postgresql94'],
  }

}