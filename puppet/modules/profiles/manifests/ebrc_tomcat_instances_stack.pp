
class profiles::ebrc_tomcat_instances_stack {

  include ::profiles::ebrc_java_stack
  include ::profiles::ebrc_tomcat
  include ::ebrc_packages::make
  include ::tomcat_instance_framework

  $global = hiera('tomcat_instance_framework::global')
  tomcat_instance_framework::global_config{ 'tcif':
    catalina_home => $global['catalina_home'],
    java_home     => $global['java_home'],
    instances_dir => $global['instances_dir'],
    oracle_home   => $global['oracle_home'],
    environment   => $global['environment'],
  }

  # hiera_hash because we are merging a hash ":merge_behavior: deeper"
  $instances_data = hiera_hash('tomcat_instance_framework::instances')

  create_resources('tomcat_instance_framework::instance', $instances_data)
  
}